/***** TAKE NOTE ******
This is a hack to get genType to work!

In order for genType to produce recursive types, it needs to be at the 
root module of a file. If it's defined in a nested module it does not 
work. So all the MockDb types and internal functions are defined in TestHelpers_MockDb
and only public functions are recreated and exported from this module.

the following module:
```rescript
module MyModule = {
  @genType
  type rec a = {fieldB: b}
  @genType and b = {fieldA: a}
}
```

produces the following in ts:
```ts
// tslint:disable-next-line:interface-over-type-literal
export type MyModule_a = { readonly fieldB: b };

// tslint:disable-next-line:interface-over-type-literal
export type MyModule_b = { readonly fieldA: MyModule_a };
```

fieldB references type b which doesn't exist because it's defined
as MyModule_b
*/

module MockDb = {
  @genType
  let createMockDb = TestHelpers_MockDb.createMockDb
}

@genType
module Addresses = {
  include TestHelpers_MockAddresses
}

module EventFunctions = {
  //Note these are made into a record to make operate in the same way
  //for Res, JS and TS.

  /**
  The arguements that get passed to a "processEvent" helper function
  */
  @genType
  type eventProcessorArgs<'event> = {
    event: 'event,
    mockDb: TestHelpers_MockDb.t,
    chainId?: int,
  }

  @genType
  type eventProcessor<'event> = eventProcessorArgs<'event> => promise<TestHelpers_MockDb.t>

  /**
  A function composer to help create individual processEvent functions
  */
  let makeEventProcessor = (~contractName, ~eventName, ~handlerRegister, ~paramsRawEventSchema) => {
    async args => {
      let {event, mockDb, ?chainId} = args->(Utils.magic: eventProcessorArgs<'event> => eventProcessorArgs<Internal.event>)
      let paramsRawEventSchema = paramsRawEventSchema->(Utils.magic: S.t<'eventArgs> => S.t<Internal.eventParams>)

      let config = RegisterHandlers.getConfig()

      // The user can specify a chainId of an event or leave it off
      // and it will default to the first chain in the config
      let chain = switch chainId {
      | Some(chainId) => config->Config.getChain(~chainId)
      | None =>
        switch config.defaultChain {
        | Some(chainConfig) => chainConfig.chain
        | None =>
          Js.Exn.raiseError(
            "No default chain Id found, please add at least 1 chain to your config.yaml",
          )
        }
      }

      //Create an individual logging context for traceability
      let logger = Logging.createChild(
        ~params={
          "Context": `Test Processor for "${eventName}" event on contract "${contractName}"`,
          "Chain ID": chain->ChainMap.Chain.toChainId,
          "event": event,
        },
      )

      //Deep copy the data in mockDb, mutate the clone and return the clone
      //So no side effects occur here and state can be compared between process
      //steps
      let mockDbClone = mockDb->TestHelpers_MockDb.cloneMockDb

      if !(handlerRegister->Types.HandlerTypes.Register.hasRegistration) {
        Not_found->ErrorHandling.mkLogAndRaise(
          ~logger,
          ~msg=`No registered handler found for "${eventName}" on contract "${contractName}"`,
        )
      }
      //Construct a new instance of an in memory store to run for the given event
      let inMemoryStore = InMemoryStore.make()
      let loadLayer = LoadLayer.make(
        ~loadEntitiesByIds=TestHelpers_MockDb.makeLoadEntitiesByIds(mockDbClone),
        ~loadEntitiesByField=TestHelpers_MockDb.makeLoadEntitiesByField(mockDbClone),
      )

      //No need to check contract is registered or return anything.
      //The only purpose is to test the registerContract function and to
      //add the entity to the in memory store for asserting registrations

      let loader = handlerRegister->Types.HandlerTypes.Register.getLoader
      let handler = handlerRegister->Types.HandlerTypes.Register.getHandler
      let eventItem: Internal.eventItem = {
        event,
        eventName,
        contractName,
        loader,
        handler,
        contractRegister: handlerRegister->Types.HandlerTypes.Register.getContractRegister,
        paramsRawEventSchema,
        chain,
        logIndex: event.logIndex,
        timestamp: event.block->Types.Block.getTimestamp,
        blockNumber: event.block->Types.Block.getNumber,
      }

      switch handlerRegister->Types.HandlerTypes.Register.getContractRegister {
      | Some(contractRegister) =>
        switch contractRegister->EventProcessing.runEventContractRegister(
          ~logger,
          ~eventItem,
          ~checkContractIsRegistered=(~chain as _, ~contractAddress as _, ~contractName as _) =>
            false,
          ~dynamicContractRegistrations=None,
          ~inMemoryStore,
          ~shouldSaveHistory=false,
        ) {
        | Ok(_) => ()
        | Error(e) => e->ErrorHandling.logAndRaise
        }
      | None => () //No need to run contract registration
      }

      switch handler {
      | Some(handler) =>
        switch await eventItem->EventProcessing.runEventHandler(
          ~inMemoryStore,
          ~loader,
          ~handler,
          ~loadLayer,
          ~logger,
          ~shouldSaveHistory=false,
        ) {
        | Ok(_) => ()
        | Error(e) => e->ErrorHandling.logAndRaise
        }
      | None => () //No need to run handler
      }

      //In mem store can still contatin raw events and dynamic contracts for the
      //testing framework in cases where either contract register or loaderHandler
      //is None
      mockDbClone->TestHelpers_MockDb.writeFromMemoryStore(~inMemoryStore)
      mockDbClone
    }
  }

  module MockBlock = {
    @genType
    type t = {
      hash?: string,
      timestamp?: int,
      number?: int,
    }

    let toBlock = (_mock: t) => {
      hash: _mock.hash->Belt.Option.getWithDefault("foo"),
      timestamp: _mock.timestamp->Belt.Option.getWithDefault(0),
      number: _mock.number->Belt.Option.getWithDefault(0),
    }->(Utils.magic: Types.AggregatedBlock.t => Internal.eventBlock)
  }

  module MockTransaction = {
    @genType
    type t = {
    }

    let toTransaction = (_mock: t) => {
    }->(Utils.magic: Types.AggregatedTransaction.t => Internal.eventTransaction)
  }

  @genType
  type mockEventData = {
    chainId?: int,
    srcAddress?: Address.t,
    logIndex?: int,
    block?: MockBlock.t,
    transaction?: MockTransaction.t,
  }

  /**
  Applies optional paramters with defaults for all common eventLog field
  */
  let makeEventMocker = (
    ~params: Internal.eventParams,
    ~mockEventData: option<mockEventData>,
  ): Internal.event => {
    let {?block, ?transaction, ?srcAddress, ?chainId, ?logIndex} =
      mockEventData->Belt.Option.getWithDefault({})
    let block = block->Belt.Option.getWithDefault({})->MockBlock.toBlock
    let transaction = transaction->Belt.Option.getWithDefault({})->MockTransaction.toTransaction
    {
      params,
      transaction,
      chainId: chainId->Belt.Option.getWithDefault(1),
      block,
      srcAddress: srcAddress->Belt.Option.getWithDefault(Addresses.defaultAddress),
      logIndex: logIndex->Belt.Option.getWithDefault(0),
    }
  }
}


module FiatTokenProxy = {
  module AdminChanged = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.AdminChanged.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.AdminChanged.name,
      ~handlerRegister=Types.FiatTokenProxy.AdminChanged.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.AdminChanged.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("previousAdmin")
      previousAdmin?: Address.t,
      @as("newAdmin")
      newAdmin?: Address.t,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?previousAdmin,
        ?newAdmin,
        ?mockEventData,
      } = args

      let params = 
      {
       previousAdmin: previousAdmin->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
       newAdmin: newAdmin->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
      }
->(Utils.magic: Types.FiatTokenProxy.AdminChanged.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.AdminChanged.event)
    }
  }

  module Approval = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.Approval.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.Approval.name,
      ~handlerRegister=Types.FiatTokenProxy.Approval.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.Approval.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("owner")
      owner?: Address.t,
      @as("spender")
      spender?: Address.t,
      @as("value")
      value?: bigint,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?owner,
        ?spender,
        ?value,
        ?mockEventData,
      } = args

      let params = 
      {
       owner: owner->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
       spender: spender->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
       value: value->Belt.Option.getWithDefault(0n),
      }
->(Utils.magic: Types.FiatTokenProxy.Approval.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.Approval.event)
    }
  }

  module AuthorizationCanceled = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.AuthorizationCanceled.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.AuthorizationCanceled.name,
      ~handlerRegister=Types.FiatTokenProxy.AuthorizationCanceled.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.AuthorizationCanceled.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("authorizer")
      authorizer?: Address.t,
      @as("nonce")
      nonce?: string,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?authorizer,
        ?nonce,
        ?mockEventData,
      } = args

      let params = 
      {
       authorizer: authorizer->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
       nonce: nonce->Belt.Option.getWithDefault("foo"),
      }
->(Utils.magic: Types.FiatTokenProxy.AuthorizationCanceled.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.AuthorizationCanceled.event)
    }
  }

  module AuthorizationUsed = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.AuthorizationUsed.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.AuthorizationUsed.name,
      ~handlerRegister=Types.FiatTokenProxy.AuthorizationUsed.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.AuthorizationUsed.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("authorizer")
      authorizer?: Address.t,
      @as("nonce")
      nonce?: string,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?authorizer,
        ?nonce,
        ?mockEventData,
      } = args

      let params = 
      {
       authorizer: authorizer->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
       nonce: nonce->Belt.Option.getWithDefault("foo"),
      }
->(Utils.magic: Types.FiatTokenProxy.AuthorizationUsed.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.AuthorizationUsed.event)
    }
  }

  module Blacklisted = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.Blacklisted.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.Blacklisted.name,
      ~handlerRegister=Types.FiatTokenProxy.Blacklisted.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.Blacklisted.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("_account")
      _account?: Address.t,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?_account,
        ?mockEventData,
      } = args

      let params = 
      {
       _account: _account->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
      }
->(Utils.magic: Types.FiatTokenProxy.Blacklisted.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.Blacklisted.event)
    }
  }

  module BlacklisterChanged = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.BlacklisterChanged.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.BlacklisterChanged.name,
      ~handlerRegister=Types.FiatTokenProxy.BlacklisterChanged.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.BlacklisterChanged.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("newBlacklister")
      newBlacklister?: Address.t,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?newBlacklister,
        ?mockEventData,
      } = args

      let params = 
      {
       newBlacklister: newBlacklister->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
      }
->(Utils.magic: Types.FiatTokenProxy.BlacklisterChanged.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.BlacklisterChanged.event)
    }
  }

  module Burn = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.Burn.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.Burn.name,
      ~handlerRegister=Types.FiatTokenProxy.Burn.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.Burn.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("burner")
      burner?: Address.t,
      @as("amount")
      amount?: bigint,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?burner,
        ?amount,
        ?mockEventData,
      } = args

      let params = 
      {
       burner: burner->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
       amount: amount->Belt.Option.getWithDefault(0n),
      }
->(Utils.magic: Types.FiatTokenProxy.Burn.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.Burn.event)
    }
  }

  module MasterMinterChanged = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.MasterMinterChanged.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.MasterMinterChanged.name,
      ~handlerRegister=Types.FiatTokenProxy.MasterMinterChanged.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.MasterMinterChanged.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("newMasterMinter")
      newMasterMinter?: Address.t,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?newMasterMinter,
        ?mockEventData,
      } = args

      let params = 
      {
       newMasterMinter: newMasterMinter->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
      }
->(Utils.magic: Types.FiatTokenProxy.MasterMinterChanged.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.MasterMinterChanged.event)
    }
  }

  module Mint = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.Mint.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.Mint.name,
      ~handlerRegister=Types.FiatTokenProxy.Mint.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.Mint.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("minter")
      minter?: Address.t,
      @as("to")
      to?: Address.t,
      @as("amount")
      amount?: bigint,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?minter,
        ?to,
        ?amount,
        ?mockEventData,
      } = args

      let params = 
      {
       minter: minter->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
       to: to->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
       amount: amount->Belt.Option.getWithDefault(0n),
      }
->(Utils.magic: Types.FiatTokenProxy.Mint.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.Mint.event)
    }
  }

  module MinterConfigured = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.MinterConfigured.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.MinterConfigured.name,
      ~handlerRegister=Types.FiatTokenProxy.MinterConfigured.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.MinterConfigured.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("minter")
      minter?: Address.t,
      @as("minterAllowedAmount")
      minterAllowedAmount?: bigint,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?minter,
        ?minterAllowedAmount,
        ?mockEventData,
      } = args

      let params = 
      {
       minter: minter->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
       minterAllowedAmount: minterAllowedAmount->Belt.Option.getWithDefault(0n),
      }
->(Utils.magic: Types.FiatTokenProxy.MinterConfigured.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.MinterConfigured.event)
    }
  }

  module MinterRemoved = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.MinterRemoved.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.MinterRemoved.name,
      ~handlerRegister=Types.FiatTokenProxy.MinterRemoved.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.MinterRemoved.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("oldMinter")
      oldMinter?: Address.t,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?oldMinter,
        ?mockEventData,
      } = args

      let params = 
      {
       oldMinter: oldMinter->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
      }
->(Utils.magic: Types.FiatTokenProxy.MinterRemoved.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.MinterRemoved.event)
    }
  }

  module OwnershipTransferred = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.OwnershipTransferred.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.OwnershipTransferred.name,
      ~handlerRegister=Types.FiatTokenProxy.OwnershipTransferred.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.OwnershipTransferred.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("previousOwner")
      previousOwner?: Address.t,
      @as("newOwner")
      newOwner?: Address.t,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?previousOwner,
        ?newOwner,
        ?mockEventData,
      } = args

      let params = 
      {
       previousOwner: previousOwner->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
       newOwner: newOwner->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
      }
->(Utils.magic: Types.FiatTokenProxy.OwnershipTransferred.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.OwnershipTransferred.event)
    }
  }

  module Pause = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.Pause.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.Pause.name,
      ~handlerRegister=Types.FiatTokenProxy.Pause.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.Pause.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?mockEventData,
      } = args

      let params = 
      ()
      ->(Utils.magic: Types.FiatTokenProxy.Pause.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.Pause.event)
    }
  }

  module PauserChanged = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.PauserChanged.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.PauserChanged.name,
      ~handlerRegister=Types.FiatTokenProxy.PauserChanged.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.PauserChanged.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("newAddress")
      newAddress?: Address.t,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?newAddress,
        ?mockEventData,
      } = args

      let params = 
      {
       newAddress: newAddress->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
      }
->(Utils.magic: Types.FiatTokenProxy.PauserChanged.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.PauserChanged.event)
    }
  }

  module RescuerChanged = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.RescuerChanged.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.RescuerChanged.name,
      ~handlerRegister=Types.FiatTokenProxy.RescuerChanged.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.RescuerChanged.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("newRescuer")
      newRescuer?: Address.t,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?newRescuer,
        ?mockEventData,
      } = args

      let params = 
      {
       newRescuer: newRescuer->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
      }
->(Utils.magic: Types.FiatTokenProxy.RescuerChanged.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.RescuerChanged.event)
    }
  }

  module Transfer = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.Transfer.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.Transfer.name,
      ~handlerRegister=Types.FiatTokenProxy.Transfer.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.Transfer.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("from")
      from?: Address.t,
      @as("to")
      to?: Address.t,
      @as("value")
      value?: bigint,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?from,
        ?to,
        ?value,
        ?mockEventData,
      } = args

      let params = 
      {
       from: from->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
       to: to->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
       value: value->Belt.Option.getWithDefault(0n),
      }
->(Utils.magic: Types.FiatTokenProxy.Transfer.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.Transfer.event)
    }
  }

  module UnBlacklisted = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.UnBlacklisted.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.UnBlacklisted.name,
      ~handlerRegister=Types.FiatTokenProxy.UnBlacklisted.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.UnBlacklisted.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("_account")
      _account?: Address.t,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?_account,
        ?mockEventData,
      } = args

      let params = 
      {
       _account: _account->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
      }
->(Utils.magic: Types.FiatTokenProxy.UnBlacklisted.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.UnBlacklisted.event)
    }
  }

  module Unpause = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.Unpause.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.Unpause.name,
      ~handlerRegister=Types.FiatTokenProxy.Unpause.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.Unpause.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?mockEventData,
      } = args

      let params = 
      ()
      ->(Utils.magic: Types.FiatTokenProxy.Unpause.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.Unpause.event)
    }
  }

  module Upgraded = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.FiatTokenProxy.Upgraded.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.FiatTokenProxy.contractName,
      ~eventName=Types.FiatTokenProxy.Upgraded.name,
      ~handlerRegister=Types.FiatTokenProxy.Upgraded.handlerRegister,
      ~paramsRawEventSchema=Types.FiatTokenProxy.Upgraded.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("implementation")
      implementation?: Address.t,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?implementation,
        ?mockEventData,
      } = args

      let params = 
      {
       implementation: implementation->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
      }
->(Utils.magic: Types.FiatTokenProxy.Upgraded.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.FiatTokenProxy.Upgraded.event)
    }
  }

}


module TokenMintERC20Token = {
  module Approval = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.TokenMintERC20Token.Approval.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.TokenMintERC20Token.contractName,
      ~eventName=Types.TokenMintERC20Token.Approval.name,
      ~handlerRegister=Types.TokenMintERC20Token.Approval.handlerRegister,
      ~paramsRawEventSchema=Types.TokenMintERC20Token.Approval.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("owner")
      owner?: Address.t,
      @as("spender")
      spender?: Address.t,
      @as("value")
      value?: bigint,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?owner,
        ?spender,
        ?value,
        ?mockEventData,
      } = args

      let params = 
      {
       owner: owner->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
       spender: spender->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
       value: value->Belt.Option.getWithDefault(0n),
      }
->(Utils.magic: Types.TokenMintERC20Token.Approval.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.TokenMintERC20Token.Approval.event)
    }
  }

  module Transfer = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.TokenMintERC20Token.Transfer.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.TokenMintERC20Token.contractName,
      ~eventName=Types.TokenMintERC20Token.Transfer.name,
      ~handlerRegister=Types.TokenMintERC20Token.Transfer.handlerRegister,
      ~paramsRawEventSchema=Types.TokenMintERC20Token.Transfer.paramsRawEventSchema,
    )

    @genType
    type createMockArgs = {
      @as("from")
      from?: Address.t,
      @as("to")
      to?: Address.t,
      @as("value")
      value?: bigint,
      mockEventData?: EventFunctions.mockEventData,
    }

    @genType
    let createMockEvent = args => {
      let {
        ?from,
        ?to,
        ?value,
        ?mockEventData,
      } = args

      let params = 
      {
       from: from->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
       to: to->Belt.Option.getWithDefault(TestHelpers_MockAddresses.defaultAddress),
       value: value->Belt.Option.getWithDefault(0n),
      }
->(Utils.magic: Types.TokenMintERC20Token.Transfer.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.TokenMintERC20Token.Transfer.event)
    }
  }

}

