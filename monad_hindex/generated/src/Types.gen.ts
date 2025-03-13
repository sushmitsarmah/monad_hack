/* TypeScript file generated from Types.res by genType. */

/* eslint-disable */
/* tslint:disable */

import type {CHOGTokenMintERC20Token_Approval_indexedFieldOperations as Entities_CHOGTokenMintERC20Token_Approval_indexedFieldOperations} from '../src/db/Entities.gen';

import type {CHOGTokenMintERC20Token_Approval_t as Entities_CHOGTokenMintERC20Token_Approval_t} from '../src/db/Entities.gen';

import type {CHOGTokenMintERC20Token_Transfer_indexedFieldOperations as Entities_CHOGTokenMintERC20Token_Transfer_indexedFieldOperations} from '../src/db/Entities.gen';

import type {CHOGTokenMintERC20Token_Transfer_t as Entities_CHOGTokenMintERC20Token_Transfer_t} from '../src/db/Entities.gen';

import type {DAKTokenMintERC20Token_Approval_indexedFieldOperations as Entities_DAKTokenMintERC20Token_Approval_indexedFieldOperations} from '../src/db/Entities.gen';

import type {DAKTokenMintERC20Token_Approval_t as Entities_DAKTokenMintERC20Token_Approval_t} from '../src/db/Entities.gen';

import type {DAKTokenMintERC20Token_Transfer_indexedFieldOperations as Entities_DAKTokenMintERC20Token_Transfer_indexedFieldOperations} from '../src/db/Entities.gen';

import type {DAKTokenMintERC20Token_Transfer_t as Entities_DAKTokenMintERC20Token_Transfer_t} from '../src/db/Entities.gen';

import type {HandlerWithOptions as $$fnWithEventConfig} from './bindings/OpaqueTypes.ts';

import type {SingleOrMultiple as $$SingleOrMultiple_t} from './bindings/OpaqueTypes';

import type {WETHTokenMintERC20Token_Approval_indexedFieldOperations as Entities_WETHTokenMintERC20Token_Approval_indexedFieldOperations} from '../src/db/Entities.gen';

import type {WETHTokenMintERC20Token_Approval_t as Entities_WETHTokenMintERC20Token_Approval_t} from '../src/db/Entities.gen';

import type {WETHTokenMintERC20Token_Transfer_indexedFieldOperations as Entities_WETHTokenMintERC20Token_Transfer_indexedFieldOperations} from '../src/db/Entities.gen';

import type {WETHTokenMintERC20Token_Transfer_t as Entities_WETHTokenMintERC20Token_Transfer_t} from '../src/db/Entities.gen';

import type {YAKITokenMintERC20Token_Approval_indexedFieldOperations as Entities_YAKITokenMintERC20Token_Approval_indexedFieldOperations} from '../src/db/Entities.gen';

import type {YAKITokenMintERC20Token_Approval_t as Entities_YAKITokenMintERC20Token_Approval_t} from '../src/db/Entities.gen';

import type {YAKITokenMintERC20Token_Transfer_indexedFieldOperations as Entities_YAKITokenMintERC20Token_Transfer_indexedFieldOperations} from '../src/db/Entities.gen';

import type {YAKITokenMintERC20Token_Transfer_t as Entities_YAKITokenMintERC20Token_Transfer_t} from '../src/db/Entities.gen';

import type {genericContractRegisterArgs as Internal_genericContractRegisterArgs} from 'envio/src/Internal.gen';

import type {genericContractRegister as Internal_genericContractRegister} from 'envio/src/Internal.gen';

import type {genericEvent as Internal_genericEvent} from 'envio/src/Internal.gen';

import type {genericHandlerArgs as Internal_genericHandlerArgs} from 'envio/src/Internal.gen';

import type {genericHandlerWithLoader as Internal_genericHandlerWithLoader} from 'envio/src/Internal.gen';

import type {genericHandler as Internal_genericHandler} from 'envio/src/Internal.gen';

import type {genericLoaderArgs as Internal_genericLoaderArgs} from 'envio/src/Internal.gen';

import type {genericLoader as Internal_genericLoader} from 'envio/src/Internal.gen';

import type {t as Address_t} from 'envio/src/Address.gen';

import type {userLogger as Logs_userLogger} from './Logs.gen';

export type id = string;
export type Id = id;

export type contractRegistrations = {
  readonly addCHOGTokenMintERC20Token: (_1:Address_t) => void; 
  readonly addDAKTokenMintERC20Token: (_1:Address_t) => void; 
  readonly addWETHTokenMintERC20Token: (_1:Address_t) => void; 
  readonly addYAKITokenMintERC20Token: (_1:Address_t) => void
};

export type entityLoaderContext<entity,indexedFieldOperations> = { readonly get: (_1:id) => Promise<(undefined | entity)>; readonly getWhere: indexedFieldOperations };

export type loaderContext = {
  readonly log: Logs_userLogger; 
  readonly CHOGTokenMintERC20Token_Approval: entityLoaderContext<Entities_CHOGTokenMintERC20Token_Approval_t,Entities_CHOGTokenMintERC20Token_Approval_indexedFieldOperations>; 
  readonly CHOGTokenMintERC20Token_Transfer: entityLoaderContext<Entities_CHOGTokenMintERC20Token_Transfer_t,Entities_CHOGTokenMintERC20Token_Transfer_indexedFieldOperations>; 
  readonly DAKTokenMintERC20Token_Approval: entityLoaderContext<Entities_DAKTokenMintERC20Token_Approval_t,Entities_DAKTokenMintERC20Token_Approval_indexedFieldOperations>; 
  readonly DAKTokenMintERC20Token_Transfer: entityLoaderContext<Entities_DAKTokenMintERC20Token_Transfer_t,Entities_DAKTokenMintERC20Token_Transfer_indexedFieldOperations>; 
  readonly WETHTokenMintERC20Token_Approval: entityLoaderContext<Entities_WETHTokenMintERC20Token_Approval_t,Entities_WETHTokenMintERC20Token_Approval_indexedFieldOperations>; 
  readonly WETHTokenMintERC20Token_Transfer: entityLoaderContext<Entities_WETHTokenMintERC20Token_Transfer_t,Entities_WETHTokenMintERC20Token_Transfer_indexedFieldOperations>; 
  readonly YAKITokenMintERC20Token_Approval: entityLoaderContext<Entities_YAKITokenMintERC20Token_Approval_t,Entities_YAKITokenMintERC20Token_Approval_indexedFieldOperations>; 
  readonly YAKITokenMintERC20Token_Transfer: entityLoaderContext<Entities_YAKITokenMintERC20Token_Transfer_t,Entities_YAKITokenMintERC20Token_Transfer_indexedFieldOperations>
};

export type entityHandlerContext<entity> = {
  readonly get: (_1:id) => Promise<(undefined | entity)>; 
  readonly set: (_1:entity) => void; 
  readonly deleteUnsafe: (_1:id) => void
};

export type handlerContext = {
  readonly log: Logs_userLogger; 
  readonly CHOGTokenMintERC20Token_Approval: entityHandlerContext<Entities_CHOGTokenMintERC20Token_Approval_t>; 
  readonly CHOGTokenMintERC20Token_Transfer: entityHandlerContext<Entities_CHOGTokenMintERC20Token_Transfer_t>; 
  readonly DAKTokenMintERC20Token_Approval: entityHandlerContext<Entities_DAKTokenMintERC20Token_Approval_t>; 
  readonly DAKTokenMintERC20Token_Transfer: entityHandlerContext<Entities_DAKTokenMintERC20Token_Transfer_t>; 
  readonly WETHTokenMintERC20Token_Approval: entityHandlerContext<Entities_WETHTokenMintERC20Token_Approval_t>; 
  readonly WETHTokenMintERC20Token_Transfer: entityHandlerContext<Entities_WETHTokenMintERC20Token_Transfer_t>; 
  readonly YAKITokenMintERC20Token_Approval: entityHandlerContext<Entities_YAKITokenMintERC20Token_Approval_t>; 
  readonly YAKITokenMintERC20Token_Transfer: entityHandlerContext<Entities_YAKITokenMintERC20Token_Transfer_t>
};

export type cHOGTokenMintERC20Token_Approval = Entities_CHOGTokenMintERC20Token_Approval_t;
export type CHOGTokenMintERC20Token_Approval = cHOGTokenMintERC20Token_Approval;

export type cHOGTokenMintERC20Token_Transfer = Entities_CHOGTokenMintERC20Token_Transfer_t;
export type CHOGTokenMintERC20Token_Transfer = cHOGTokenMintERC20Token_Transfer;

export type dAKTokenMintERC20Token_Approval = Entities_DAKTokenMintERC20Token_Approval_t;
export type DAKTokenMintERC20Token_Approval = dAKTokenMintERC20Token_Approval;

export type dAKTokenMintERC20Token_Transfer = Entities_DAKTokenMintERC20Token_Transfer_t;
export type DAKTokenMintERC20Token_Transfer = dAKTokenMintERC20Token_Transfer;

export type wETHTokenMintERC20Token_Approval = Entities_WETHTokenMintERC20Token_Approval_t;
export type WETHTokenMintERC20Token_Approval = wETHTokenMintERC20Token_Approval;

export type wETHTokenMintERC20Token_Transfer = Entities_WETHTokenMintERC20Token_Transfer_t;
export type WETHTokenMintERC20Token_Transfer = wETHTokenMintERC20Token_Transfer;

export type yAKITokenMintERC20Token_Approval = Entities_YAKITokenMintERC20Token_Approval_t;
export type YAKITokenMintERC20Token_Approval = yAKITokenMintERC20Token_Approval;

export type yAKITokenMintERC20Token_Transfer = Entities_YAKITokenMintERC20Token_Transfer_t;
export type YAKITokenMintERC20Token_Transfer = yAKITokenMintERC20Token_Transfer;

export type eventIdentifier = {
  readonly chainId: number; 
  readonly blockTimestamp: number; 
  readonly blockNumber: number; 
  readonly logIndex: number
};

export type entityUpdateAction<entityType> = "Delete" | { TAG: "Set"; _0: entityType };

export type entityUpdate<entityType> = {
  readonly eventIdentifier: eventIdentifier; 
  readonly entityId: id; 
  readonly entityUpdateAction: entityUpdateAction<entityType>
};

export type entityValueAtStartOfBatch<entityType> = 
    "NotSet"
  | { TAG: "AlreadySet"; _0: entityType };

export type updatedValue<entityType> = { readonly latest: entityUpdate<entityType>; readonly history: entityUpdate<entityType>[] };

export type inMemoryStoreRowEntity<entityType> = 
    { TAG: "Updated"; _0: updatedValue<entityType> }
  | { TAG: "InitialReadFromDb"; _0: entityValueAtStartOfBatch<entityType> };

export type Transaction_t = {};

export type Block_t = {
  readonly number: number; 
  readonly timestamp: number; 
  readonly hash: string
};

export type AggregatedBlock_t = {
  readonly hash: string; 
  readonly timestamp: number; 
  readonly number: number
};

export type AggregatedTransaction_t = {};

export type eventLog<params> = Internal_genericEvent<params,Block_t,Transaction_t>;
export type EventLog<params> = eventLog<params>;

export type SingleOrMultiple_t<a> = $$SingleOrMultiple_t<a>;

export type HandlerTypes_args<eventArgs,context> = { readonly event: eventLog<eventArgs>; readonly context: context };

export type HandlerTypes_contractRegisterArgs<eventArgs> = Internal_genericContractRegisterArgs<eventLog<eventArgs>,contractRegistrations>;

export type HandlerTypes_contractRegister<eventArgs> = Internal_genericContractRegister<HandlerTypes_contractRegisterArgs<eventArgs>>;

export type HandlerTypes_loaderArgs<eventArgs> = Internal_genericLoaderArgs<eventLog<eventArgs>,loaderContext>;

export type HandlerTypes_loader<eventArgs,loaderReturn> = Internal_genericLoader<HandlerTypes_loaderArgs<eventArgs>,loaderReturn>;

export type HandlerTypes_handlerArgs<eventArgs,loaderReturn> = Internal_genericHandlerArgs<eventLog<eventArgs>,handlerContext,loaderReturn>;

export type HandlerTypes_handler<eventArgs,loaderReturn> = Internal_genericHandler<HandlerTypes_handlerArgs<eventArgs,loaderReturn>>;

export type HandlerTypes_loaderHandler<eventArgs,loaderReturn,eventFilter> = Internal_genericHandlerWithLoader<HandlerTypes_loader<eventArgs,loaderReturn>,HandlerTypes_handler<eventArgs,loaderReturn>,SingleOrMultiple_t<eventFilter>>;

export type HandlerTypes_eventConfig<eventFilter> = {
  readonly wildcard?: boolean; 
  readonly eventFilters?: SingleOrMultiple_t<eventFilter>; 
  readonly preRegisterDynamicContracts?: boolean
};

export type fnWithEventConfig<fn,eventConfig> = $$fnWithEventConfig<fn,eventConfig>;

export type handlerWithOptions<eventArgs,loaderReturn,eventFilter> = fnWithEventConfig<HandlerTypes_handler<eventArgs,loaderReturn>,HandlerTypes_eventConfig<eventFilter>>;

export type contractRegisterWithOptions<eventArgs,eventFilter> = fnWithEventConfig<HandlerTypes_contractRegister<eventArgs>,HandlerTypes_eventConfig<eventFilter>>;

export type CHOGTokenMintERC20Token_Approval_eventArgs = {
  readonly owner: Address_t; 
  readonly spender: Address_t; 
  readonly value: bigint
};

export type CHOGTokenMintERC20Token_Approval_block = Block_t;

export type CHOGTokenMintERC20Token_Approval_transaction = Transaction_t;

export type CHOGTokenMintERC20Token_Approval_event = Internal_genericEvent<CHOGTokenMintERC20Token_Approval_eventArgs,CHOGTokenMintERC20Token_Approval_block,CHOGTokenMintERC20Token_Approval_transaction>;

export type CHOGTokenMintERC20Token_Approval_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<CHOGTokenMintERC20Token_Approval_event,loaderContext>,loaderReturn>;

export type CHOGTokenMintERC20Token_Approval_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<CHOGTokenMintERC20Token_Approval_event,handlerContext,loaderReturn>>;

export type CHOGTokenMintERC20Token_Approval_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<CHOGTokenMintERC20Token_Approval_event,contractRegistrations>>;

export type CHOGTokenMintERC20Token_Approval_eventFilter = { readonly owner?: SingleOrMultiple_t<Address_t>; readonly spender?: SingleOrMultiple_t<Address_t> };

export type CHOGTokenMintERC20Token_Transfer_eventArgs = {
  readonly from: Address_t; 
  readonly to: Address_t; 
  readonly value: bigint
};

export type CHOGTokenMintERC20Token_Transfer_block = Block_t;

export type CHOGTokenMintERC20Token_Transfer_transaction = Transaction_t;

export type CHOGTokenMintERC20Token_Transfer_event = Internal_genericEvent<CHOGTokenMintERC20Token_Transfer_eventArgs,CHOGTokenMintERC20Token_Transfer_block,CHOGTokenMintERC20Token_Transfer_transaction>;

export type CHOGTokenMintERC20Token_Transfer_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<CHOGTokenMintERC20Token_Transfer_event,loaderContext>,loaderReturn>;

export type CHOGTokenMintERC20Token_Transfer_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<CHOGTokenMintERC20Token_Transfer_event,handlerContext,loaderReturn>>;

export type CHOGTokenMintERC20Token_Transfer_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<CHOGTokenMintERC20Token_Transfer_event,contractRegistrations>>;

export type CHOGTokenMintERC20Token_Transfer_eventFilter = { readonly from?: SingleOrMultiple_t<Address_t>; readonly to?: SingleOrMultiple_t<Address_t> };

export type DAKTokenMintERC20Token_Approval_eventArgs = {
  readonly owner: Address_t; 
  readonly spender: Address_t; 
  readonly value: bigint
};

export type DAKTokenMintERC20Token_Approval_block = Block_t;

export type DAKTokenMintERC20Token_Approval_transaction = Transaction_t;

export type DAKTokenMintERC20Token_Approval_event = Internal_genericEvent<DAKTokenMintERC20Token_Approval_eventArgs,DAKTokenMintERC20Token_Approval_block,DAKTokenMintERC20Token_Approval_transaction>;

export type DAKTokenMintERC20Token_Approval_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<DAKTokenMintERC20Token_Approval_event,loaderContext>,loaderReturn>;

export type DAKTokenMintERC20Token_Approval_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<DAKTokenMintERC20Token_Approval_event,handlerContext,loaderReturn>>;

export type DAKTokenMintERC20Token_Approval_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<DAKTokenMintERC20Token_Approval_event,contractRegistrations>>;

export type DAKTokenMintERC20Token_Approval_eventFilter = { readonly owner?: SingleOrMultiple_t<Address_t>; readonly spender?: SingleOrMultiple_t<Address_t> };

export type DAKTokenMintERC20Token_Transfer_eventArgs = {
  readonly from: Address_t; 
  readonly to: Address_t; 
  readonly value: bigint
};

export type DAKTokenMintERC20Token_Transfer_block = Block_t;

export type DAKTokenMintERC20Token_Transfer_transaction = Transaction_t;

export type DAKTokenMintERC20Token_Transfer_event = Internal_genericEvent<DAKTokenMintERC20Token_Transfer_eventArgs,DAKTokenMintERC20Token_Transfer_block,DAKTokenMintERC20Token_Transfer_transaction>;

export type DAKTokenMintERC20Token_Transfer_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<DAKTokenMintERC20Token_Transfer_event,loaderContext>,loaderReturn>;

export type DAKTokenMintERC20Token_Transfer_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<DAKTokenMintERC20Token_Transfer_event,handlerContext,loaderReturn>>;

export type DAKTokenMintERC20Token_Transfer_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<DAKTokenMintERC20Token_Transfer_event,contractRegistrations>>;

export type DAKTokenMintERC20Token_Transfer_eventFilter = { readonly from?: SingleOrMultiple_t<Address_t>; readonly to?: SingleOrMultiple_t<Address_t> };

export type WETHTokenMintERC20Token_Approval_eventArgs = {
  readonly owner: Address_t; 
  readonly spender: Address_t; 
  readonly value: bigint
};

export type WETHTokenMintERC20Token_Approval_block = Block_t;

export type WETHTokenMintERC20Token_Approval_transaction = Transaction_t;

export type WETHTokenMintERC20Token_Approval_event = Internal_genericEvent<WETHTokenMintERC20Token_Approval_eventArgs,WETHTokenMintERC20Token_Approval_block,WETHTokenMintERC20Token_Approval_transaction>;

export type WETHTokenMintERC20Token_Approval_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<WETHTokenMintERC20Token_Approval_event,loaderContext>,loaderReturn>;

export type WETHTokenMintERC20Token_Approval_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<WETHTokenMintERC20Token_Approval_event,handlerContext,loaderReturn>>;

export type WETHTokenMintERC20Token_Approval_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<WETHTokenMintERC20Token_Approval_event,contractRegistrations>>;

export type WETHTokenMintERC20Token_Approval_eventFilter = { readonly owner?: SingleOrMultiple_t<Address_t>; readonly spender?: SingleOrMultiple_t<Address_t> };

export type WETHTokenMintERC20Token_Transfer_eventArgs = {
  readonly from: Address_t; 
  readonly to: Address_t; 
  readonly value: bigint
};

export type WETHTokenMintERC20Token_Transfer_block = Block_t;

export type WETHTokenMintERC20Token_Transfer_transaction = Transaction_t;

export type WETHTokenMintERC20Token_Transfer_event = Internal_genericEvent<WETHTokenMintERC20Token_Transfer_eventArgs,WETHTokenMintERC20Token_Transfer_block,WETHTokenMintERC20Token_Transfer_transaction>;

export type WETHTokenMintERC20Token_Transfer_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<WETHTokenMintERC20Token_Transfer_event,loaderContext>,loaderReturn>;

export type WETHTokenMintERC20Token_Transfer_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<WETHTokenMintERC20Token_Transfer_event,handlerContext,loaderReturn>>;

export type WETHTokenMintERC20Token_Transfer_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<WETHTokenMintERC20Token_Transfer_event,contractRegistrations>>;

export type WETHTokenMintERC20Token_Transfer_eventFilter = { readonly from?: SingleOrMultiple_t<Address_t>; readonly to?: SingleOrMultiple_t<Address_t> };

export type YAKITokenMintERC20Token_Approval_eventArgs = {
  readonly owner: Address_t; 
  readonly spender: Address_t; 
  readonly value: bigint
};

export type YAKITokenMintERC20Token_Approval_block = Block_t;

export type YAKITokenMintERC20Token_Approval_transaction = Transaction_t;

export type YAKITokenMintERC20Token_Approval_event = Internal_genericEvent<YAKITokenMintERC20Token_Approval_eventArgs,YAKITokenMintERC20Token_Approval_block,YAKITokenMintERC20Token_Approval_transaction>;

export type YAKITokenMintERC20Token_Approval_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<YAKITokenMintERC20Token_Approval_event,loaderContext>,loaderReturn>;

export type YAKITokenMintERC20Token_Approval_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<YAKITokenMintERC20Token_Approval_event,handlerContext,loaderReturn>>;

export type YAKITokenMintERC20Token_Approval_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<YAKITokenMintERC20Token_Approval_event,contractRegistrations>>;

export type YAKITokenMintERC20Token_Approval_eventFilter = { readonly owner?: SingleOrMultiple_t<Address_t>; readonly spender?: SingleOrMultiple_t<Address_t> };

export type YAKITokenMintERC20Token_Transfer_eventArgs = {
  readonly from: Address_t; 
  readonly to: Address_t; 
  readonly value: bigint
};

export type YAKITokenMintERC20Token_Transfer_block = Block_t;

export type YAKITokenMintERC20Token_Transfer_transaction = Transaction_t;

export type YAKITokenMintERC20Token_Transfer_event = Internal_genericEvent<YAKITokenMintERC20Token_Transfer_eventArgs,YAKITokenMintERC20Token_Transfer_block,YAKITokenMintERC20Token_Transfer_transaction>;

export type YAKITokenMintERC20Token_Transfer_loader<loaderReturn> = Internal_genericLoader<Internal_genericLoaderArgs<YAKITokenMintERC20Token_Transfer_event,loaderContext>,loaderReturn>;

export type YAKITokenMintERC20Token_Transfer_handler<loaderReturn> = Internal_genericHandler<Internal_genericHandlerArgs<YAKITokenMintERC20Token_Transfer_event,handlerContext,loaderReturn>>;

export type YAKITokenMintERC20Token_Transfer_contractRegister = Internal_genericContractRegister<Internal_genericContractRegisterArgs<YAKITokenMintERC20Token_Transfer_event,contractRegistrations>>;

export type YAKITokenMintERC20Token_Transfer_eventFilter = { readonly from?: SingleOrMultiple_t<Address_t>; readonly to?: SingleOrMultiple_t<Address_t> };

export type chainId = number;
