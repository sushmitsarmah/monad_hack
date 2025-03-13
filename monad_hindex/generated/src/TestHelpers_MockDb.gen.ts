/* TypeScript file generated from TestHelpers_MockDb.res by genType. */

/* eslint-disable */
/* tslint:disable */

const TestHelpers_MockDbJS = require('./TestHelpers_MockDb.bs.js');

import type {CHOGTokenMintERC20Token_Approval_t as Entities_CHOGTokenMintERC20Token_Approval_t} from '../src/db/Entities.gen';

import type {CHOGTokenMintERC20Token_Transfer_t as Entities_CHOGTokenMintERC20Token_Transfer_t} from '../src/db/Entities.gen';

import type {DAKTokenMintERC20Token_Approval_t as Entities_DAKTokenMintERC20Token_Approval_t} from '../src/db/Entities.gen';

import type {DAKTokenMintERC20Token_Transfer_t as Entities_DAKTokenMintERC20Token_Transfer_t} from '../src/db/Entities.gen';

import type {DynamicContractRegistry_t as TablesStatic_DynamicContractRegistry_t} from '../src/db/TablesStatic.gen';

import type {EventSyncState_t as TablesStatic_EventSyncState_t} from '../src/db/TablesStatic.gen';

import type {RawEvents_t as TablesStatic_RawEvents_t} from '../src/db/TablesStatic.gen';

import type {WETHTokenMintERC20Token_Approval_t as Entities_WETHTokenMintERC20Token_Approval_t} from '../src/db/Entities.gen';

import type {WETHTokenMintERC20Token_Transfer_t as Entities_WETHTokenMintERC20Token_Transfer_t} from '../src/db/Entities.gen';

import type {YAKITokenMintERC20Token_Approval_t as Entities_YAKITokenMintERC20Token_Approval_t} from '../src/db/Entities.gen';

import type {YAKITokenMintERC20Token_Transfer_t as Entities_YAKITokenMintERC20Token_Transfer_t} from '../src/db/Entities.gen';

import type {chainId as Types_chainId} from './Types.gen';

import type {rawEventsKey as InMemoryStore_rawEventsKey} from './InMemoryStore.gen';

/** The mockDb type is simply an InMemoryStore internally. __dbInternal__ holds a reference
to an inMemoryStore and all the the accessor methods point to the reference of that inMemory
store */
export abstract class inMemoryStore { protected opaque!: any }; /* simulate opaque types */

export type t = {
  readonly __dbInternal__: inMemoryStore; 
  readonly entities: entities; 
  readonly rawEvents: storeOperations<InMemoryStore_rawEventsKey,TablesStatic_RawEvents_t>; 
  readonly eventSyncState: storeOperations<Types_chainId,TablesStatic_EventSyncState_t>; 
  readonly dynamicContractRegistry: entityStoreOperations<TablesStatic_DynamicContractRegistry_t>
};

export type entities = {
  readonly CHOGTokenMintERC20Token_Approval: entityStoreOperations<Entities_CHOGTokenMintERC20Token_Approval_t>; 
  readonly CHOGTokenMintERC20Token_Transfer: entityStoreOperations<Entities_CHOGTokenMintERC20Token_Transfer_t>; 
  readonly DAKTokenMintERC20Token_Approval: entityStoreOperations<Entities_DAKTokenMintERC20Token_Approval_t>; 
  readonly DAKTokenMintERC20Token_Transfer: entityStoreOperations<Entities_DAKTokenMintERC20Token_Transfer_t>; 
  readonly WETHTokenMintERC20Token_Approval: entityStoreOperations<Entities_WETHTokenMintERC20Token_Approval_t>; 
  readonly WETHTokenMintERC20Token_Transfer: entityStoreOperations<Entities_WETHTokenMintERC20Token_Transfer_t>; 
  readonly YAKITokenMintERC20Token_Approval: entityStoreOperations<Entities_YAKITokenMintERC20Token_Approval_t>; 
  readonly YAKITokenMintERC20Token_Transfer: entityStoreOperations<Entities_YAKITokenMintERC20Token_Transfer_t>
};

export type entityStoreOperations<entity> = storeOperations<string,entity>;

export type storeOperations<entityKey,entity> = {
  readonly getAll: () => entity[]; 
  readonly get: (_1:entityKey) => (undefined | entity); 
  readonly set: (_1:entity) => t; 
  readonly delete: (_1:entityKey) => t
};

/** The constructor function for a mockDb. Call it and then set up the inital state by calling
any of the set functions it provides access to. A mockDb will be passed into a processEvent 
helper. Note, process event helpers will not mutate the mockDb but return a new mockDb with
new state so you can compare states before and after. */
export const createMockDb: () => t = TestHelpers_MockDbJS.createMockDb as any;
