module ContractType = {
  @genType
  type t = 
    | @as("CHOGTokenMintERC20Token") CHOGTokenMintERC20Token
    | @as("DAKTokenMintERC20Token") DAKTokenMintERC20Token
    | @as("WETHTokenMintERC20Token") WETHTokenMintERC20Token
    | @as("YAKITokenMintERC20Token") YAKITokenMintERC20Token

  let name = "CONTRACT_TYPE"
  let variants = [
    CHOGTokenMintERC20Token,
    DAKTokenMintERC20Token,
    WETHTokenMintERC20Token,
    YAKITokenMintERC20Token,
  ]
  let enum = Enum.make(~name, ~variants)
}

module EntityType = {
  @genType
  type t = 
    | @as("CHOGTokenMintERC20Token_Approval") CHOGTokenMintERC20Token_Approval
    | @as("CHOGTokenMintERC20Token_Transfer") CHOGTokenMintERC20Token_Transfer
    | @as("DAKTokenMintERC20Token_Approval") DAKTokenMintERC20Token_Approval
    | @as("DAKTokenMintERC20Token_Transfer") DAKTokenMintERC20Token_Transfer
    | @as("WETHTokenMintERC20Token_Approval") WETHTokenMintERC20Token_Approval
    | @as("WETHTokenMintERC20Token_Transfer") WETHTokenMintERC20Token_Transfer
    | @as("YAKITokenMintERC20Token_Approval") YAKITokenMintERC20Token_Approval
    | @as("YAKITokenMintERC20Token_Transfer") YAKITokenMintERC20Token_Transfer
    | @as("dynamic_contract_registry") DynamicContractRegistry

  let name = "ENTITY_TYPE"
  let variants = [
    CHOGTokenMintERC20Token_Approval,
    CHOGTokenMintERC20Token_Transfer,
    DAKTokenMintERC20Token_Approval,
    DAKTokenMintERC20Token_Transfer,
    WETHTokenMintERC20Token_Approval,
    WETHTokenMintERC20Token_Transfer,
    YAKITokenMintERC20Token_Approval,
    YAKITokenMintERC20Token_Transfer,
    DynamicContractRegistry,
  ]

  let enum = Enum.make(~name, ~variants)
}

let allEnums: array<module(Enum.S)> = [
  module(EntityHistory.RowAction),
  module(ContractType), 
  module(EntityType),
]
