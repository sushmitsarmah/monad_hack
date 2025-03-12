/* TypeScript file generated from TestHelpers_MockDb.res by genType. */

/* eslint-disable */
/* tslint:disable */

const TestHelpers_MockDbJS = require('./TestHelpers_MockDb.bs.js');

import type {DynamicContractRegistry_t as TablesStatic_DynamicContractRegistry_t} from '../src/db/TablesStatic.gen';

import type {EventSyncState_t as TablesStatic_EventSyncState_t} from '../src/db/TablesStatic.gen';

import type {FiatTokenProxy_AdminChanged_t as Entities_FiatTokenProxy_AdminChanged_t} from '../src/db/Entities.gen';

import type {FiatTokenProxy_Approval_t as Entities_FiatTokenProxy_Approval_t} from '../src/db/Entities.gen';

import type {FiatTokenProxy_AuthorizationCanceled_t as Entities_FiatTokenProxy_AuthorizationCanceled_t} from '../src/db/Entities.gen';

import type {FiatTokenProxy_AuthorizationUsed_t as Entities_FiatTokenProxy_AuthorizationUsed_t} from '../src/db/Entities.gen';

import type {FiatTokenProxy_Blacklisted_t as Entities_FiatTokenProxy_Blacklisted_t} from '../src/db/Entities.gen';

import type {FiatTokenProxy_BlacklisterChanged_t as Entities_FiatTokenProxy_BlacklisterChanged_t} from '../src/db/Entities.gen';

import type {FiatTokenProxy_Burn_t as Entities_FiatTokenProxy_Burn_t} from '../src/db/Entities.gen';

import type {FiatTokenProxy_MasterMinterChanged_t as Entities_FiatTokenProxy_MasterMinterChanged_t} from '../src/db/Entities.gen';

import type {FiatTokenProxy_Mint_t as Entities_FiatTokenProxy_Mint_t} from '../src/db/Entities.gen';

import type {FiatTokenProxy_MinterConfigured_t as Entities_FiatTokenProxy_MinterConfigured_t} from '../src/db/Entities.gen';

import type {FiatTokenProxy_MinterRemoved_t as Entities_FiatTokenProxy_MinterRemoved_t} from '../src/db/Entities.gen';

import type {FiatTokenProxy_OwnershipTransferred_t as Entities_FiatTokenProxy_OwnershipTransferred_t} from '../src/db/Entities.gen';

import type {FiatTokenProxy_Pause_t as Entities_FiatTokenProxy_Pause_t} from '../src/db/Entities.gen';

import type {FiatTokenProxy_PauserChanged_t as Entities_FiatTokenProxy_PauserChanged_t} from '../src/db/Entities.gen';

import type {FiatTokenProxy_RescuerChanged_t as Entities_FiatTokenProxy_RescuerChanged_t} from '../src/db/Entities.gen';

import type {FiatTokenProxy_Transfer_t as Entities_FiatTokenProxy_Transfer_t} from '../src/db/Entities.gen';

import type {FiatTokenProxy_UnBlacklisted_t as Entities_FiatTokenProxy_UnBlacklisted_t} from '../src/db/Entities.gen';

import type {FiatTokenProxy_Unpause_t as Entities_FiatTokenProxy_Unpause_t} from '../src/db/Entities.gen';

import type {FiatTokenProxy_Upgraded_t as Entities_FiatTokenProxy_Upgraded_t} from '../src/db/Entities.gen';

import type {RawEvents_t as TablesStatic_RawEvents_t} from '../src/db/TablesStatic.gen';

import type {TokenMintERC20Token_Approval_t as Entities_TokenMintERC20Token_Approval_t} from '../src/db/Entities.gen';

import type {TokenMintERC20Token_Transfer_t as Entities_TokenMintERC20Token_Transfer_t} from '../src/db/Entities.gen';

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
  readonly FiatTokenProxy_AdminChanged: entityStoreOperations<Entities_FiatTokenProxy_AdminChanged_t>; 
  readonly FiatTokenProxy_Approval: entityStoreOperations<Entities_FiatTokenProxy_Approval_t>; 
  readonly FiatTokenProxy_AuthorizationCanceled: entityStoreOperations<Entities_FiatTokenProxy_AuthorizationCanceled_t>; 
  readonly FiatTokenProxy_AuthorizationUsed: entityStoreOperations<Entities_FiatTokenProxy_AuthorizationUsed_t>; 
  readonly FiatTokenProxy_Blacklisted: entityStoreOperations<Entities_FiatTokenProxy_Blacklisted_t>; 
  readonly FiatTokenProxy_BlacklisterChanged: entityStoreOperations<Entities_FiatTokenProxy_BlacklisterChanged_t>; 
  readonly FiatTokenProxy_Burn: entityStoreOperations<Entities_FiatTokenProxy_Burn_t>; 
  readonly FiatTokenProxy_MasterMinterChanged: entityStoreOperations<Entities_FiatTokenProxy_MasterMinterChanged_t>; 
  readonly FiatTokenProxy_Mint: entityStoreOperations<Entities_FiatTokenProxy_Mint_t>; 
  readonly FiatTokenProxy_MinterConfigured: entityStoreOperations<Entities_FiatTokenProxy_MinterConfigured_t>; 
  readonly FiatTokenProxy_MinterRemoved: entityStoreOperations<Entities_FiatTokenProxy_MinterRemoved_t>; 
  readonly FiatTokenProxy_OwnershipTransferred: entityStoreOperations<Entities_FiatTokenProxy_OwnershipTransferred_t>; 
  readonly FiatTokenProxy_Pause: entityStoreOperations<Entities_FiatTokenProxy_Pause_t>; 
  readonly FiatTokenProxy_PauserChanged: entityStoreOperations<Entities_FiatTokenProxy_PauserChanged_t>; 
  readonly FiatTokenProxy_RescuerChanged: entityStoreOperations<Entities_FiatTokenProxy_RescuerChanged_t>; 
  readonly FiatTokenProxy_Transfer: entityStoreOperations<Entities_FiatTokenProxy_Transfer_t>; 
  readonly FiatTokenProxy_UnBlacklisted: entityStoreOperations<Entities_FiatTokenProxy_UnBlacklisted_t>; 
  readonly FiatTokenProxy_Unpause: entityStoreOperations<Entities_FiatTokenProxy_Unpause_t>; 
  readonly FiatTokenProxy_Upgraded: entityStoreOperations<Entities_FiatTokenProxy_Upgraded_t>; 
  readonly TokenMintERC20Token_Approval: entityStoreOperations<Entities_TokenMintERC20Token_Approval_t>; 
  readonly TokenMintERC20Token_Transfer: entityStoreOperations<Entities_TokenMintERC20Token_Transfer_t>
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
