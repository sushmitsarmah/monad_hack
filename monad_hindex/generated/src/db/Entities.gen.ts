/* TypeScript file generated from Entities.res by genType. */

/* eslint-disable */
/* tslint:disable */

export type id = string;

export type whereOperations<entity,fieldType> = { readonly eq: (_1:fieldType) => Promise<entity[]>; readonly gt: (_1:fieldType) => Promise<entity[]> };

export type FiatTokenProxy_AdminChanged_t = {
  readonly id: id; 
  readonly newAdmin: string; 
  readonly previousAdmin: string
};

export type FiatTokenProxy_AdminChanged_indexedFieldOperations = {};

export type FiatTokenProxy_Approval_t = {
  readonly id: id; 
  readonly owner: string; 
  readonly spender: string; 
  readonly value: bigint
};

export type FiatTokenProxy_Approval_indexedFieldOperations = {};

export type FiatTokenProxy_AuthorizationCanceled_t = {
  readonly authorizer: string; 
  readonly id: id; 
  readonly nonce: string
};

export type FiatTokenProxy_AuthorizationCanceled_indexedFieldOperations = {};

export type FiatTokenProxy_AuthorizationUsed_t = {
  readonly authorizer: string; 
  readonly id: id; 
  readonly nonce: string
};

export type FiatTokenProxy_AuthorizationUsed_indexedFieldOperations = {};

export type FiatTokenProxy_Blacklisted_t = { readonly _account: string; readonly id: id };

export type FiatTokenProxy_Blacklisted_indexedFieldOperations = {};

export type FiatTokenProxy_BlacklisterChanged_t = { readonly id: id; readonly newBlacklister: string };

export type FiatTokenProxy_BlacklisterChanged_indexedFieldOperations = {};

export type FiatTokenProxy_Burn_t = {
  readonly amount: bigint; 
  readonly burner: string; 
  readonly id: id
};

export type FiatTokenProxy_Burn_indexedFieldOperations = {};

export type FiatTokenProxy_MasterMinterChanged_t = { readonly id: id; readonly newMasterMinter: string };

export type FiatTokenProxy_MasterMinterChanged_indexedFieldOperations = {};

export type FiatTokenProxy_Mint_t = {
  readonly amount: bigint; 
  readonly id: id; 
  readonly minter: string; 
  readonly to: string
};

export type FiatTokenProxy_Mint_indexedFieldOperations = {};

export type FiatTokenProxy_MinterConfigured_t = {
  readonly id: id; 
  readonly minter: string; 
  readonly minterAllowedAmount: bigint
};

export type FiatTokenProxy_MinterConfigured_indexedFieldOperations = {};

export type FiatTokenProxy_MinterRemoved_t = { readonly id: id; readonly oldMinter: string };

export type FiatTokenProxy_MinterRemoved_indexedFieldOperations = {};

export type FiatTokenProxy_OwnershipTransferred_t = {
  readonly id: id; 
  readonly newOwner: string; 
  readonly previousOwner: string
};

export type FiatTokenProxy_OwnershipTransferred_indexedFieldOperations = {};

export type FiatTokenProxy_Pause_t = { readonly id: id };

export type FiatTokenProxy_Pause_indexedFieldOperations = {};

export type FiatTokenProxy_PauserChanged_t = { readonly id: id; readonly newAddress: string };

export type FiatTokenProxy_PauserChanged_indexedFieldOperations = {};

export type FiatTokenProxy_RescuerChanged_t = { readonly id: id; readonly newRescuer: string };

export type FiatTokenProxy_RescuerChanged_indexedFieldOperations = {};

export type FiatTokenProxy_Transfer_t = {
  readonly from: string; 
  readonly id: id; 
  readonly to: string; 
  readonly value: bigint
};

export type FiatTokenProxy_Transfer_indexedFieldOperations = {};

export type FiatTokenProxy_UnBlacklisted_t = { readonly _account: string; readonly id: id };

export type FiatTokenProxy_UnBlacklisted_indexedFieldOperations = {};

export type FiatTokenProxy_Unpause_t = { readonly id: id };

export type FiatTokenProxy_Unpause_indexedFieldOperations = {};

export type FiatTokenProxy_Upgraded_t = { readonly id: id; readonly implementation: string };

export type FiatTokenProxy_Upgraded_indexedFieldOperations = {};

export type TokenMintERC20Token_Approval_t = {
  readonly id: id; 
  readonly owner: string; 
  readonly spender: string; 
  readonly value: bigint
};

export type TokenMintERC20Token_Approval_indexedFieldOperations = {};

export type TokenMintERC20Token_Transfer_t = {
  readonly from: string; 
  readonly id: id; 
  readonly to: string; 
  readonly value: bigint
};

export type TokenMintERC20Token_Transfer_indexedFieldOperations = {};
