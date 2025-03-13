/* TypeScript file generated from Entities.res by genType. */

/* eslint-disable */
/* tslint:disable */

export type id = string;

export type whereOperations<entity,fieldType> = { readonly eq: (_1:fieldType) => Promise<entity[]>; readonly gt: (_1:fieldType) => Promise<entity[]> };

export type CHOGTokenMintERC20Token_Approval_t = {
  readonly id: id; 
  readonly owner: string; 
  readonly spender: string; 
  readonly value: bigint
};

export type CHOGTokenMintERC20Token_Approval_indexedFieldOperations = {};

export type CHOGTokenMintERC20Token_Transfer_t = {
  readonly from: string; 
  readonly id: id; 
  readonly to: string; 
  readonly value: bigint
};

export type CHOGTokenMintERC20Token_Transfer_indexedFieldOperations = {};

export type DAKTokenMintERC20Token_Approval_t = {
  readonly id: id; 
  readonly owner: string; 
  readonly spender: string; 
  readonly value: bigint
};

export type DAKTokenMintERC20Token_Approval_indexedFieldOperations = {};

export type DAKTokenMintERC20Token_Transfer_t = {
  readonly from: string; 
  readonly id: id; 
  readonly to: string; 
  readonly value: bigint
};

export type DAKTokenMintERC20Token_Transfer_indexedFieldOperations = {};

export type WETHTokenMintERC20Token_Approval_t = {
  readonly id: id; 
  readonly owner: string; 
  readonly spender: string; 
  readonly value: bigint
};

export type WETHTokenMintERC20Token_Approval_indexedFieldOperations = {};

export type WETHTokenMintERC20Token_Transfer_t = {
  readonly from: string; 
  readonly id: id; 
  readonly to: string; 
  readonly value: bigint
};

export type WETHTokenMintERC20Token_Transfer_indexedFieldOperations = {};

export type YAKITokenMintERC20Token_Approval_t = {
  readonly id: id; 
  readonly owner: string; 
  readonly spender: string; 
  readonly value: bigint
};

export type YAKITokenMintERC20Token_Approval_indexedFieldOperations = {};

export type YAKITokenMintERC20Token_Transfer_t = {
  readonly from: string; 
  readonly id: id; 
  readonly to: string; 
  readonly value: bigint
};

export type YAKITokenMintERC20Token_Transfer_indexedFieldOperations = {};
