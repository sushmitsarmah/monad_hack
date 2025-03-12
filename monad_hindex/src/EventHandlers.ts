/*
 * Please refer to https://docs.envio.dev for a thorough guide on all Envio indexer features
 */
import {
  FiatTokenProxy,
  FiatTokenProxy_AdminChanged,
  FiatTokenProxy_Approval,
  FiatTokenProxy_AuthorizationCanceled,
  FiatTokenProxy_AuthorizationUsed,
  FiatTokenProxy_Blacklisted,
  FiatTokenProxy_BlacklisterChanged,
  FiatTokenProxy_Burn,
  FiatTokenProxy_MasterMinterChanged,
  FiatTokenProxy_Mint,
  FiatTokenProxy_MinterConfigured,
  FiatTokenProxy_MinterRemoved,
  FiatTokenProxy_OwnershipTransferred,
  FiatTokenProxy_Pause,
  FiatTokenProxy_PauserChanged,
  FiatTokenProxy_RescuerChanged,
  FiatTokenProxy_Transfer,
  FiatTokenProxy_UnBlacklisted,
  FiatTokenProxy_Unpause,
  FiatTokenProxy_Upgraded,
  TokenMintERC20Token,
  TokenMintERC20Token_Approval,
  TokenMintERC20Token_Transfer,
} from "generated";

FiatTokenProxy.AdminChanged.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_AdminChanged = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    previousAdmin: event.params.previousAdmin,
    newAdmin: event.params.newAdmin,
  };

  context.FiatTokenProxy_AdminChanged.set(entity);
});

FiatTokenProxy.Approval.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_Approval = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    owner: event.params.owner,
    spender: event.params.spender,
    value: event.params.value,
  };

  context.FiatTokenProxy_Approval.set(entity);
});

FiatTokenProxy.AuthorizationCanceled.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_AuthorizationCanceled = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    authorizer: event.params.authorizer,
    nonce: event.params.nonce,
  };

  context.FiatTokenProxy_AuthorizationCanceled.set(entity);
});

FiatTokenProxy.AuthorizationUsed.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_AuthorizationUsed = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    authorizer: event.params.authorizer,
    nonce: event.params.nonce,
  };

  context.FiatTokenProxy_AuthorizationUsed.set(entity);
});

FiatTokenProxy.Blacklisted.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_Blacklisted = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    _account: event.params._account,
  };

  context.FiatTokenProxy_Blacklisted.set(entity);
});

FiatTokenProxy.BlacklisterChanged.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_BlacklisterChanged = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    newBlacklister: event.params.newBlacklister,
  };

  context.FiatTokenProxy_BlacklisterChanged.set(entity);
});

FiatTokenProxy.Burn.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_Burn = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    burner: event.params.burner,
    amount: event.params.amount,
  };

  context.FiatTokenProxy_Burn.set(entity);
});

FiatTokenProxy.MasterMinterChanged.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_MasterMinterChanged = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    newMasterMinter: event.params.newMasterMinter,
  };

  context.FiatTokenProxy_MasterMinterChanged.set(entity);
});

FiatTokenProxy.Mint.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_Mint = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    minter: event.params.minter,
    to: event.params.to,
    amount: event.params.amount,
  };

  context.FiatTokenProxy_Mint.set(entity);
});

FiatTokenProxy.MinterConfigured.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_MinterConfigured = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    minter: event.params.minter,
    minterAllowedAmount: event.params.minterAllowedAmount,
  };

  context.FiatTokenProxy_MinterConfigured.set(entity);
});

FiatTokenProxy.MinterRemoved.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_MinterRemoved = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    oldMinter: event.params.oldMinter,
  };

  context.FiatTokenProxy_MinterRemoved.set(entity);
});

FiatTokenProxy.OwnershipTransferred.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_OwnershipTransferred = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    previousOwner: event.params.previousOwner,
    newOwner: event.params.newOwner,
  };

  context.FiatTokenProxy_OwnershipTransferred.set(entity);
});

FiatTokenProxy.Pause.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_Pause = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
  };

  context.FiatTokenProxy_Pause.set(entity);
});

FiatTokenProxy.PauserChanged.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_PauserChanged = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    newAddress: event.params.newAddress,
  };

  context.FiatTokenProxy_PauserChanged.set(entity);
});

FiatTokenProxy.RescuerChanged.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_RescuerChanged = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    newRescuer: event.params.newRescuer,
  };

  context.FiatTokenProxy_RescuerChanged.set(entity);
});

FiatTokenProxy.Transfer.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_Transfer = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    from: event.params.from,
    to: event.params.to,
    value: event.params.value,
  };

  context.FiatTokenProxy_Transfer.set(entity);
});

FiatTokenProxy.UnBlacklisted.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_UnBlacklisted = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    _account: event.params._account,
  };

  context.FiatTokenProxy_UnBlacklisted.set(entity);
});

FiatTokenProxy.Unpause.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_Unpause = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
  };

  context.FiatTokenProxy_Unpause.set(entity);
});

FiatTokenProxy.Upgraded.handler(async ({ event, context }) => {
  const entity: FiatTokenProxy_Upgraded = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    implementation: event.params.implementation,
  };

  context.FiatTokenProxy_Upgraded.set(entity);
});

TokenMintERC20Token.Approval.handler(async ({ event, context }) => {
  const entity: TokenMintERC20Token_Approval = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    owner: event.params.owner,
    spender: event.params.spender,
    value: event.params.value,
  };

  context.TokenMintERC20Token_Approval.set(entity);
});

TokenMintERC20Token.Transfer.handler(async ({ event, context }) => {
  const entity: TokenMintERC20Token_Transfer = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    from: event.params.from,
    to: event.params.to,
    value: event.params.value,
  };

  context.TokenMintERC20Token_Transfer.set(entity);
});
