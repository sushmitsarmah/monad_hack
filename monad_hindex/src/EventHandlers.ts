/*
 * Please refer to https://docs.envio.dev for a thorough guide on all Envio indexer features
 */
import {
  CHOGTokenMintERC20Token,
  DAKTokenMintERC20Token,
  WETHTokenMintERC20Token,
  YAKITokenMintERC20Token,
} from "generated";

CHOGTokenMintERC20Token.Approval.handler(async ({ event, context }) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    owner: event.params.owner,
    spender: event.params.spender,
    value: event.params.value,
  };

  context.CHOGTokenMintERC20Token_Approval.set(entity);
});

CHOGTokenMintERC20Token.Transfer.handler(async ({ event, context }) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    from: event.params.from,
    to: event.params.to,
    value: event.params.value,
  };

  context.CHOGTokenMintERC20Token_Transfer.set(entity);
});

DAKTokenMintERC20Token.Approval.handler(async ({ event, context }) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    owner: event.params.owner,
    spender: event.params.spender,
    value: event.params.value,
  };

  context.DAKTokenMintERC20Token_Approval.set(entity);
});

DAKTokenMintERC20Token.Transfer.handler(async ({ event, context }) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    from: event.params.from,
    to: event.params.to,
    value: event.params.value,
  };

  context.DAKTokenMintERC20Token_Transfer.set(entity);
});

YAKITokenMintERC20Token.Approval.handler(async ({ event, context }) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    owner: event.params.owner,
    spender: event.params.spender,
    value: event.params.value,
  };

  context.YAKITokenMintERC20Token_Approval.set(entity);
});

YAKITokenMintERC20Token.Transfer.handler(async ({ event, context }) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    from: event.params.from,
    to: event.params.to,
    value: event.params.value,
  };

  context.YAKITokenMintERC20Token_Transfer.set(entity);
});

WETHTokenMintERC20Token.Approval.handler(async ({ event, context }) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    owner: event.params.owner,
    spender: event.params.spender,
    value: event.params.value,
  };

  context.WETHTokenMintERC20Token_Approval.set(entity);
});

WETHTokenMintERC20Token.Transfer.handler(async ({ event, context }) => {
  const entity = {
    id: `${event.chainId}_${event.block.number}_${event.logIndex}`,
    from: event.params.from,
    to: event.params.to,
    value: event.params.value,
  };

  context.WETHTokenMintERC20Token_Transfer.set(entity);
});
