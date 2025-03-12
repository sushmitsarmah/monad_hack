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
  addFiatTokenProxy:  makeDynamicContractRegisterFn(~contractName=FiatTokenProxy, ~onRegister),
  addTokenMintERC20Token:  makeDynamicContractRegisterFn(~contractName=TokenMintERC20Token, ~onRegister),
}->(Utils.magic: Types.contractRegistrations => Internal.contractRegisterContext)

let getLoaderContext = (contextEnv: t, ~inMemoryStore: InMemoryStore.t, ~loadLayer: LoadLayer.t) => {
  let {logger} = contextEnv
  {
    log: logger->getUserLogger,
    fiatTokenProxy_AdminChanged: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_AdminChanged),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    fiatTokenProxy_Approval: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_Approval),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    fiatTokenProxy_AuthorizationCanceled: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_AuthorizationCanceled),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    fiatTokenProxy_AuthorizationUsed: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_AuthorizationUsed),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    fiatTokenProxy_Blacklisted: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_Blacklisted),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    fiatTokenProxy_BlacklisterChanged: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_BlacklisterChanged),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    fiatTokenProxy_Burn: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_Burn),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    fiatTokenProxy_MasterMinterChanged: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_MasterMinterChanged),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    fiatTokenProxy_Mint: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_Mint),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    fiatTokenProxy_MinterConfigured: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_MinterConfigured),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    fiatTokenProxy_MinterRemoved: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_MinterRemoved),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    fiatTokenProxy_OwnershipTransferred: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_OwnershipTransferred),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    fiatTokenProxy_Pause: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_Pause),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    fiatTokenProxy_PauserChanged: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_PauserChanged),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    fiatTokenProxy_RescuerChanged: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_RescuerChanged),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    fiatTokenProxy_Transfer: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_Transfer),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    fiatTokenProxy_UnBlacklisted: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_UnBlacklisted),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    fiatTokenProxy_Unpause: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_Unpause),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    fiatTokenProxy_Upgraded: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.FiatTokenProxy_Upgraded),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    tokenMintERC20Token_Approval: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.TokenMintERC20Token_Approval),
        ~inMemoryStore,
        ~logger,
      ),
      getWhere: {
        
      },
    },
    tokenMintERC20Token_Transfer: {
      get: loadLayer->LoadLayer.makeLoader(
        ~entityMod=module(Entities.TokenMintERC20Token_Transfer),
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
    fiatTokenProxy_AdminChanged: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_AdminChanged),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fiatTokenProxy_Approval: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_Approval),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fiatTokenProxy_AuthorizationCanceled: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_AuthorizationCanceled),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fiatTokenProxy_AuthorizationUsed: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_AuthorizationUsed),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fiatTokenProxy_Blacklisted: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_Blacklisted),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fiatTokenProxy_BlacklisterChanged: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_BlacklisterChanged),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fiatTokenProxy_Burn: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_Burn),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fiatTokenProxy_MasterMinterChanged: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_MasterMinterChanged),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fiatTokenProxy_Mint: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_Mint),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fiatTokenProxy_MinterConfigured: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_MinterConfigured),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fiatTokenProxy_MinterRemoved: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_MinterRemoved),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fiatTokenProxy_OwnershipTransferred: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_OwnershipTransferred),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fiatTokenProxy_Pause: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_Pause),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fiatTokenProxy_PauserChanged: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_PauserChanged),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fiatTokenProxy_RescuerChanged: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_RescuerChanged),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fiatTokenProxy_Transfer: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_Transfer),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fiatTokenProxy_UnBlacklisted: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_UnBlacklisted),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fiatTokenProxy_Unpause: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_Unpause),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    fiatTokenProxy_Upgraded: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.FiatTokenProxy_Upgraded),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    tokenMintERC20Token_Approval: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.TokenMintERC20Token_Approval),
      ~getKey=entity => entity.id,
      ~logger,
      ~loadLayer,
      ~shouldSaveHistory,
    ),
    tokenMintERC20Token_Transfer: makeEntityHandlerContext(
      ~eventIdentifier,
      ~inMemoryStore,
      ~entityMod=module(Entities.TokenMintERC20Token_Transfer),
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
