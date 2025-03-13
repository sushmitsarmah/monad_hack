/*
 * Please refer to https://docs.envio.dev for a thorough guide on all Envio indexer features
 */
const {
 L1ChugSplashProxy,
 '$$Proxy': Proxy
} = require("generated");

console.log(Proxy)

L1ChugSplashProxy.ERC20BridgeFinalized.handler(async ({event, context}) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    localToken: event.params.localToken,
    remoteToken: event.params.remoteToken,
    from: event.params.from,
    to: event.params.to,
    amount: event.params.amount,
    extraData: event.params.extraData,
  };

  context.L1ChugSplashProxy_ERC20BridgeFinalized.set(entity);
});


L1ChugSplashProxy.ERC20BridgeInitiated.handler(async ({event, context}) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    localToken: event.params.localToken,
    remoteToken: event.params.remoteToken,
    from: event.params.from,
    to: event.params.to,
    amount: event.params.amount,
    extraData: event.params.extraData,
  };

  context.L1ChugSplashProxy_ERC20BridgeInitiated.set(entity);
});


L1ChugSplashProxy.ERC20DepositInitiated.handler(async ({event, context}) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    l1Token: event.params.l1Token,
    l2Token: event.params.l2Token,
    from: event.params.from,
    to: event.params.to,
    amount: event.params.amount,
    extraData: event.params.extraData,
  };

  context.L1ChugSplashProxy_ERC20DepositInitiated.set(entity);
});


L1ChugSplashProxy.ERC20WithdrawalFinalized.handler(async ({event, context}) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    l1Token: event.params.l1Token,
    l2Token: event.params.l2Token,
    from: event.params.from,
    to: event.params.to,
    amount: event.params.amount,
    extraData: event.params.extraData,
  };

  context.L1ChugSplashProxy_ERC20WithdrawalFinalized.set(entity);
});


L1ChugSplashProxy.ETHBridgeFinalized.handler(async ({event, context}) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    from: event.params.from,
    to: event.params.to,
    amount: event.params.amount,
    extraData: event.params.extraData,
  };

  context.L1ChugSplashProxy_ETHBridgeFinalized.set(entity);
});


L1ChugSplashProxy.ETHBridgeInitiated.handler(async ({event, context}) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    from: event.params.from,
    to: event.params.to,
    amount: event.params.amount,
    extraData: event.params.extraData,
  };

  context.L1ChugSplashProxy_ETHBridgeInitiated.set(entity);
});


L1ChugSplashProxy.ETHDepositInitiated.handler(async ({event, context}) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    from: event.params.from,
    to: event.params.to,
    amount: event.params.amount,
    extraData: event.params.extraData,
  };

  context.L1ChugSplashProxy_ETHDepositInitiated.set(entity);
});


L1ChugSplashProxy.ETHWithdrawalFinalized.handler(async ({event, context}) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    from: event.params.from,
    to: event.params.to,
    amount: event.params.amount,
    extraData: event.params.extraData,
  };

  context.L1ChugSplashProxy_ETHWithdrawalFinalized.set(entity);
});


L1ChugSplashProxy.Initialized.handler(async ({event, context}) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    version: event.params.version,
  };

  context.L1ChugSplashProxy_Initialized.set(entity);
});


Proxy.AdminChanged.handler(async ({event, context}) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    previousAdmin: event.params.previousAdmin,
    newAdmin: event.params.newAdmin,
  };

  context.Proxy_AdminChanged.set(entity);
});


Proxy.DepositFinalized.handler(async ({event, context}) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    l1Token: event.params.l1Token,
    l2Token: event.params.l2Token,
    from: event.params.from,
    to: event.params.to,
    amount: event.params.amount,
    extraData: event.params.extraData,
  };

  context.Proxy_DepositFinalized.set(entity);
});


Proxy.ERC20BridgeFinalized.handler(async ({event, context}) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    localToken: event.params.localToken,
    remoteToken: event.params.remoteToken,
    from: event.params.from,
    to: event.params.to,
    amount: event.params.amount,
    extraData: event.params.extraData,
  };

  context.Proxy_ERC20BridgeFinalized.set(entity);
});


Proxy.ERC20BridgeInitiated.handler(async ({event, context}) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    localToken: event.params.localToken,
    remoteToken: event.params.remoteToken,
    from: event.params.from,
    to: event.params.to,
    amount: event.params.amount,
    extraData: event.params.extraData,
  };

  context.Proxy_ERC20BridgeInitiated.set(entity);
});


Proxy.ETHBridgeFinalized.handler(async ({event, context}) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    from: event.params.from,
    to: event.params.to,
    amount: event.params.amount,
    extraData: event.params.extraData,
  };

  context.Proxy_ETHBridgeFinalized.set(entity);
});


Proxy.ETHBridgeInitiated.handler(async ({event, context}) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    from: event.params.from,
    to: event.params.to,
    amount: event.params.amount,
    extraData: event.params.extraData,
  };

  context.Proxy_ETHBridgeInitiated.set(entity);
});


Proxy.Upgraded.handler(async ({event, context}) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    implementation: event.params.implementation,
  };

  context.Proxy_Upgraded.set(entity);
});


Proxy.WithdrawalInitiated.handler(async ({event, context}) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    l1Token: event.params.l1Token,
    l2Token: event.params.l2Token,
    from: event.params.from,
    to: event.params.to,
    amount: event.params.amount,
    extraData: event.params.extraData,
  };

  context.Proxy_WithdrawalInitiated.set(entity);
});

