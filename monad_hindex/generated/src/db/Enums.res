module ContractType = {
  @genType
  type t = 
    | @as("FiatTokenProxy") FiatTokenProxy
    | @as("TokenMintERC20Token") TokenMintERC20Token

  let name = "CONTRACT_TYPE"
  let variants = [
    FiatTokenProxy,
    TokenMintERC20Token,
  ]
  let enum = Enum.make(~name, ~variants)
}

module EntityType = {
  @genType
  type t = 
    | @as("FiatTokenProxy_AdminChanged") FiatTokenProxy_AdminChanged
    | @as("FiatTokenProxy_Approval") FiatTokenProxy_Approval
    | @as("FiatTokenProxy_AuthorizationCanceled") FiatTokenProxy_AuthorizationCanceled
    | @as("FiatTokenProxy_AuthorizationUsed") FiatTokenProxy_AuthorizationUsed
    | @as("FiatTokenProxy_Blacklisted") FiatTokenProxy_Blacklisted
    | @as("FiatTokenProxy_BlacklisterChanged") FiatTokenProxy_BlacklisterChanged
    | @as("FiatTokenProxy_Burn") FiatTokenProxy_Burn
    | @as("FiatTokenProxy_MasterMinterChanged") FiatTokenProxy_MasterMinterChanged
    | @as("FiatTokenProxy_Mint") FiatTokenProxy_Mint
    | @as("FiatTokenProxy_MinterConfigured") FiatTokenProxy_MinterConfigured
    | @as("FiatTokenProxy_MinterRemoved") FiatTokenProxy_MinterRemoved
    | @as("FiatTokenProxy_OwnershipTransferred") FiatTokenProxy_OwnershipTransferred
    | @as("FiatTokenProxy_Pause") FiatTokenProxy_Pause
    | @as("FiatTokenProxy_PauserChanged") FiatTokenProxy_PauserChanged
    | @as("FiatTokenProxy_RescuerChanged") FiatTokenProxy_RescuerChanged
    | @as("FiatTokenProxy_Transfer") FiatTokenProxy_Transfer
    | @as("FiatTokenProxy_UnBlacklisted") FiatTokenProxy_UnBlacklisted
    | @as("FiatTokenProxy_Unpause") FiatTokenProxy_Unpause
    | @as("FiatTokenProxy_Upgraded") FiatTokenProxy_Upgraded
    | @as("TokenMintERC20Token_Approval") TokenMintERC20Token_Approval
    | @as("TokenMintERC20Token_Transfer") TokenMintERC20Token_Transfer
    | @as("dynamic_contract_registry") DynamicContractRegistry

  let name = "ENTITY_TYPE"
  let variants = [
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
    TokenMintERC20Token_Approval,
    TokenMintERC20Token_Transfer,
    DynamicContractRegistry,
  ]

  let enum = Enum.make(~name, ~variants)
}

let allEnums: array<module(Enum.S)> = [
  module(EntityHistory.RowAction),
  module(ContractType), 
  module(EntityType),
]
