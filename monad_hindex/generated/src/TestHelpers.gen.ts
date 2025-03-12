/* TypeScript file generated from TestHelpers.res by genType. */

/* eslint-disable */
/* tslint:disable */

const TestHelpersJS = require('./TestHelpers.bs.js');

import type {FiatTokenProxy_AdminChanged_event as Types_FiatTokenProxy_AdminChanged_event} from './Types.gen';

import type {FiatTokenProxy_Approval_event as Types_FiatTokenProxy_Approval_event} from './Types.gen';

import type {FiatTokenProxy_AuthorizationCanceled_event as Types_FiatTokenProxy_AuthorizationCanceled_event} from './Types.gen';

import type {FiatTokenProxy_AuthorizationUsed_event as Types_FiatTokenProxy_AuthorizationUsed_event} from './Types.gen';

import type {FiatTokenProxy_Blacklisted_event as Types_FiatTokenProxy_Blacklisted_event} from './Types.gen';

import type {FiatTokenProxy_BlacklisterChanged_event as Types_FiatTokenProxy_BlacklisterChanged_event} from './Types.gen';

import type {FiatTokenProxy_Burn_event as Types_FiatTokenProxy_Burn_event} from './Types.gen';

import type {FiatTokenProxy_MasterMinterChanged_event as Types_FiatTokenProxy_MasterMinterChanged_event} from './Types.gen';

import type {FiatTokenProxy_Mint_event as Types_FiatTokenProxy_Mint_event} from './Types.gen';

import type {FiatTokenProxy_MinterConfigured_event as Types_FiatTokenProxy_MinterConfigured_event} from './Types.gen';

import type {FiatTokenProxy_MinterRemoved_event as Types_FiatTokenProxy_MinterRemoved_event} from './Types.gen';

import type {FiatTokenProxy_OwnershipTransferred_event as Types_FiatTokenProxy_OwnershipTransferred_event} from './Types.gen';

import type {FiatTokenProxy_Pause_event as Types_FiatTokenProxy_Pause_event} from './Types.gen';

import type {FiatTokenProxy_PauserChanged_event as Types_FiatTokenProxy_PauserChanged_event} from './Types.gen';

import type {FiatTokenProxy_RescuerChanged_event as Types_FiatTokenProxy_RescuerChanged_event} from './Types.gen';

import type {FiatTokenProxy_Transfer_event as Types_FiatTokenProxy_Transfer_event} from './Types.gen';

import type {FiatTokenProxy_UnBlacklisted_event as Types_FiatTokenProxy_UnBlacklisted_event} from './Types.gen';

import type {FiatTokenProxy_Unpause_event as Types_FiatTokenProxy_Unpause_event} from './Types.gen';

import type {FiatTokenProxy_Upgraded_event as Types_FiatTokenProxy_Upgraded_event} from './Types.gen';

import type {TokenMintERC20Token_Approval_event as Types_TokenMintERC20Token_Approval_event} from './Types.gen';

import type {TokenMintERC20Token_Transfer_event as Types_TokenMintERC20Token_Transfer_event} from './Types.gen';

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

export type FiatTokenProxy_AdminChanged_createMockArgs = {
  readonly previousAdmin?: Address_t; 
  readonly newAdmin?: Address_t; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export type FiatTokenProxy_Approval_createMockArgs = {
  readonly owner?: Address_t; 
  readonly spender?: Address_t; 
  readonly value?: bigint; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export type FiatTokenProxy_AuthorizationCanceled_createMockArgs = {
  readonly authorizer?: Address_t; 
  readonly nonce?: string; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export type FiatTokenProxy_AuthorizationUsed_createMockArgs = {
  readonly authorizer?: Address_t; 
  readonly nonce?: string; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export type FiatTokenProxy_Blacklisted_createMockArgs = { readonly _account?: Address_t; readonly mockEventData?: EventFunctions_mockEventData };

export type FiatTokenProxy_BlacklisterChanged_createMockArgs = { readonly newBlacklister?: Address_t; readonly mockEventData?: EventFunctions_mockEventData };

export type FiatTokenProxy_Burn_createMockArgs = {
  readonly burner?: Address_t; 
  readonly amount?: bigint; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export type FiatTokenProxy_MasterMinterChanged_createMockArgs = { readonly newMasterMinter?: Address_t; readonly mockEventData?: EventFunctions_mockEventData };

export type FiatTokenProxy_Mint_createMockArgs = {
  readonly minter?: Address_t; 
  readonly to?: Address_t; 
  readonly amount?: bigint; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export type FiatTokenProxy_MinterConfigured_createMockArgs = {
  readonly minter?: Address_t; 
  readonly minterAllowedAmount?: bigint; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export type FiatTokenProxy_MinterRemoved_createMockArgs = { readonly oldMinter?: Address_t; readonly mockEventData?: EventFunctions_mockEventData };

export type FiatTokenProxy_OwnershipTransferred_createMockArgs = {
  readonly previousOwner?: Address_t; 
  readonly newOwner?: Address_t; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export type FiatTokenProxy_Pause_createMockArgs = { readonly mockEventData?: EventFunctions_mockEventData };

export type FiatTokenProxy_PauserChanged_createMockArgs = { readonly newAddress?: Address_t; readonly mockEventData?: EventFunctions_mockEventData };

export type FiatTokenProxy_RescuerChanged_createMockArgs = { readonly newRescuer?: Address_t; readonly mockEventData?: EventFunctions_mockEventData };

export type FiatTokenProxy_Transfer_createMockArgs = {
  readonly from?: Address_t; 
  readonly to?: Address_t; 
  readonly value?: bigint; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export type FiatTokenProxy_UnBlacklisted_createMockArgs = { readonly _account?: Address_t; readonly mockEventData?: EventFunctions_mockEventData };

export type FiatTokenProxy_Unpause_createMockArgs = { readonly mockEventData?: EventFunctions_mockEventData };

export type FiatTokenProxy_Upgraded_createMockArgs = { readonly implementation?: Address_t; readonly mockEventData?: EventFunctions_mockEventData };

export type TokenMintERC20Token_Approval_createMockArgs = {
  readonly owner?: Address_t; 
  readonly spender?: Address_t; 
  readonly value?: bigint; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export type TokenMintERC20Token_Transfer_createMockArgs = {
  readonly from?: Address_t; 
  readonly to?: Address_t; 
  readonly value?: bigint; 
  readonly mockEventData?: EventFunctions_mockEventData
};

export const MockDb_createMockDb: () => TestHelpers_MockDb_t = TestHelpersJS.MockDb.createMockDb as any;

export const Addresses_mockAddresses: Address_t[] = TestHelpersJS.Addresses.mockAddresses as any;

export const Addresses_defaultAddress: Address_t = TestHelpersJS.Addresses.defaultAddress as any;

export const FiatTokenProxy_AdminChanged_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_AdminChanged_event> = TestHelpersJS.FiatTokenProxy.AdminChanged.processEvent as any;

export const FiatTokenProxy_AdminChanged_createMockEvent: (args:FiatTokenProxy_AdminChanged_createMockArgs) => Types_FiatTokenProxy_AdminChanged_event = TestHelpersJS.FiatTokenProxy.AdminChanged.createMockEvent as any;

export const FiatTokenProxy_Approval_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_Approval_event> = TestHelpersJS.FiatTokenProxy.Approval.processEvent as any;

export const FiatTokenProxy_Approval_createMockEvent: (args:FiatTokenProxy_Approval_createMockArgs) => Types_FiatTokenProxy_Approval_event = TestHelpersJS.FiatTokenProxy.Approval.createMockEvent as any;

export const FiatTokenProxy_AuthorizationCanceled_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_AuthorizationCanceled_event> = TestHelpersJS.FiatTokenProxy.AuthorizationCanceled.processEvent as any;

export const FiatTokenProxy_AuthorizationCanceled_createMockEvent: (args:FiatTokenProxy_AuthorizationCanceled_createMockArgs) => Types_FiatTokenProxy_AuthorizationCanceled_event = TestHelpersJS.FiatTokenProxy.AuthorizationCanceled.createMockEvent as any;

export const FiatTokenProxy_AuthorizationUsed_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_AuthorizationUsed_event> = TestHelpersJS.FiatTokenProxy.AuthorizationUsed.processEvent as any;

export const FiatTokenProxy_AuthorizationUsed_createMockEvent: (args:FiatTokenProxy_AuthorizationUsed_createMockArgs) => Types_FiatTokenProxy_AuthorizationUsed_event = TestHelpersJS.FiatTokenProxy.AuthorizationUsed.createMockEvent as any;

export const FiatTokenProxy_Blacklisted_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_Blacklisted_event> = TestHelpersJS.FiatTokenProxy.Blacklisted.processEvent as any;

export const FiatTokenProxy_Blacklisted_createMockEvent: (args:FiatTokenProxy_Blacklisted_createMockArgs) => Types_FiatTokenProxy_Blacklisted_event = TestHelpersJS.FiatTokenProxy.Blacklisted.createMockEvent as any;

export const FiatTokenProxy_BlacklisterChanged_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_BlacklisterChanged_event> = TestHelpersJS.FiatTokenProxy.BlacklisterChanged.processEvent as any;

export const FiatTokenProxy_BlacklisterChanged_createMockEvent: (args:FiatTokenProxy_BlacklisterChanged_createMockArgs) => Types_FiatTokenProxy_BlacklisterChanged_event = TestHelpersJS.FiatTokenProxy.BlacklisterChanged.createMockEvent as any;

export const FiatTokenProxy_Burn_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_Burn_event> = TestHelpersJS.FiatTokenProxy.Burn.processEvent as any;

export const FiatTokenProxy_Burn_createMockEvent: (args:FiatTokenProxy_Burn_createMockArgs) => Types_FiatTokenProxy_Burn_event = TestHelpersJS.FiatTokenProxy.Burn.createMockEvent as any;

export const FiatTokenProxy_MasterMinterChanged_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_MasterMinterChanged_event> = TestHelpersJS.FiatTokenProxy.MasterMinterChanged.processEvent as any;

export const FiatTokenProxy_MasterMinterChanged_createMockEvent: (args:FiatTokenProxy_MasterMinterChanged_createMockArgs) => Types_FiatTokenProxy_MasterMinterChanged_event = TestHelpersJS.FiatTokenProxy.MasterMinterChanged.createMockEvent as any;

export const FiatTokenProxy_Mint_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_Mint_event> = TestHelpersJS.FiatTokenProxy.Mint.processEvent as any;

export const FiatTokenProxy_Mint_createMockEvent: (args:FiatTokenProxy_Mint_createMockArgs) => Types_FiatTokenProxy_Mint_event = TestHelpersJS.FiatTokenProxy.Mint.createMockEvent as any;

export const FiatTokenProxy_MinterConfigured_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_MinterConfigured_event> = TestHelpersJS.FiatTokenProxy.MinterConfigured.processEvent as any;

export const FiatTokenProxy_MinterConfigured_createMockEvent: (args:FiatTokenProxy_MinterConfigured_createMockArgs) => Types_FiatTokenProxy_MinterConfigured_event = TestHelpersJS.FiatTokenProxy.MinterConfigured.createMockEvent as any;

export const FiatTokenProxy_MinterRemoved_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_MinterRemoved_event> = TestHelpersJS.FiatTokenProxy.MinterRemoved.processEvent as any;

export const FiatTokenProxy_MinterRemoved_createMockEvent: (args:FiatTokenProxy_MinterRemoved_createMockArgs) => Types_FiatTokenProxy_MinterRemoved_event = TestHelpersJS.FiatTokenProxy.MinterRemoved.createMockEvent as any;

export const FiatTokenProxy_OwnershipTransferred_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_OwnershipTransferred_event> = TestHelpersJS.FiatTokenProxy.OwnershipTransferred.processEvent as any;

export const FiatTokenProxy_OwnershipTransferred_createMockEvent: (args:FiatTokenProxy_OwnershipTransferred_createMockArgs) => Types_FiatTokenProxy_OwnershipTransferred_event = TestHelpersJS.FiatTokenProxy.OwnershipTransferred.createMockEvent as any;

export const FiatTokenProxy_Pause_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_Pause_event> = TestHelpersJS.FiatTokenProxy.Pause.processEvent as any;

export const FiatTokenProxy_Pause_createMockEvent: (args:FiatTokenProxy_Pause_createMockArgs) => Types_FiatTokenProxy_Pause_event = TestHelpersJS.FiatTokenProxy.Pause.createMockEvent as any;

export const FiatTokenProxy_PauserChanged_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_PauserChanged_event> = TestHelpersJS.FiatTokenProxy.PauserChanged.processEvent as any;

export const FiatTokenProxy_PauserChanged_createMockEvent: (args:FiatTokenProxy_PauserChanged_createMockArgs) => Types_FiatTokenProxy_PauserChanged_event = TestHelpersJS.FiatTokenProxy.PauserChanged.createMockEvent as any;

export const FiatTokenProxy_RescuerChanged_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_RescuerChanged_event> = TestHelpersJS.FiatTokenProxy.RescuerChanged.processEvent as any;

export const FiatTokenProxy_RescuerChanged_createMockEvent: (args:FiatTokenProxy_RescuerChanged_createMockArgs) => Types_FiatTokenProxy_RescuerChanged_event = TestHelpersJS.FiatTokenProxy.RescuerChanged.createMockEvent as any;

export const FiatTokenProxy_Transfer_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_Transfer_event> = TestHelpersJS.FiatTokenProxy.Transfer.processEvent as any;

export const FiatTokenProxy_Transfer_createMockEvent: (args:FiatTokenProxy_Transfer_createMockArgs) => Types_FiatTokenProxy_Transfer_event = TestHelpersJS.FiatTokenProxy.Transfer.createMockEvent as any;

export const FiatTokenProxy_UnBlacklisted_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_UnBlacklisted_event> = TestHelpersJS.FiatTokenProxy.UnBlacklisted.processEvent as any;

export const FiatTokenProxy_UnBlacklisted_createMockEvent: (args:FiatTokenProxy_UnBlacklisted_createMockArgs) => Types_FiatTokenProxy_UnBlacklisted_event = TestHelpersJS.FiatTokenProxy.UnBlacklisted.createMockEvent as any;

export const FiatTokenProxy_Unpause_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_Unpause_event> = TestHelpersJS.FiatTokenProxy.Unpause.processEvent as any;

export const FiatTokenProxy_Unpause_createMockEvent: (args:FiatTokenProxy_Unpause_createMockArgs) => Types_FiatTokenProxy_Unpause_event = TestHelpersJS.FiatTokenProxy.Unpause.createMockEvent as any;

export const FiatTokenProxy_Upgraded_processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_Upgraded_event> = TestHelpersJS.FiatTokenProxy.Upgraded.processEvent as any;

export const FiatTokenProxy_Upgraded_createMockEvent: (args:FiatTokenProxy_Upgraded_createMockArgs) => Types_FiatTokenProxy_Upgraded_event = TestHelpersJS.FiatTokenProxy.Upgraded.createMockEvent as any;

export const TokenMintERC20Token_Approval_processEvent: EventFunctions_eventProcessor<Types_TokenMintERC20Token_Approval_event> = TestHelpersJS.TokenMintERC20Token.Approval.processEvent as any;

export const TokenMintERC20Token_Approval_createMockEvent: (args:TokenMintERC20Token_Approval_createMockArgs) => Types_TokenMintERC20Token_Approval_event = TestHelpersJS.TokenMintERC20Token.Approval.createMockEvent as any;

export const TokenMintERC20Token_Transfer_processEvent: EventFunctions_eventProcessor<Types_TokenMintERC20Token_Transfer_event> = TestHelpersJS.TokenMintERC20Token.Transfer.processEvent as any;

export const TokenMintERC20Token_Transfer_createMockEvent: (args:TokenMintERC20Token_Transfer_createMockArgs) => Types_TokenMintERC20Token_Transfer_event = TestHelpersJS.TokenMintERC20Token.Transfer.createMockEvent as any;

export const FiatTokenProxy: {
  AuthorizationCanceled: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_AuthorizationCanceled_event>; 
    createMockEvent: (args:FiatTokenProxy_AuthorizationCanceled_createMockArgs) => Types_FiatTokenProxy_AuthorizationCanceled_event
  }; 
  Blacklisted: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_Blacklisted_event>; 
    createMockEvent: (args:FiatTokenProxy_Blacklisted_createMockArgs) => Types_FiatTokenProxy_Blacklisted_event
  }; 
  BlacklisterChanged: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_BlacklisterChanged_event>; 
    createMockEvent: (args:FiatTokenProxy_BlacklisterChanged_createMockArgs) => Types_FiatTokenProxy_BlacklisterChanged_event
  }; 
  OwnershipTransferred: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_OwnershipTransferred_event>; 
    createMockEvent: (args:FiatTokenProxy_OwnershipTransferred_createMockArgs) => Types_FiatTokenProxy_OwnershipTransferred_event
  }; 
  UnBlacklisted: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_UnBlacklisted_event>; 
    createMockEvent: (args:FiatTokenProxy_UnBlacklisted_createMockArgs) => Types_FiatTokenProxy_UnBlacklisted_event
  }; 
  Unpause: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_Unpause_event>; 
    createMockEvent: (args:FiatTokenProxy_Unpause_createMockArgs) => Types_FiatTokenProxy_Unpause_event
  }; 
  Transfer: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_Transfer_event>; 
    createMockEvent: (args:FiatTokenProxy_Transfer_createMockArgs) => Types_FiatTokenProxy_Transfer_event
  }; 
  Upgraded: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_Upgraded_event>; 
    createMockEvent: (args:FiatTokenProxy_Upgraded_createMockArgs) => Types_FiatTokenProxy_Upgraded_event
  }; 
  Pause: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_Pause_event>; 
    createMockEvent: (args:FiatTokenProxy_Pause_createMockArgs) => Types_FiatTokenProxy_Pause_event
  }; 
  AdminChanged: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_AdminChanged_event>; 
    createMockEvent: (args:FiatTokenProxy_AdminChanged_createMockArgs) => Types_FiatTokenProxy_AdminChanged_event
  }; 
  Mint: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_Mint_event>; 
    createMockEvent: (args:FiatTokenProxy_Mint_createMockArgs) => Types_FiatTokenProxy_Mint_event
  }; 
  PauserChanged: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_PauserChanged_event>; 
    createMockEvent: (args:FiatTokenProxy_PauserChanged_createMockArgs) => Types_FiatTokenProxy_PauserChanged_event
  }; 
  Approval: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_Approval_event>; 
    createMockEvent: (args:FiatTokenProxy_Approval_createMockArgs) => Types_FiatTokenProxy_Approval_event
  }; 
  Burn: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_Burn_event>; 
    createMockEvent: (args:FiatTokenProxy_Burn_createMockArgs) => Types_FiatTokenProxy_Burn_event
  }; 
  MinterConfigured: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_MinterConfigured_event>; 
    createMockEvent: (args:FiatTokenProxy_MinterConfigured_createMockArgs) => Types_FiatTokenProxy_MinterConfigured_event
  }; 
  AuthorizationUsed: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_AuthorizationUsed_event>; 
    createMockEvent: (args:FiatTokenProxy_AuthorizationUsed_createMockArgs) => Types_FiatTokenProxy_AuthorizationUsed_event
  }; 
  MasterMinterChanged: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_MasterMinterChanged_event>; 
    createMockEvent: (args:FiatTokenProxy_MasterMinterChanged_createMockArgs) => Types_FiatTokenProxy_MasterMinterChanged_event
  }; 
  RescuerChanged: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_RescuerChanged_event>; 
    createMockEvent: (args:FiatTokenProxy_RescuerChanged_createMockArgs) => Types_FiatTokenProxy_RescuerChanged_event
  }; 
  MinterRemoved: {
    processEvent: EventFunctions_eventProcessor<Types_FiatTokenProxy_MinterRemoved_event>; 
    createMockEvent: (args:FiatTokenProxy_MinterRemoved_createMockArgs) => Types_FiatTokenProxy_MinterRemoved_event
  }
} = TestHelpersJS.FiatTokenProxy as any;

export const Addresses: { mockAddresses: Address_t[]; defaultAddress: Address_t } = TestHelpersJS.Addresses as any;

export const TokenMintERC20Token: { Transfer: { processEvent: EventFunctions_eventProcessor<Types_TokenMintERC20Token_Transfer_event>; createMockEvent: (args:TokenMintERC20Token_Transfer_createMockArgs) => Types_TokenMintERC20Token_Transfer_event }; Approval: { processEvent: EventFunctions_eventProcessor<Types_TokenMintERC20Token_Approval_event>; createMockEvent: (args:TokenMintERC20Token_Approval_createMockArgs) => Types_TokenMintERC20Token_Approval_event } } = TestHelpersJS.TokenMintERC20Token as any;

export const MockDb: { createMockDb: () => TestHelpers_MockDb_t } = TestHelpersJS.MockDb as any;
