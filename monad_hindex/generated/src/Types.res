//*************
//***ENTITIES**
//*************
@genType.as("Id")
type id = string

@genType
type contractRegistrations = {
  // TODO: only add contracts we've registered for the event in the config
  addFiatTokenProxy: (Address.t) => unit,
  addTokenMintERC20Token: (Address.t) => unit,
}

@genType
type entityLoaderContext<'entity, 'indexedFieldOperations> = {
  get: id => promise<option<'entity>>,
  getWhere: 'indexedFieldOperations,
}

@genType
type loaderContext = {
  log: Logs.userLogger,
  @as("FiatTokenProxy_AdminChanged") fiatTokenProxy_AdminChanged: entityLoaderContext<Entities.FiatTokenProxy_AdminChanged.t, Entities.FiatTokenProxy_AdminChanged.indexedFieldOperations>,
  @as("FiatTokenProxy_Approval") fiatTokenProxy_Approval: entityLoaderContext<Entities.FiatTokenProxy_Approval.t, Entities.FiatTokenProxy_Approval.indexedFieldOperations>,
  @as("FiatTokenProxy_AuthorizationCanceled") fiatTokenProxy_AuthorizationCanceled: entityLoaderContext<Entities.FiatTokenProxy_AuthorizationCanceled.t, Entities.FiatTokenProxy_AuthorizationCanceled.indexedFieldOperations>,
  @as("FiatTokenProxy_AuthorizationUsed") fiatTokenProxy_AuthorizationUsed: entityLoaderContext<Entities.FiatTokenProxy_AuthorizationUsed.t, Entities.FiatTokenProxy_AuthorizationUsed.indexedFieldOperations>,
  @as("FiatTokenProxy_Blacklisted") fiatTokenProxy_Blacklisted: entityLoaderContext<Entities.FiatTokenProxy_Blacklisted.t, Entities.FiatTokenProxy_Blacklisted.indexedFieldOperations>,
  @as("FiatTokenProxy_BlacklisterChanged") fiatTokenProxy_BlacklisterChanged: entityLoaderContext<Entities.FiatTokenProxy_BlacklisterChanged.t, Entities.FiatTokenProxy_BlacklisterChanged.indexedFieldOperations>,
  @as("FiatTokenProxy_Burn") fiatTokenProxy_Burn: entityLoaderContext<Entities.FiatTokenProxy_Burn.t, Entities.FiatTokenProxy_Burn.indexedFieldOperations>,
  @as("FiatTokenProxy_MasterMinterChanged") fiatTokenProxy_MasterMinterChanged: entityLoaderContext<Entities.FiatTokenProxy_MasterMinterChanged.t, Entities.FiatTokenProxy_MasterMinterChanged.indexedFieldOperations>,
  @as("FiatTokenProxy_Mint") fiatTokenProxy_Mint: entityLoaderContext<Entities.FiatTokenProxy_Mint.t, Entities.FiatTokenProxy_Mint.indexedFieldOperations>,
  @as("FiatTokenProxy_MinterConfigured") fiatTokenProxy_MinterConfigured: entityLoaderContext<Entities.FiatTokenProxy_MinterConfigured.t, Entities.FiatTokenProxy_MinterConfigured.indexedFieldOperations>,
  @as("FiatTokenProxy_MinterRemoved") fiatTokenProxy_MinterRemoved: entityLoaderContext<Entities.FiatTokenProxy_MinterRemoved.t, Entities.FiatTokenProxy_MinterRemoved.indexedFieldOperations>,
  @as("FiatTokenProxy_OwnershipTransferred") fiatTokenProxy_OwnershipTransferred: entityLoaderContext<Entities.FiatTokenProxy_OwnershipTransferred.t, Entities.FiatTokenProxy_OwnershipTransferred.indexedFieldOperations>,
  @as("FiatTokenProxy_Pause") fiatTokenProxy_Pause: entityLoaderContext<Entities.FiatTokenProxy_Pause.t, Entities.FiatTokenProxy_Pause.indexedFieldOperations>,
  @as("FiatTokenProxy_PauserChanged") fiatTokenProxy_PauserChanged: entityLoaderContext<Entities.FiatTokenProxy_PauserChanged.t, Entities.FiatTokenProxy_PauserChanged.indexedFieldOperations>,
  @as("FiatTokenProxy_RescuerChanged") fiatTokenProxy_RescuerChanged: entityLoaderContext<Entities.FiatTokenProxy_RescuerChanged.t, Entities.FiatTokenProxy_RescuerChanged.indexedFieldOperations>,
  @as("FiatTokenProxy_Transfer") fiatTokenProxy_Transfer: entityLoaderContext<Entities.FiatTokenProxy_Transfer.t, Entities.FiatTokenProxy_Transfer.indexedFieldOperations>,
  @as("FiatTokenProxy_UnBlacklisted") fiatTokenProxy_UnBlacklisted: entityLoaderContext<Entities.FiatTokenProxy_UnBlacklisted.t, Entities.FiatTokenProxy_UnBlacklisted.indexedFieldOperations>,
  @as("FiatTokenProxy_Unpause") fiatTokenProxy_Unpause: entityLoaderContext<Entities.FiatTokenProxy_Unpause.t, Entities.FiatTokenProxy_Unpause.indexedFieldOperations>,
  @as("FiatTokenProxy_Upgraded") fiatTokenProxy_Upgraded: entityLoaderContext<Entities.FiatTokenProxy_Upgraded.t, Entities.FiatTokenProxy_Upgraded.indexedFieldOperations>,
  @as("TokenMintERC20Token_Approval") tokenMintERC20Token_Approval: entityLoaderContext<Entities.TokenMintERC20Token_Approval.t, Entities.TokenMintERC20Token_Approval.indexedFieldOperations>,
  @as("TokenMintERC20Token_Transfer") tokenMintERC20Token_Transfer: entityLoaderContext<Entities.TokenMintERC20Token_Transfer.t, Entities.TokenMintERC20Token_Transfer.indexedFieldOperations>,
}

@genType
type entityHandlerContext<'entity> = {
  get: id => promise<option<'entity>>,
  set: 'entity => unit,
  deleteUnsafe: id => unit,
}


@genType
type handlerContext = {
  log: Logs.userLogger,
  @as("FiatTokenProxy_AdminChanged") fiatTokenProxy_AdminChanged: entityHandlerContext<Entities.FiatTokenProxy_AdminChanged.t>,
  @as("FiatTokenProxy_Approval") fiatTokenProxy_Approval: entityHandlerContext<Entities.FiatTokenProxy_Approval.t>,
  @as("FiatTokenProxy_AuthorizationCanceled") fiatTokenProxy_AuthorizationCanceled: entityHandlerContext<Entities.FiatTokenProxy_AuthorizationCanceled.t>,
  @as("FiatTokenProxy_AuthorizationUsed") fiatTokenProxy_AuthorizationUsed: entityHandlerContext<Entities.FiatTokenProxy_AuthorizationUsed.t>,
  @as("FiatTokenProxy_Blacklisted") fiatTokenProxy_Blacklisted: entityHandlerContext<Entities.FiatTokenProxy_Blacklisted.t>,
  @as("FiatTokenProxy_BlacklisterChanged") fiatTokenProxy_BlacklisterChanged: entityHandlerContext<Entities.FiatTokenProxy_BlacklisterChanged.t>,
  @as("FiatTokenProxy_Burn") fiatTokenProxy_Burn: entityHandlerContext<Entities.FiatTokenProxy_Burn.t>,
  @as("FiatTokenProxy_MasterMinterChanged") fiatTokenProxy_MasterMinterChanged: entityHandlerContext<Entities.FiatTokenProxy_MasterMinterChanged.t>,
  @as("FiatTokenProxy_Mint") fiatTokenProxy_Mint: entityHandlerContext<Entities.FiatTokenProxy_Mint.t>,
  @as("FiatTokenProxy_MinterConfigured") fiatTokenProxy_MinterConfigured: entityHandlerContext<Entities.FiatTokenProxy_MinterConfigured.t>,
  @as("FiatTokenProxy_MinterRemoved") fiatTokenProxy_MinterRemoved: entityHandlerContext<Entities.FiatTokenProxy_MinterRemoved.t>,
  @as("FiatTokenProxy_OwnershipTransferred") fiatTokenProxy_OwnershipTransferred: entityHandlerContext<Entities.FiatTokenProxy_OwnershipTransferred.t>,
  @as("FiatTokenProxy_Pause") fiatTokenProxy_Pause: entityHandlerContext<Entities.FiatTokenProxy_Pause.t>,
  @as("FiatTokenProxy_PauserChanged") fiatTokenProxy_PauserChanged: entityHandlerContext<Entities.FiatTokenProxy_PauserChanged.t>,
  @as("FiatTokenProxy_RescuerChanged") fiatTokenProxy_RescuerChanged: entityHandlerContext<Entities.FiatTokenProxy_RescuerChanged.t>,
  @as("FiatTokenProxy_Transfer") fiatTokenProxy_Transfer: entityHandlerContext<Entities.FiatTokenProxy_Transfer.t>,
  @as("FiatTokenProxy_UnBlacklisted") fiatTokenProxy_UnBlacklisted: entityHandlerContext<Entities.FiatTokenProxy_UnBlacklisted.t>,
  @as("FiatTokenProxy_Unpause") fiatTokenProxy_Unpause: entityHandlerContext<Entities.FiatTokenProxy_Unpause.t>,
  @as("FiatTokenProxy_Upgraded") fiatTokenProxy_Upgraded: entityHandlerContext<Entities.FiatTokenProxy_Upgraded.t>,
  @as("TokenMintERC20Token_Approval") tokenMintERC20Token_Approval: entityHandlerContext<Entities.TokenMintERC20Token_Approval.t>,
  @as("TokenMintERC20Token_Transfer") tokenMintERC20Token_Transfer: entityHandlerContext<Entities.TokenMintERC20Token_Transfer.t>,
}

//Re-exporting types for backwards compatability
@genType.as("FiatTokenProxy_AdminChanged")
type fiatTokenProxy_AdminChanged = Entities.FiatTokenProxy_AdminChanged.t
@genType.as("FiatTokenProxy_Approval")
type fiatTokenProxy_Approval = Entities.FiatTokenProxy_Approval.t
@genType.as("FiatTokenProxy_AuthorizationCanceled")
type fiatTokenProxy_AuthorizationCanceled = Entities.FiatTokenProxy_AuthorizationCanceled.t
@genType.as("FiatTokenProxy_AuthorizationUsed")
type fiatTokenProxy_AuthorizationUsed = Entities.FiatTokenProxy_AuthorizationUsed.t
@genType.as("FiatTokenProxy_Blacklisted")
type fiatTokenProxy_Blacklisted = Entities.FiatTokenProxy_Blacklisted.t
@genType.as("FiatTokenProxy_BlacklisterChanged")
type fiatTokenProxy_BlacklisterChanged = Entities.FiatTokenProxy_BlacklisterChanged.t
@genType.as("FiatTokenProxy_Burn")
type fiatTokenProxy_Burn = Entities.FiatTokenProxy_Burn.t
@genType.as("FiatTokenProxy_MasterMinterChanged")
type fiatTokenProxy_MasterMinterChanged = Entities.FiatTokenProxy_MasterMinterChanged.t
@genType.as("FiatTokenProxy_Mint")
type fiatTokenProxy_Mint = Entities.FiatTokenProxy_Mint.t
@genType.as("FiatTokenProxy_MinterConfigured")
type fiatTokenProxy_MinterConfigured = Entities.FiatTokenProxy_MinterConfigured.t
@genType.as("FiatTokenProxy_MinterRemoved")
type fiatTokenProxy_MinterRemoved = Entities.FiatTokenProxy_MinterRemoved.t
@genType.as("FiatTokenProxy_OwnershipTransferred")
type fiatTokenProxy_OwnershipTransferred = Entities.FiatTokenProxy_OwnershipTransferred.t
@genType.as("FiatTokenProxy_Pause")
type fiatTokenProxy_Pause = Entities.FiatTokenProxy_Pause.t
@genType.as("FiatTokenProxy_PauserChanged")
type fiatTokenProxy_PauserChanged = Entities.FiatTokenProxy_PauserChanged.t
@genType.as("FiatTokenProxy_RescuerChanged")
type fiatTokenProxy_RescuerChanged = Entities.FiatTokenProxy_RescuerChanged.t
@genType.as("FiatTokenProxy_Transfer")
type fiatTokenProxy_Transfer = Entities.FiatTokenProxy_Transfer.t
@genType.as("FiatTokenProxy_UnBlacklisted")
type fiatTokenProxy_UnBlacklisted = Entities.FiatTokenProxy_UnBlacklisted.t
@genType.as("FiatTokenProxy_Unpause")
type fiatTokenProxy_Unpause = Entities.FiatTokenProxy_Unpause.t
@genType.as("FiatTokenProxy_Upgraded")
type fiatTokenProxy_Upgraded = Entities.FiatTokenProxy_Upgraded.t
@genType.as("TokenMintERC20Token_Approval")
type tokenMintERC20Token_Approval = Entities.TokenMintERC20Token_Approval.t
@genType.as("TokenMintERC20Token_Transfer")
type tokenMintERC20Token_Transfer = Entities.TokenMintERC20Token_Transfer.t

type eventIdentifier = {
  chainId: int,
  blockTimestamp: int,
  blockNumber: int,
  logIndex: int,
}

type entityUpdateAction<'entityType> =
  | Set('entityType)
  | Delete

type entityUpdate<'entityType> = {
  eventIdentifier: eventIdentifier,
  entityId: id,
  entityUpdateAction: entityUpdateAction<'entityType>,
}

let mkEntityUpdate = (~eventIdentifier, ~entityId, entityUpdateAction) => {
  entityId,
  eventIdentifier,
  entityUpdateAction,
}

type entityValueAtStartOfBatch<'entityType> =
  | NotSet // The entity isn't in the DB yet
  | AlreadySet('entityType)

type updatedValue<'entityType> = {
  latest: entityUpdate<'entityType>,
  history: array<entityUpdate<'entityType>>,
}

@genType
type inMemoryStoreRowEntity<'entityType> =
  | Updated(updatedValue<'entityType>)
  | InitialReadFromDb(entityValueAtStartOfBatch<'entityType>) // This means there is no change from the db.

//*************
//**CONTRACTS**
//*************

module Transaction = {
  @genType
  type t = {}

  let schema = S.object((_): t => {})
}

module Block = {
  @genType
  type t = {number: int, timestamp: int, hash: string}

  let schema = S.object((s): t => {number: s.field("number", S.int), timestamp: s.field("timestamp", S.int), hash: s.field("hash", S.string)})

  @get
  external getNumber: Internal.eventBlock => int = "number"

  @get
  external getTimestamp: Internal.eventBlock => int = "timestamp"
 
  @get
  external getId: Internal.eventBlock => string = "hash"

  let cleanUpRawEventFieldsInPlace: Js.Json.t => () = %raw(`fields => {
    delete fields.hash
    delete fields.number
    delete fields.timestamp
  }`)
}

module AggregatedBlock = {
  @genType
  type t = {hash: string, timestamp: int, number: int}
}
module AggregatedTransaction = {
  @genType
  type t = {}
}

@genType.as("EventLog")
type eventLog<'params> = Internal.genericEvent<'params, Block.t, Transaction.t>

module SingleOrMultiple: {
  @genType.import(("./bindings/OpaqueTypes", "SingleOrMultiple"))
  type t<'a>
  let normalizeOrThrow: (t<'a>, ~nestedArrayDepth: int=?) => array<'a>
  let single: 'a => t<'a>
  let multiple: array<'a> => t<'a>
} = {
  type t<'a> = Js.Json.t

  external single: 'a => t<'a> = "%identity"
  external multiple: array<'a> => t<'a> = "%identity"
  external castMultiple: t<'a> => array<'a> = "%identity"
  external castSingle: t<'a> => 'a = "%identity"

  exception AmbiguousEmptyNestedArray

  let rec isMultiple = (t: t<'a>, ~nestedArrayDepth): bool =>
    switch t->Js.Json.decodeArray {
    | None => false
    | Some(_arr) if nestedArrayDepth == 0 => true
    | Some([]) if nestedArrayDepth > 0 =>
      AmbiguousEmptyNestedArray->ErrorHandling.mkLogAndRaise(
        ~msg="The given empty array could be interperated as a flat array (value) or nested array. Since it's ambiguous,
        please pass in a nested empty array if the intention is to provide an empty array as a value",
      )
    | Some(arr) => arr->Js.Array2.unsafe_get(0)->isMultiple(~nestedArrayDepth=nestedArrayDepth - 1)
    }

  let normalizeOrThrow = (t: t<'a>, ~nestedArrayDepth=0): array<'a> => {
    if t->isMultiple(~nestedArrayDepth) {
      t->castMultiple
    } else {
      [t->castSingle]
    }
  }
}

module HandlerTypes = {
  @genType
  type args<'eventArgs, 'context> = {
    event: eventLog<'eventArgs>,
    context: 'context,
  }

  @genType
  type contractRegisterArgs<'eventArgs> = Internal.genericContractRegisterArgs<eventLog<'eventArgs>, contractRegistrations>
  @genType
  type contractRegister<'eventArgs> = Internal.genericContractRegister<contractRegisterArgs<'eventArgs>>

  @genType
  type loaderArgs<'eventArgs> = Internal.genericLoaderArgs<eventLog<'eventArgs>, loaderContext>
  @genType
  type loader<'eventArgs, 'loaderReturn> = Internal.genericLoader<loaderArgs<'eventArgs>, 'loaderReturn>

  @genType
  type handlerArgs<'eventArgs, 'loaderReturn> = Internal.genericHandlerArgs<eventLog<'eventArgs>, handlerContext, 'loaderReturn>

  @genType
  type handler<'eventArgs, 'loaderReturn> = Internal.genericHandler<handlerArgs<'eventArgs, 'loaderReturn>>

  @genType
  type loaderHandler<'eventArgs, 'loaderReturn, 'eventFilter> = Internal.genericHandlerWithLoader<
    loader<'eventArgs, 'loaderReturn>,
    handler<'eventArgs, 'loaderReturn>,
    SingleOrMultiple.t<'eventFilter>
  >

  @genType
  type eventConfig<'eventFilter> = {
    wildcard?: bool,
    eventFilters?: SingleOrMultiple.t<'eventFilter>,
    preRegisterDynamicContracts?: bool,
  }

  module EventOptions = {
    type t = {
      isWildcard: bool,
      topicSelections: array<LogSelection.topicSelection>,
      preRegisterDynamicContracts: bool,
    }

    let getDefault = (~topic0) => {
      isWildcard: false,
      topicSelections: [LogSelection.makeTopicSelection(~topic0=[topic0])->Utils.unwrapResultExn],
      preRegisterDynamicContracts: false,
    }

    let make = (
      ~isWildcard,
      ~topicSelections: array<LogSelection.topicSelection>,
      ~preRegisterDynamicContracts,
    ) => {
      let topic0sGrouped = []
      let topicSelectionWithFilters = []
      topicSelections->Belt.Array.forEach(ts =>
        if ts->LogSelection.hasFilters {
          topicSelectionWithFilters->Js.Array2.push(ts)->ignore
        } else {
          ts.topic0->Belt.Array.forEach(topic0 => {
            topic0sGrouped->Js.Array2.push(topic0)->ignore
          })
        }
      )
      let topicSelections = switch topic0sGrouped {
      | [] => topicSelectionWithFilters
      | topic0sGrouped =>
        [
          LogSelection.makeTopicSelection(~topic0=topic0sGrouped)->Utils.unwrapResultExn,
        ]->Belt.Array.concat(topicSelectionWithFilters)
      }

      {
        isWildcard,
        topicSelections,
        preRegisterDynamicContracts,
      }
    }
  }

  module Register: {
    type t
    let make: (~topic0: EvmTypes.Hex.t, ~contractName: string, ~eventName: string) => t
    let setLoaderHandler: (
      t,
      Internal.genericHandlerWithLoader<'loader, 'handler, 'eventFilters>,
      ~getEventOptions: Internal.genericHandlerWithLoader<'loader, 'handler, 'eventFilters> => option<
        EventOptions.t,
      >,
      ~logger: Pino.t=?,
    ) => unit
    let setContractRegister: (
      t,
      Internal.genericContractRegister<Internal.genericContractRegisterArgs<'event, 'context>>,
      ~eventOptions: option<EventOptions.t>,
      ~logger: Pino.t=?,
    ) => unit
    let noopLoader: Internal.genericLoader<'event, ()>
    let getLoader: t => option<Internal.loader>
    let getHandler: t => option<Internal.handler>
    let getContractRegister: t => option<Internal.contractRegister>
    let getEventOptions: t => EventOptions.t
    let hasRegistration: t => bool
  } = {
    type eventFilter
    type handlerWithLoader = Internal.genericHandlerWithLoader<Internal.loader, Internal.handler, SingleOrMultiple.t<eventFilter>>

    type t = {
      contractName: string,
      eventName: string,
      topic0: EvmTypes.Hex.t,
      mutable loaderHandler: option<handlerWithLoader>,
      mutable contractRegister: option<Internal.contractRegister>,
      mutable eventOptions: option<EventOptions.t>,
    }

    let noopLoader = _ => Promise.resolve()

    let getLoader = (t: t) => 
      switch t.loaderHandler {
        | Some({loader}) => {
          if loader === noopLoader->(Utils.magic: Internal.genericLoader<'event, ()> => Internal.loader) {
            None
          } else {
            Some(loader)
          }
        }
        | None => None
      }

    let getHandler = (t: t) => 
      switch t.loaderHandler {
        | Some({handler}) => Some(handler)
        | None => None
      }

    let getContractRegister = (t: t) => t.contractRegister

    let getEventOptions = ({eventOptions, topic0}: t): EventOptions.t =>
      switch eventOptions {
      | Some(eventOptions) => eventOptions
      | None => EventOptions.getDefault(~topic0)
      }

    let hasRegistration = ({loaderHandler, contractRegister}) =>
      loaderHandler->Belt.Option.isSome || contractRegister->Belt.Option.isSome

    let make = (~topic0, ~contractName, ~eventName) => {
      contractName,
      eventName,
      topic0,
      loaderHandler: None,
      contractRegister: None,
      eventOptions: None,
    }

    type eventNamespace = {contractName: string, eventName: string}
    exception DuplicateEventRegistration(eventNamespace)

    let setEventOptions = (t: t, value: EventOptions.t, ~logger=Logging.logger) => {
      switch t.eventOptions {
      | None => t.eventOptions = Some(value)
      | Some(_) =>
        let eventNamespace = {contractName: t.contractName, eventName: t.eventName}
        DuplicateEventRegistration(eventNamespace)->ErrorHandling.mkLogAndRaise(
          ~logger=Logging.createChildFrom(~logger, ~params=eventNamespace),
          ~msg="Duplicate eventOptions in handlers not allowed",
        )
      }
    }

    let setLoaderHandler = (
      t: t,
      value,
      ~getEventOptions,
      ~logger=Logging.logger,
    ) => {
      switch t.loaderHandler {
      | None =>
        t.loaderHandler =
          value
          ->(Utils.magic: Internal.genericHandlerWithLoader<'loader, 'handler, 'eventFilters> => handlerWithLoader)
          ->Some
      | Some(_) =>
        let eventNamespace = {contractName: t.contractName, eventName: t.eventName}
        DuplicateEventRegistration(eventNamespace)->ErrorHandling.mkLogAndRaise(
          ~logger=Logging.createChildFrom(~logger, ~params=eventNamespace),
          ~msg="Duplicate registration of event handlers not allowed",
        )
      }

      switch getEventOptions(value) {
      | Some(eventOptions) => t->setEventOptions(eventOptions, ~logger)
      | None => ()
      }
    }

    let setContractRegister = (
      t: t,
      value,
      ~eventOptions,
      ~logger=Logging.logger,
    ) => {
      switch t.contractRegister {
      | None => t.contractRegister = Some(value->(Utils.magic: Internal.genericContractRegister<Internal.genericContractRegisterArgs<'event, 'context>> => Internal.contractRegister))
      | Some(_) =>
        let eventNamespace = {contractName: t.contractName, eventName: t.eventName}
        DuplicateEventRegistration(eventNamespace)->ErrorHandling.mkLogAndRaise(
          ~logger=Logging.createChildFrom(~logger, ~params=eventNamespace),
          ~msg="Duplicate contractRegister handlers not allowed",
        )
      }
      switch eventOptions {
      | Some(eventOptions) => t->setEventOptions(eventOptions, ~logger)
      | None => ()
      }
    }
  }
}

module type Event = {
  let id: string // The unique identifier for the event
  let sighash: string // topic0 for Evm and rb for Fuel receipts
  let name: string
  let contractName: string

  type eventArgs
  type block
  type transaction

  type event = Internal.genericEvent<eventArgs, block, transaction>
  type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
  type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
  type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

  let paramsRawEventSchema: S.schema<eventArgs>
  let blockSchema: S.schema<block>
  let transactionSchema: S.schema<transaction>

  let convertHyperSyncEventArgs: HyperSyncClient.Decoder.decodedEvent => eventArgs
  let handlerRegister: HandlerTypes.Register.t

  type eventFilter
  let getTopicSelection: SingleOrMultiple.t<eventFilter> => array<LogSelection.topicSelection>
}
module type InternalEvent = Event
  with type eventArgs = Internal.eventParams
  and type transaction = Internal.eventTransaction
  and type block = Internal.eventBlock
external eventModToInternal: module(Event with type eventArgs = 'a) => module(InternalEvent) = "%identity"
external eventModWithoutArgTypeToInternal: module(Event) => module(InternalEvent) = "%identity"

let makeEventOptions = (
  type eventFilter,
  eventConfig: option<HandlerTypes.eventConfig<eventFilter>>,
  eventMod: module(Event with type eventFilter = eventFilter),
) => {
  let module(Event) = eventMod
  open Belt
  eventConfig->Option.map(({?wildcard, ?eventFilters, ?preRegisterDynamicContracts}) =>
    HandlerTypes.EventOptions.make(
      ~isWildcard=wildcard->Option.getWithDefault(false),
      ~topicSelections=eventFilters->Option.mapWithDefault(
        [
          LogSelection.makeTopicSelection(
            ~topic0=[Event.sighash->EvmTypes.Hex.fromStringUnsafe],
          )->Utils.unwrapResultExn,
        ],
        v => v->Event.getTopicSelection,
      ),
      ~preRegisterDynamicContracts=preRegisterDynamicContracts->Option.getWithDefault(false),
    )
  )
}

let makeGetEventOptions = (
  type eventFilter eventArgs,
  eventMod: module(Event with type eventFilter = eventFilter and type eventArgs = eventArgs),
) => {
  open Belt
  let module(Event) = eventMod
  (loaderHandler: Internal.genericHandlerWithLoader<'loader, 'handler, SingleOrMultiple.t<Event.eventFilter>>) =>
    switch loaderHandler {
    | {wildcard: ?None, eventFilters: ?None, preRegisterDynamicContracts: ?None} => None
    | {?wildcard, ?eventFilters, ?preRegisterDynamicContracts} =>
      let topicSelections =
        eventFilters->Option.mapWithDefault(
          [
            LogSelection.makeTopicSelection(
              ~topic0=[Event.sighash->EvmTypes.Hex.fromStringUnsafe],
            )->Utils.unwrapResultExn,
          ],
          v => v->Event.getTopicSelection,
        )
      HandlerTypes.EventOptions.make(
        ~isWildcard=wildcard->Option.getWithDefault(false),
        ~topicSelections,
        ~preRegisterDynamicContracts=preRegisterDynamicContracts->Option.getWithDefault(false),
      )->Some
    }
}

@genType.import(("./bindings/OpaqueTypes.ts", "HandlerWithOptions"))
type fnWithEventConfig<'fn, 'eventConfig> = ('fn, ~eventConfig: 'eventConfig=?) => unit

@genType
type handlerWithOptions<'eventArgs, 'loaderReturn, 'eventFilter> = fnWithEventConfig<
  HandlerTypes.handler<'eventArgs, 'loaderReturn>,
  HandlerTypes.eventConfig<'eventFilter>,
>

@genType
type contractRegisterWithOptions<'eventArgs, 'eventFilter> = fnWithEventConfig<
  HandlerTypes.contractRegister<'eventArgs>,
  HandlerTypes.eventConfig<'eventFilter>,
>

module MakeRegister = (Event: Event) => {
  let handler: fnWithEventConfig<
    Event.handler<unit>,
    HandlerTypes.eventConfig<Event.eventFilter>,
  > = (
    handler,
    ~eventConfig=?,
  ) => {
    Event.handlerRegister->HandlerTypes.Register.setLoaderHandler(
      {
        loader: HandlerTypes.Register.noopLoader,
        handler,
        wildcard: ?eventConfig->Belt.Option.flatMap(c => c.wildcard),
        eventFilters: ?eventConfig->Belt.Option.flatMap(c => c.eventFilters),
        preRegisterDynamicContracts: ?eventConfig->Belt.Option.flatMap(c =>
          c.preRegisterDynamicContracts
        ),
      },
      ~getEventOptions=makeGetEventOptions(module(Event)),
    )
  }

  let contractRegister: fnWithEventConfig<
    Event.contractRegister,
    HandlerTypes.eventConfig<Event.eventFilter>,
  > = (
    contractRegister,
    ~eventConfig=?,
  ) =>
    Event.handlerRegister->HandlerTypes.Register.setContractRegister(
      contractRegister,
      ~eventOptions=makeEventOptions(eventConfig, module(Event)),
    )

  let handlerWithLoader = (args: Internal.genericHandlerWithLoader<
    Event.loader<'loaderReturn>, Event.handler<'loaderReturn>, SingleOrMultiple.t<Event.eventFilter>
  >) =>
    Event.handlerRegister->HandlerTypes.Register.setLoaderHandler(
      args,
      ~getEventOptions=makeGetEventOptions(module(Event)),
    )
}

module FiatTokenProxy = {
let abi = Ethers.makeAbi((%raw(`[{"type":"event","name":"AdminChanged","inputs":[{"name":"previousAdmin","type":"address","indexed":false},{"name":"newAdmin","type":"address","indexed":false}],"anonymous":false},{"type":"event","name":"Approval","inputs":[{"name":"owner","type":"address","indexed":true},{"name":"spender","type":"address","indexed":true},{"name":"value","type":"uint256","indexed":false}],"anonymous":false},{"type":"event","name":"AuthorizationCanceled","inputs":[{"name":"authorizer","type":"address","indexed":true},{"name":"nonce","type":"bytes32","indexed":true}],"anonymous":false},{"type":"event","name":"AuthorizationUsed","inputs":[{"name":"authorizer","type":"address","indexed":true},{"name":"nonce","type":"bytes32","indexed":true}],"anonymous":false},{"type":"event","name":"Blacklisted","inputs":[{"name":"_account","type":"address","indexed":true}],"anonymous":false},{"type":"event","name":"BlacklisterChanged","inputs":[{"name":"newBlacklister","type":"address","indexed":true}],"anonymous":false},{"type":"event","name":"Burn","inputs":[{"name":"burner","type":"address","indexed":true},{"name":"amount","type":"uint256","indexed":false}],"anonymous":false},{"type":"event","name":"MasterMinterChanged","inputs":[{"name":"newMasterMinter","type":"address","indexed":true}],"anonymous":false},{"type":"event","name":"Mint","inputs":[{"name":"minter","type":"address","indexed":true},{"name":"to","type":"address","indexed":true},{"name":"amount","type":"uint256","indexed":false}],"anonymous":false},{"type":"event","name":"MinterConfigured","inputs":[{"name":"minter","type":"address","indexed":true},{"name":"minterAllowedAmount","type":"uint256","indexed":false}],"anonymous":false},{"type":"event","name":"MinterRemoved","inputs":[{"name":"oldMinter","type":"address","indexed":true}],"anonymous":false},{"type":"event","name":"OwnershipTransferred","inputs":[{"name":"previousOwner","type":"address","indexed":false},{"name":"newOwner","type":"address","indexed":false}],"anonymous":false},{"type":"event","name":"Pause","inputs":[],"anonymous":false},{"type":"event","name":"PauserChanged","inputs":[{"name":"newAddress","type":"address","indexed":true}],"anonymous":false},{"type":"event","name":"RescuerChanged","inputs":[{"name":"newRescuer","type":"address","indexed":true}],"anonymous":false},{"type":"event","name":"Transfer","inputs":[{"name":"from","type":"address","indexed":true},{"name":"to","type":"address","indexed":true},{"name":"value","type":"uint256","indexed":false}],"anonymous":false},{"type":"event","name":"UnBlacklisted","inputs":[{"name":"_account","type":"address","indexed":true}],"anonymous":false},{"type":"event","name":"Unpause","inputs":[],"anonymous":false},{"type":"event","name":"Upgraded","inputs":[{"name":"implementation","type":"address","indexed":false}],"anonymous":false}]`): Js.Json.t))
let eventSignatures = ["AdminChanged(address previousAdmin, address newAdmin)", "Approval(address indexed owner, address indexed spender, uint256 value)", "AuthorizationCanceled(address indexed authorizer, bytes32 indexed nonce)", "AuthorizationUsed(address indexed authorizer, bytes32 indexed nonce)", "Blacklisted(address indexed _account)", "BlacklisterChanged(address indexed newBlacklister)", "Burn(address indexed burner, uint256 amount)", "MasterMinterChanged(address indexed newMasterMinter)", "Mint(address indexed minter, address indexed to, uint256 amount)", "MinterConfigured(address indexed minter, uint256 minterAllowedAmount)", "MinterRemoved(address indexed oldMinter)", "OwnershipTransferred(address previousOwner, address newOwner)", "Pause()", "PauserChanged(address indexed newAddress)", "RescuerChanged(address indexed newRescuer)", "Transfer(address indexed from, address indexed to, uint256 value)", "UnBlacklisted(address indexed _account)", "Unpause()", "Upgraded(address implementation)"]
let contractName = "FiatTokenProxy"

module AdminChanged = {

let id = "0x7e644d79422f17c01e4894b5f4f588d331ebfa28653d42ae832dc59e38c9798f_1"
let sighash = "0x7e644d79422f17c01e4894b5f4f588d331ebfa28653d42ae832dc59e38c9798f"
let name = "AdminChanged"
let contractName = contractName

@genType
type eventArgs = {previousAdmin: Address.t, newAdmin: Address.t}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {previousAdmin: s.field("previousAdmin", Address.schema), newAdmin: s.field("newAdmin", Address.schema)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        previousAdmin: decodedEvent.body->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
        newAdmin: decodedEvent.body->Js.Array2.unsafe_get(1)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = {  }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], )->Utils.unwrapResultExn)

}

module Approval = {

let id = "0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925_3"
let sighash = "0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925"
let name = "Approval"
let contractName = contractName

@genType
type eventArgs = {owner: Address.t, spender: Address.t, value: bigint}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {owner: s.field("owner", Address.schema), spender: s.field("spender", Address.schema), value: s.field("value", BigInt.schema)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        owner: decodedEvent.indexed->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
        spender: decodedEvent.indexed->Js.Array2.unsafe_get(1)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
        value: decodedEvent.body->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = { @as("owner") owner?: SingleOrMultiple.t<Address.t>, @as("spender") spender?: SingleOrMultiple.t<Address.t> }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], ~topic1=?_eventFilter.owner->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), ~topic2=?_eventFilter.spender->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), )->Utils.unwrapResultExn)

}

module AuthorizationCanceled = {

let id = "0x1cdd46ff242716cdaa72d159d339a485b3438398348d68f09d7c8c0a59353d81_3"
let sighash = "0x1cdd46ff242716cdaa72d159d339a485b3438398348d68f09d7c8c0a59353d81"
let name = "AuthorizationCanceled"
let contractName = contractName

@genType
type eventArgs = {authorizer: Address.t, nonce: string}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {authorizer: s.field("authorizer", Address.schema), nonce: s.field("nonce", S.string)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        authorizer: decodedEvent.indexed->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
        nonce: decodedEvent.indexed->Js.Array2.unsafe_get(1)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = { @as("authorizer") authorizer?: SingleOrMultiple.t<Address.t>, @as("nonce") nonce?: SingleOrMultiple.t<string> }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], ~topic1=?_eventFilter.authorizer->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), ~topic2=?_eventFilter.nonce->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromBytes)), )->Utils.unwrapResultExn)

}

module AuthorizationUsed = {

let id = "0x98de503528ee59b575ef0c0a2576a82497bfc029a5685b209e9ec333479b10a5_3"
let sighash = "0x98de503528ee59b575ef0c0a2576a82497bfc029a5685b209e9ec333479b10a5"
let name = "AuthorizationUsed"
let contractName = contractName

@genType
type eventArgs = {authorizer: Address.t, nonce: string}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {authorizer: s.field("authorizer", Address.schema), nonce: s.field("nonce", S.string)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        authorizer: decodedEvent.indexed->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
        nonce: decodedEvent.indexed->Js.Array2.unsafe_get(1)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = { @as("authorizer") authorizer?: SingleOrMultiple.t<Address.t>, @as("nonce") nonce?: SingleOrMultiple.t<string> }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], ~topic1=?_eventFilter.authorizer->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), ~topic2=?_eventFilter.nonce->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromBytes)), )->Utils.unwrapResultExn)

}

module Blacklisted = {

let id = "0xffa4e6181777692565cf28528fc88fd1516ea86b56da075235fa575af6a4b855_2"
let sighash = "0xffa4e6181777692565cf28528fc88fd1516ea86b56da075235fa575af6a4b855"
let name = "Blacklisted"
let contractName = contractName

@genType
type eventArgs = {_account: Address.t}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {_account: s.field("_account", Address.schema)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        _account: decodedEvent.indexed->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = { @as("_account") _account?: SingleOrMultiple.t<Address.t> }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], ~topic1=?_eventFilter._account->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), )->Utils.unwrapResultExn)

}

module BlacklisterChanged = {

let id = "0xc67398012c111ce95ecb7429b933096c977380ee6c421175a71a4a4c6c88c06e_2"
let sighash = "0xc67398012c111ce95ecb7429b933096c977380ee6c421175a71a4a4c6c88c06e"
let name = "BlacklisterChanged"
let contractName = contractName

@genType
type eventArgs = {newBlacklister: Address.t}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {newBlacklister: s.field("newBlacklister", Address.schema)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        newBlacklister: decodedEvent.indexed->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = { @as("newBlacklister") newBlacklister?: SingleOrMultiple.t<Address.t> }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], ~topic1=?_eventFilter.newBlacklister->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), )->Utils.unwrapResultExn)

}

module Burn = {

let id = "0xcc16f5dbb4873280815c1ee09dbd06736cffcc184412cf7a71a0fdb75d397ca5_2"
let sighash = "0xcc16f5dbb4873280815c1ee09dbd06736cffcc184412cf7a71a0fdb75d397ca5"
let name = "Burn"
let contractName = contractName

@genType
type eventArgs = {burner: Address.t, amount: bigint}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {burner: s.field("burner", Address.schema), amount: s.field("amount", BigInt.schema)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        burner: decodedEvent.indexed->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
        amount: decodedEvent.body->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = { @as("burner") burner?: SingleOrMultiple.t<Address.t> }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], ~topic1=?_eventFilter.burner->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), )->Utils.unwrapResultExn)

}

module MasterMinterChanged = {

let id = "0xdb66dfa9c6b8f5226fe9aac7e51897ae8ee94ac31dc70bb6c9900b2574b707e6_2"
let sighash = "0xdb66dfa9c6b8f5226fe9aac7e51897ae8ee94ac31dc70bb6c9900b2574b707e6"
let name = "MasterMinterChanged"
let contractName = contractName

@genType
type eventArgs = {newMasterMinter: Address.t}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {newMasterMinter: s.field("newMasterMinter", Address.schema)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        newMasterMinter: decodedEvent.indexed->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = { @as("newMasterMinter") newMasterMinter?: SingleOrMultiple.t<Address.t> }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], ~topic1=?_eventFilter.newMasterMinter->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), )->Utils.unwrapResultExn)

}

module Mint = {

let id = "0xab8530f87dc9b59234c4623bf917212bb2536d647574c8e7e5da92c2ede0c9f8_3"
let sighash = "0xab8530f87dc9b59234c4623bf917212bb2536d647574c8e7e5da92c2ede0c9f8"
let name = "Mint"
let contractName = contractName

@genType
type eventArgs = {minter: Address.t, to: Address.t, amount: bigint}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {minter: s.field("minter", Address.schema), to: s.field("to", Address.schema), amount: s.field("amount", BigInt.schema)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        minter: decodedEvent.indexed->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
        to: decodedEvent.indexed->Js.Array2.unsafe_get(1)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
        amount: decodedEvent.body->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = { @as("minter") minter?: SingleOrMultiple.t<Address.t>, @as("to") to?: SingleOrMultiple.t<Address.t> }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], ~topic1=?_eventFilter.minter->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), ~topic2=?_eventFilter.to->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), )->Utils.unwrapResultExn)

}

module MinterConfigured = {

let id = "0x46980fca912ef9bcdbd36877427b6b90e860769f604e89c0e67720cece530d20_2"
let sighash = "0x46980fca912ef9bcdbd36877427b6b90e860769f604e89c0e67720cece530d20"
let name = "MinterConfigured"
let contractName = contractName

@genType
type eventArgs = {minter: Address.t, minterAllowedAmount: bigint}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {minter: s.field("minter", Address.schema), minterAllowedAmount: s.field("minterAllowedAmount", BigInt.schema)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        minter: decodedEvent.indexed->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
        minterAllowedAmount: decodedEvent.body->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = { @as("minter") minter?: SingleOrMultiple.t<Address.t> }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], ~topic1=?_eventFilter.minter->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), )->Utils.unwrapResultExn)

}

module MinterRemoved = {

let id = "0xe94479a9f7e1952cc78f2d6baab678adc1b772d936c6583def489e524cb66692_2"
let sighash = "0xe94479a9f7e1952cc78f2d6baab678adc1b772d936c6583def489e524cb66692"
let name = "MinterRemoved"
let contractName = contractName

@genType
type eventArgs = {oldMinter: Address.t}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {oldMinter: s.field("oldMinter", Address.schema)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        oldMinter: decodedEvent.indexed->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = { @as("oldMinter") oldMinter?: SingleOrMultiple.t<Address.t> }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], ~topic1=?_eventFilter.oldMinter->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), )->Utils.unwrapResultExn)

}

module OwnershipTransferred = {

let id = "0x8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e0_1"
let sighash = "0x8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e0"
let name = "OwnershipTransferred"
let contractName = contractName

@genType
type eventArgs = {previousOwner: Address.t, newOwner: Address.t}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {previousOwner: s.field("previousOwner", Address.schema), newOwner: s.field("newOwner", Address.schema)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        previousOwner: decodedEvent.body->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
        newOwner: decodedEvent.body->Js.Array2.unsafe_get(1)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = {  }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], )->Utils.unwrapResultExn)

}

module Pause = {

let id = "0x6985a02210a168e66602d3235cb6db0e70f92b3ba4d376a33c0f3d9434bff625_1"
let sighash = "0x6985a02210a168e66602d3235cb6db0e70f92b3ba4d376a33c0f3d9434bff625"
let name = "Pause"
let contractName = contractName

@genType
type eventArgs = unit
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.literal(%raw(`null`))->S.to(_ => ())
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = _ => ()

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = {  }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], )->Utils.unwrapResultExn)

}

module PauserChanged = {

let id = "0xb80482a293ca2e013eda8683c9bd7fc8347cfdaeea5ede58cba46df502c2a604_2"
let sighash = "0xb80482a293ca2e013eda8683c9bd7fc8347cfdaeea5ede58cba46df502c2a604"
let name = "PauserChanged"
let contractName = contractName

@genType
type eventArgs = {newAddress: Address.t}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {newAddress: s.field("newAddress", Address.schema)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        newAddress: decodedEvent.indexed->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = { @as("newAddress") newAddress?: SingleOrMultiple.t<Address.t> }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], ~topic1=?_eventFilter.newAddress->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), )->Utils.unwrapResultExn)

}

module RescuerChanged = {

let id = "0xe475e580d85111348e40d8ca33cfdd74c30fe1655c2d8537a13abc10065ffa5a_2"
let sighash = "0xe475e580d85111348e40d8ca33cfdd74c30fe1655c2d8537a13abc10065ffa5a"
let name = "RescuerChanged"
let contractName = contractName

@genType
type eventArgs = {newRescuer: Address.t}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {newRescuer: s.field("newRescuer", Address.schema)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        newRescuer: decodedEvent.indexed->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = { @as("newRescuer") newRescuer?: SingleOrMultiple.t<Address.t> }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], ~topic1=?_eventFilter.newRescuer->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), )->Utils.unwrapResultExn)

}

module Transfer = {

let id = "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef_3"
let sighash = "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"
let name = "Transfer"
let contractName = contractName

@genType
type eventArgs = {from: Address.t, to: Address.t, value: bigint}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {from: s.field("from", Address.schema), to: s.field("to", Address.schema), value: s.field("value", BigInt.schema)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        from: decodedEvent.indexed->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
        to: decodedEvent.indexed->Js.Array2.unsafe_get(1)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
        value: decodedEvent.body->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = { @as("from") from?: SingleOrMultiple.t<Address.t>, @as("to") to?: SingleOrMultiple.t<Address.t> }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], ~topic1=?_eventFilter.from->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), ~topic2=?_eventFilter.to->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), )->Utils.unwrapResultExn)

}

module UnBlacklisted = {

let id = "0x117e3210bb9aa7d9baff172026820255c6f6c30ba8999d1c2fd88e2848137c4e_2"
let sighash = "0x117e3210bb9aa7d9baff172026820255c6f6c30ba8999d1c2fd88e2848137c4e"
let name = "UnBlacklisted"
let contractName = contractName

@genType
type eventArgs = {_account: Address.t}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {_account: s.field("_account", Address.schema)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        _account: decodedEvent.indexed->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = { @as("_account") _account?: SingleOrMultiple.t<Address.t> }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], ~topic1=?_eventFilter._account->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), )->Utils.unwrapResultExn)

}

module Unpause = {

let id = "0x7805862f689e2f13df9f062ff482ad3ad112aca9e0847911ed832e158c525b33_1"
let sighash = "0x7805862f689e2f13df9f062ff482ad3ad112aca9e0847911ed832e158c525b33"
let name = "Unpause"
let contractName = contractName

@genType
type eventArgs = unit
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.literal(%raw(`null`))->S.to(_ => ())
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = _ => ()

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = {  }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], )->Utils.unwrapResultExn)

}

module Upgraded = {

let id = "0xbc7cd75a20ee27fd9adebab32041f755214dbc6bffa90cc0225b39da2e5c2d3b_1"
let sighash = "0xbc7cd75a20ee27fd9adebab32041f755214dbc6bffa90cc0225b39da2e5c2d3b"
let name = "Upgraded"
let contractName = contractName

@genType
type eventArgs = {implementation: Address.t}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {implementation: s.field("implementation", Address.schema)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        implementation: decodedEvent.body->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = {  }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], )->Utils.unwrapResultExn)

}
}

module TokenMintERC20Token = {
let abi = Ethers.makeAbi((%raw(`[{"type":"event","name":"Approval","inputs":[{"name":"owner","type":"address","indexed":true},{"name":"spender","type":"address","indexed":true},{"name":"value","type":"uint256","indexed":false}],"anonymous":false},{"type":"event","name":"Transfer","inputs":[{"name":"from","type":"address","indexed":true},{"name":"to","type":"address","indexed":true},{"name":"value","type":"uint256","indexed":false}],"anonymous":false}]`): Js.Json.t))
let eventSignatures = ["Approval(address indexed owner, address indexed spender, uint256 value)", "Transfer(address indexed from, address indexed to, uint256 value)"]
let contractName = "TokenMintERC20Token"

module Approval = {

let id = "0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925_3"
let sighash = "0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925"
let name = "Approval"
let contractName = contractName

@genType
type eventArgs = {owner: Address.t, spender: Address.t, value: bigint}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {owner: s.field("owner", Address.schema), spender: s.field("spender", Address.schema), value: s.field("value", BigInt.schema)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        owner: decodedEvent.indexed->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
        spender: decodedEvent.indexed->Js.Array2.unsafe_get(1)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
        value: decodedEvent.body->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = { @as("owner") owner?: SingleOrMultiple.t<Address.t>, @as("spender") spender?: SingleOrMultiple.t<Address.t> }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], ~topic1=?_eventFilter.owner->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), ~topic2=?_eventFilter.spender->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), )->Utils.unwrapResultExn)

}

module Transfer = {

let id = "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef_3"
let sighash = "0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"
let name = "Transfer"
let contractName = contractName

@genType
type eventArgs = {from: Address.t, to: Address.t, value: bigint}
@genType
type block = Block.t
@genType
type transaction = Transaction.t

@genType
type event = Internal.genericEvent<eventArgs, block, transaction>
@genType
type loader<'loaderReturn> = Internal.genericLoader<Internal.genericLoaderArgs<event, loaderContext>, 'loaderReturn>
@genType
type handler<'loaderReturn> = Internal.genericHandler<Internal.genericHandlerArgs<event, handlerContext, 'loaderReturn>>
@genType
type contractRegister = Internal.genericContractRegister<Internal.genericContractRegisterArgs<event, contractRegistrations>>

let paramsRawEventSchema = S.object((s): eventArgs => {from: s.field("from", Address.schema), to: s.field("to", Address.schema), value: s.field("value", BigInt.schema)})
let blockSchema = Block.schema
let transactionSchema = Transaction.schema

let convertHyperSyncEventArgs = (decodedEvent: HyperSyncClient.Decoder.decodedEvent): eventArgs => {
      {
        from: decodedEvent.indexed->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
        to: decodedEvent.indexed->Js.Array2.unsafe_get(1)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
        value: decodedEvent.body->Js.Array2.unsafe_get(0)->HyperSyncClient.Decoder.toUnderlying->Utils.magic,
      }
    }

let handlerRegister: HandlerTypes.Register.t = HandlerTypes.Register.make(
  ~topic0=sighash->EvmTypes.Hex.fromStringUnsafe,
  ~contractName,
  ~eventName=name,
)

@genType
type eventFilter = { @as("from") from?: SingleOrMultiple.t<Address.t>, @as("to") to?: SingleOrMultiple.t<Address.t> }

let getTopicSelection = (eventFilters) => eventFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(_eventFilter => LogSelection.makeTopicSelection(~topic0=[sighash->EvmTypes.Hex.fromStringUnsafe], ~topic1=?_eventFilter.from->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), ~topic2=?_eventFilter.to->Belt.Option.map(topicFilters => topicFilters->SingleOrMultiple.normalizeOrThrow->Belt.Array.map(TopicFilter.fromAddress)), )->Utils.unwrapResultExn)

}
}

@genType
type chainId = int
