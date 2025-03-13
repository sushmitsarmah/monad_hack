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


module CHOGTokenMintERC20Token = {
  module Approval = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.CHOGTokenMintERC20Token.Approval.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.CHOGTokenMintERC20Token.contractName,
      ~eventName=Types.CHOGTokenMintERC20Token.Approval.name,
      ~handlerRegister=Types.CHOGTokenMintERC20Token.Approval.handlerRegister,
      ~paramsRawEventSchema=Types.CHOGTokenMintERC20Token.Approval.paramsRawEventSchema,
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
->(Utils.magic: Types.CHOGTokenMintERC20Token.Approval.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.CHOGTokenMintERC20Token.Approval.event)
    }
  }

  module Transfer = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.CHOGTokenMintERC20Token.Transfer.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.CHOGTokenMintERC20Token.contractName,
      ~eventName=Types.CHOGTokenMintERC20Token.Transfer.name,
      ~handlerRegister=Types.CHOGTokenMintERC20Token.Transfer.handlerRegister,
      ~paramsRawEventSchema=Types.CHOGTokenMintERC20Token.Transfer.paramsRawEventSchema,
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
->(Utils.magic: Types.CHOGTokenMintERC20Token.Transfer.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.CHOGTokenMintERC20Token.Transfer.event)
    }
  }

}


module DAKTokenMintERC20Token = {
  module Approval = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.DAKTokenMintERC20Token.Approval.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.DAKTokenMintERC20Token.contractName,
      ~eventName=Types.DAKTokenMintERC20Token.Approval.name,
      ~handlerRegister=Types.DAKTokenMintERC20Token.Approval.handlerRegister,
      ~paramsRawEventSchema=Types.DAKTokenMintERC20Token.Approval.paramsRawEventSchema,
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
->(Utils.magic: Types.DAKTokenMintERC20Token.Approval.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.DAKTokenMintERC20Token.Approval.event)
    }
  }

  module Transfer = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.DAKTokenMintERC20Token.Transfer.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.DAKTokenMintERC20Token.contractName,
      ~eventName=Types.DAKTokenMintERC20Token.Transfer.name,
      ~handlerRegister=Types.DAKTokenMintERC20Token.Transfer.handlerRegister,
      ~paramsRawEventSchema=Types.DAKTokenMintERC20Token.Transfer.paramsRawEventSchema,
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
->(Utils.magic: Types.DAKTokenMintERC20Token.Transfer.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.DAKTokenMintERC20Token.Transfer.event)
    }
  }

}


module WETHTokenMintERC20Token = {
  module Approval = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.WETHTokenMintERC20Token.Approval.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.WETHTokenMintERC20Token.contractName,
      ~eventName=Types.WETHTokenMintERC20Token.Approval.name,
      ~handlerRegister=Types.WETHTokenMintERC20Token.Approval.handlerRegister,
      ~paramsRawEventSchema=Types.WETHTokenMintERC20Token.Approval.paramsRawEventSchema,
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
->(Utils.magic: Types.WETHTokenMintERC20Token.Approval.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.WETHTokenMintERC20Token.Approval.event)
    }
  }

  module Transfer = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.WETHTokenMintERC20Token.Transfer.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.WETHTokenMintERC20Token.contractName,
      ~eventName=Types.WETHTokenMintERC20Token.Transfer.name,
      ~handlerRegister=Types.WETHTokenMintERC20Token.Transfer.handlerRegister,
      ~paramsRawEventSchema=Types.WETHTokenMintERC20Token.Transfer.paramsRawEventSchema,
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
->(Utils.magic: Types.WETHTokenMintERC20Token.Transfer.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.WETHTokenMintERC20Token.Transfer.event)
    }
  }

}


module YAKITokenMintERC20Token = {
  module Approval = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.YAKITokenMintERC20Token.Approval.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.YAKITokenMintERC20Token.contractName,
      ~eventName=Types.YAKITokenMintERC20Token.Approval.name,
      ~handlerRegister=Types.YAKITokenMintERC20Token.Approval.handlerRegister,
      ~paramsRawEventSchema=Types.YAKITokenMintERC20Token.Approval.paramsRawEventSchema,
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
->(Utils.magic: Types.YAKITokenMintERC20Token.Approval.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.YAKITokenMintERC20Token.Approval.event)
    }
  }

  module Transfer = {
    @genType
    let processEvent: EventFunctions.eventProcessor<Types.YAKITokenMintERC20Token.Transfer.event> = EventFunctions.makeEventProcessor(
      ~contractName=Types.YAKITokenMintERC20Token.contractName,
      ~eventName=Types.YAKITokenMintERC20Token.Transfer.name,
      ~handlerRegister=Types.YAKITokenMintERC20Token.Transfer.handlerRegister,
      ~paramsRawEventSchema=Types.YAKITokenMintERC20Token.Transfer.paramsRawEventSchema,
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
->(Utils.magic: Types.YAKITokenMintERC20Token.Transfer.eventArgs => Internal.eventParams)

      EventFunctions.makeEventMocker(~params, ~mockEventData)
        ->(Utils.magic: Internal.event => Types.YAKITokenMintERC20Token.Transfer.event)
    }
  }

}

