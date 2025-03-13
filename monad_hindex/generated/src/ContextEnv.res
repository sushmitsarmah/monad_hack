open Types

/**
The context holds all the state for a given events loader and handler.
*/
type t = {
  logger: Pino.t,
  eventItem: Internal.eventItem,
}

let getUserLogger = (logger): Logs.userLogger => {
  info: (message: string) => logger->Logging.uinfo(message),
  debug: (message: string) => logger->Logging.udebug(message),
  warn: (message: string) => logger->Logging.uwarn(message),
  error: (message: string) => logger->Logging.uerror(message),
  errorWithExn: (exn: option<Js.Exn.t>, message: string) =>
    logger->Logging.uerrorWithExn(exn, message),
}

let makeEventIdentifier = (
  eventItem: Internal.eventItem,
): Types.eventIdentifier => {
  let {event, blockNumber, timestamp} = eventItem
  {
    chainId: event.chainId,
    blockTimestamp: timestamp,
    blockNumber,
    logIndex: event.logIndex,
  }
}

let getEventId = (eventItem: Internal.eventItem) => {
  EventUtils.packEventIndex(
    ~blockNumber=eventItem.blockNumber,
    ~logIndex=eventItem.event.logIndex,
  )
}

let make = (~eventItem: Internal.eventItem, ~logger) => {
  let {event, chain, eventName, contractName, blockNumber} = eventItem
  let logger = logger->(
    Logging.createChildFrom(
      ~logger=_,
      ~params={
        "context": `Event '${eventName}' for contract '${contractName}'`,
        "chainId": chain->ChainMap.Chain.toChainId,
        "block": blockNumber,
        "logIndex": event.logIndex,
      },
    )
  )

  {
    logger,
    eventItem,
  }
}

let makeDynamicContractId = (~chainId, ~contractAddress) => {
  chainId->Belt.Int.toString ++ "-" ++ contractAddress->Address.toString
}

let makeDynamicContractRegisterFn = (
  ~contractName: Enums.ContractType.t,
  ~onRegister,
) => (contractAddress: Address.t) => {
   
  // Even though it's the Address.t type on ReScript side, for TS side it's a string.
  // So we need to ensure that it's a valid checksummed address.
  let contractAddress = contractAddress->Address.Evm.fromAddressOrThrow

  onRegister(~contractAddress, ~contractName)
}

let makeWhereLoader = (
  loadLayer,
  ~entityMod,
  ~inMemoryStore,
  ~fieldName,
  ~fieldValueSchema,
  ~logger,
) => {
  Entities.eq: loadLayer->LoadLayer.makeWhereLoader(
    ~operator=Eq,
    ~entityMod,
    ~fieldName,
    ~fieldValueSchema,
    ~inMemoryStore,
    ~logger,
  ),
  gt: loadLayer->LoadLayer.makeWhereLoader(
    ~operator=Gt,
    ~entityMod,
    ~fieldName,
    ~fieldValueSchema,
    ~inMemoryStore,
    ~logger,
  ),
}

let makeEntityHandlerContext = (
  type entity,
  ~eventIdentifier,
  ~inMemoryStore,
  ~entityMod: module(Entities.Entity with type t = entity),
  ~logger,
  ~getKey,
  ~loadLayer,
  ~shouldSaveHistory,
): entityHandlerContext<entity> => {
  let inMemTable = inMemoryStore->InMemoryStore.getInMemTable(~entityMod)
  {
    set: entity => {
      inMemTable->InMemoryTable.Entity.set(
        Set(entity)->Types.mkEntityUpdate(~eventIdentifier, ~entityId=getKey(entity)),
        ~shouldSaveHistory,
      )
    },
    deleteUnsafe: entityId => {
      inMemTable->InMemoryTable.Entity.set(
        Delete->Types.mkEntityUpdate(~eventIdentifier, ~entityId),
        ~shouldSaveHistory,
      )
    },
    get: loadLayer->LoadLayer.makeLoader(~entityMod, ~logger, ~inMemoryStore),
  }
}

let getContractRegisterContext = (~onRegister) => {
  //TODO only add contracts we've registered for the event in the config
  addCHOGTokenMintERC20Token:  makeDynamicContractRegisterFn(~contractName=CHOGTokenMintERC20Token, ~onRegister),
  addDAKTokenMintERC20Token:  makeDynamicContractRegisterFn(~contractName=DAKTokenMintERC20Token, ~onRegister),
  addWETHTokenMintERC20Token:  makeDynamicContractRegisterFn(~contractName=WETHTokenMintERC20Token, ~onRegister),
  addYAKITokenMintERC20Token:  makeDynamicContractRegisterFn(~contractName=YAKITokenMintERC20Token, ~onRegister),
}->(Utils.magic: Types.contractRegistrations => Internal.contractRegisterContext)

let getLoaderContext = (contextEnv: t, ~inMemoryStore: InMemoryStore.t, ~loadLayer: LoadLayer.t) => {
  let {logger} = contextEnv
  {
    log: logger->getUserLogger,
    cHOGTokenMintERC20Token_Approval: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.CHOGTokenMintERC20Token_Approval),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    cHOGTokenMintERC20Token_Transfer: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.CHOGTokenMintERC20Token_Transfer),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    dAKTokenMintERC20Token_Approval: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.DAKTokenMintERC20Token_Approval),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    dAKTokenMintERC20Token_Transfer: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.DAKTokenMintERC20Token_Transfer),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    wETHTokenMintERC20Token_Approval: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.WETHTokenMintERC20Token_Approval),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    wETHTokenMintERC20Token_Transfer: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.WETHTokenMintERC20Token_Transfer),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    yAKITokenMintERC20Token_Approval: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.YAKITokenMintERC20Token_Approval),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    yAKITokenMintERC20Token_Transfer: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.YAKITokenMintERC20Token_Transfer),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
  }->(Utils.magic: Types.loaderContext => Internal.loaderContext)
}

let getHandlerContext = (
  context,
  ~inMemoryStore: InMemoryStore.t,
  ~loadLayer,
  ~shouldSaveHistory,
) => {
  let {eventItem, logger} = context

  let eventIdentifier = eventItem->makeEventIdentifier
  {
    log: logger->getUserLogger,
    cHOGTokenMintERC20Token_Approval: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.CHOGTokenMintERC20Token_Approval),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    cHOGTokenMintERC20Token_Transfer: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.CHOGTokenMintERC20Token_Transfer),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    dAKTokenMintERC20Token_Approval: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.DAKTokenMintERC20Token_Approval),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    dAKTokenMintERC20Token_Transfer: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.DAKTokenMintERC20Token_Transfer),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    wETHTokenMintERC20Token_Approval: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.WETHTokenMintERC20Token_Approval),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    wETHTokenMintERC20Token_Transfer: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.WETHTokenMintERC20Token_Transfer),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    yAKITokenMintERC20Token_Approval: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.YAKITokenMintERC20Token_Approval),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    yAKITokenMintERC20Token_Transfer: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.YAKITokenMintERC20Token_Transfer),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
  }->(Utils.magic: Types.handlerContext => Internal.handlerContext)
}

let getContractRegisterArgs = (contextEnv, ~onRegister): Internal.contractRegisterArgs => {
  event: contextEnv.eventItem.event,
  context: getContractRegisterContext(~onRegister),
}

let getLoaderArgs = (contextEnv, ~inMemoryStore, ~loadLayer): Internal.loaderArgs => {
  event: contextEnv.eventItem.event,
  context: contextEnv->getLoaderContext(~inMemoryStore, ~loadLayer),
}

let getHandlerArgs = (
  contextEnv,
  ~inMemoryStore,
  ~loaderReturn,
  ~loadLayer,
  ~shouldSaveHistory,
): Internal.handlerArgs => {
  event: contextEnv.eventItem.event,
  context: contextEnv->getHandlerContext(~inMemoryStore, ~loadLayer, ~shouldSaveHistory),
  loaderReturn,
}
