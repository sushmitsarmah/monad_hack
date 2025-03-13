/* TypeScript file generated from TestHelpers.res by genType. */

/* eslint-disable */
/* tslint:disable */

const TestHelpersJS = require('./TestHelpers.bs.js');

import type {CHOGTokenMintERC20Token_Approval_event as Types_CHOGTokenMintERC20Token_Approval_event} from './Types.gen';

import type {CHOGTokenMintERC20Token_Transfer_event as Types_CHOGTokenMintERC20Token_Transfer_event} from './Types.gen';

import type {DAKTokenMintERC20Token_Approval_event as Types_DAKTokenMintERC20Token_Approval_event} from './Types.gen';

import type {DAKTokenMintERC20Token_Transfer_event as Types_DAKTokenMintERC20Token_Transfer_event} from './Types.gen';

import type {WETHTokenMintERC20Token_Approval_event as Types_WETHTokenMintERC20Token_Approval_event} from './Types.gen';

import type {WETHTokenMintERC20Token_Transfer_event as Types_WETHTokenMintERC20Token_Transfer_event} from './Types.gen';

import type {YAKITokenMintERC20Token_Approval_event as Types_YAKITokenMintERC20Token_Approval_event} from './Types.gen';

import type {YAKITokenMintERC20Token_Transfer_event as Types_YAKITokenMintERC20Token_Transfer_event} from './Types.gen';

import type {t as Address_t} from 'envio/src/Address.gen';

import type {t as TestHelpers_MockDb_t} from './TestHelpers_MockDb.gen';

/** The arguements that get passed to a "processEvent" helper function */
export type EventFunctions_eventProcessorArgs<event> = {
  readonly event: event; 
  readonly mockDb: TestHelpers_MockDb_t; 
  readonly chainId?: number
};

export type EventFunctions_eventProcessor<event> = (_1:EventFunctions_eventProcessorArgs<event>) => Promise<TestHelpers_MockDb_t>;

export type EventFunctions_MockBlock_t = {
  readonly hash?: string; 
  readonly timestamp?: number; 
  readonly number?: number
};

export type EventFunctions_MockTransaction_t = {};

export type EventFunctions_mockEventData = {
  readonly chainId?: number; 
  readonly srcAddress?: Address_t; 
  readonly logIndex?: number; 
  readonly block?: EventFunctions_MockBlock_t; 
  readonly transaction?: EventFunctions_MockTransaction_t
};

export type CHOGTokenMintERC20Token_Approval_createMockArgs = {
  readonly owner?: Address_t; 
  readonly spender?: Address_t; 
  readonly value?: bigint; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export type CHOGTokenMintERC20Token_Transfer_createMockArgs = {
  readonly from?: Address_t; 
  readonly to?: Address_t; 
  readonly value?: bigint; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export type DAKTokenMintERC20Token_Approval_createMockArgs = {
  readonly owner?: Address_t; 
  readonly spender?: Address_t; 
  readonly value?: bigint; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export type DAKTokenMintERC20Token_Transfer_createMockArgs = {
  readonly from?: Address_t; 
  readonly to?: Address_t; 
  readonly value?: bigint; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export type WETHTokenMintERC20Token_Approval_createMockArgs = {
  readonly owner?: Address_t; 
  readonly spender?: Address_t; 
  readonly value?: bigint; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export type WETHTokenMintERC20Token_Transfer_createMockArgs = {
  readonly from?: Address_t; 
  readonly to?: Address_t; 
  readonly value?: bigint; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export type YAKITokenMintERC20Token_Approval_createMockArgs = {
  readonly owner?: Address_t; 
  readonly spender?: Address_t; 
  readonly value?: bigint; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export type YAKITokenMintERC20Token_Transfer_createMockArgs = {
  readonly from?: Address_t; 
  readonly to?: Address_t; 
  readonly value?: bigint; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export const MockDb_createMockDb: () => TestHelpers_MockDb_t = TestHelpersJS.MockDb.createMockDb as any;

export const Addresses_mockAddresses: Address_t[] = TestHelpersJS.Addresses.mockAddresses as any;

export const Addresses_defaultAddress: Address_t = TestHelpersJS.Addresses.defaultAddress as any;

export const CHOGTokenMintERC20Token_Approval_processEvent: EventFunctions_eventProcessor<Types_CHOGTokenMintERC20Token_Approval_event> = TestHelpersJS.CHOGTokenMintERC20Token.Approval.processEvent as any;

export const CHOGTokenMintERC20Token_Approval_createMockEvent: (args:CHOGTokenMintERC20Token_Approval_createMockArgs) => Types_CHOGTokenMintERC20Token_Approval_event = TestHelpersJS.CHOGTokenMintERC20Token.Approval.createMockEvent as any;

export const CHOGTokenMintERC20Token_Transfer_processEvent: EventFunctions_eventProcessor<Types_CHOGTokenMintERC20Token_Transfer_event> = TestHelpersJS.CHOGTokenMintERC20Token.Transfer.processEvent as any;

export const CHOGTokenMintERC20Token_Transfer_createMockEvent: (args:CHOGTokenMintERC20Token_Transfer_createMockArgs) => Types_CHOGTokenMintERC20Token_Transfer_event = TestHelpersJS.CHOGTokenMintERC20Token.Transfer.createMockEvent as any;

export const DAKTokenMintERC20Token_Approval_processEvent: EventFunctions_eventProcessor<Types_DAKTokenMintERC20Token_Approval_event> = TestHelpersJS.DAKTokenMintERC20Token.Approval.processEvent as any;

export const DAKTokenMintERC20Token_Approval_createMockEvent: (args:DAKTokenMintERC20Token_Approval_createMockArgs) => Types_DAKTokenMintERC20Token_Approval_event = TestHelpersJS.DAKTokenMintERC20Token.Approval.createMockEvent as any;

export const DAKTokenMintERC20Token_Transfer_processEvent: EventFunctions_eventProcessor<Types_DAKTokenMintERC20Token_Transfer_event> = TestHelpersJS.DAKTokenMintERC20Token.Transfer.processEvent as any;

export const DAKTokenMintERC20Token_Transfer_createMockEvent: (args:DAKTokenMintERC20Token_Transfer_createMockArgs) => Types_DAKTokenMintERC20Token_Transfer_event = TestHelpersJS.DAKTokenMintERC20Token.Transfer.createMockEvent as any;

export const WETHTokenMintERC20Token_Approval_processEvent: EventFunctions_eventProcessor<Types_WETHTokenMintERC20Token_Approval_event> = TestHelpersJS.WETHTokenMintERC20Token.Approval.processEvent as any;

export const WETHTokenMintERC20Token_Approval_createMockEvent: (args:WETHTokenMintERC20Token_Approval_createMockArgs) => Types_WETHTokenMintERC20Token_Approval_event = TestHelpersJS.WETHTokenMintERC20Token.Approval.createMockEvent as any;

export const WETHTokenMintERC20Token_Transfer_processEvent: EventFunctions_eventProcessor<Types_WETHTokenMintERC20Token_Transfer_event> = TestHelpersJS.WETHTokenMintERC20Token.Transfer.processEvent as any;

export const WETHTokenMintERC20Token_Transfer_createMockEvent: (args:WETHTokenMintERC20Token_Transfer_createMockArgs) => Types_WETHTokenMintERC20Token_Transfer_event = TestHelpersJS.WETHTokenMintERC20Token.Transfer.createMockEvent as any;

export const YAKITokenMintERC20Token_Approval_processEvent: EventFunctions_eventProcessor<Types_YAKITokenMintERC20Token_Approval_event> = TestHelpersJS.YAKITokenMintERC20Token.Approval.processEvent as any;

export const YAKITokenMintERC20Token_Approval_createMockEvent: (args:YAKITokenMintERC20Token_Approval_createMockArgs) => Types_YAKITokenMintERC20Token_Approval_event = TestHelpersJS.YAKITokenMintERC20Token.Approval.createMockEvent as any;

export const YAKITokenMintERC20Token_Transfer_processEvent: EventFunctions_eventProcessor<Types_YAKITokenMintERC20Token_Transfer_event> = TestHelpersJS.YAKITokenMintERC20Token.Transfer.processEvent as any;

export const YAKITokenMintERC20Token_Transfer_createMockEvent: (args:YAKITokenMintERC20Token_Transfer_createMockArgs) => Types_YAKITokenMintERC20Token_Transfer_event = TestHelpersJS.YAKITokenMintERC20Token.Transfer.createMockEvent as any;

export const Addresses: { mockAddresses: Address_t[]; defaultAddress: Address_t } = TestHelpersJS.Addresses as any;

export const WETHTokenMintERC20Token: { Transfer: { processEvent: EventFunctions_eventProcessor<Types_WETHTokenMintERC20Token_Transfer_event>; createMockEvent: (args:WETHTokenMintERC20Token_Transfer_createMockArgs) => Types_WETHTokenMintERC20Token_Transfer_event }; Approval: { processEvent: EventFunctions_eventProcessor<Types_WETHTokenMintERC20Token_Approval_event>; createMockEvent: (args:WETHTokenMintERC20Token_Approval_createMockArgs) => Types_WETHTokenMintERC20Token_Approval_event } } = TestHelpersJS.WETHTokenMintERC20Token as any;

export const YAKITokenMintERC20Token: { Transfer: { processEvent: EventFunctions_eventProcessor<Types_YAKITokenMintERC20Token_Transfer_event>; createMockEvent: (args:YAKITokenMintERC20Token_Transfer_createMockArgs) => Types_YAKITokenMintERC20Token_Transfer_event }; Approval: { processEvent: EventFunctions_eventProcessor<Types_YAKITokenMintERC20Token_Approval_event>; createMockEvent: (args:YAKITokenMintERC20Token_Approval_createMockArgs) => Types_YAKITokenMintERC20Token_Approval_event } } = TestHelpersJS.YAKITokenMintERC20Token as any;

export const CHOGTokenMintERC20Token: { Transfer: { processEvent: EventFunctions_eventProcessor<Types_CHOGTokenMintERC20Token_Transfer_event>; createMockEvent: (args:CHOGTokenMintERC20Token_Transfer_createMockArgs) => Types_CHOGTokenMintERC20Token_Transfer_event }; Approval: { processEvent: EventFunctions_eventProcessor<Types_CHOGTokenMintERC20Token_Approval_event>; createMockEvent: (args:CHOGTokenMintERC20Token_Approval_createMockArgs) => Types_CHOGTokenMintERC20Token_Approval_event } } = TestHelpersJS.CHOGTokenMintERC20Token as any;

export const DAKTokenMintERC20Token: { Transfer: { processEvent: EventFunctions_eventProcessor<Types_DAKTokenMintERC20Token_Transfer_event>; createMockEvent: (args:DAKTokenMintERC20Token_Transfer_createMockArgs) => Types_DAKTokenMintERC20Token_Transfer_event }; Approval: { processEvent: EventFunctions_eventProcessor<Types_DAKTokenMintERC20Token_Approval_event>; createMockEvent: (args:DAKTokenMintERC20Token_Approval_createMockArgs) => Types_DAKTokenMintERC20Token_Approval_event } } = TestHelpersJS.DAKTokenMintERC20Token as any;

export const MockDb: { createMockDb: () => TestHelpers_MockDb_t } = TestHelpersJS.MockDb as any;
