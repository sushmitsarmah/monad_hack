  @genType
module FiatTokenProxy = {
  module AdminChanged = Types.MakeRegister(Types.FiatTokenProxy.AdminChanged)
  module Approval = Types.MakeRegister(Types.FiatTokenProxy.Approval)
  module AuthorizationCanceled = Types.MakeRegister(Types.FiatTokenProxy.AuthorizationCanceled)
  module AuthorizationUsed = Types.MakeRegister(Types.FiatTokenProxy.AuthorizationUsed)
  module Blacklisted = Types.MakeRegister(Types.FiatTokenProxy.Blacklisted)
  module BlacklisterChanged = Types.MakeRegister(Types.FiatTokenProxy.BlacklisterChanged)
  module Burn = Types.MakeRegister(Types.FiatTokenProxy.Burn)
  module MasterMinterChanged = Types.MakeRegister(Types.FiatTokenProxy.MasterMinterChanged)
  module Mint = Types.MakeRegister(Types.FiatTokenProxy.Mint)
  module MinterConfigured = Types.MakeRegister(Types.FiatTokenProxy.MinterConfigured)
  module MinterRemoved = Types.MakeRegister(Types.FiatTokenProxy.MinterRemoved)
  module OwnershipTransferred = Types.MakeRegister(Types.FiatTokenProxy.OwnershipTransferred)
  module Pause = Types.MakeRegister(Types.FiatTokenProxy.Pause)
  module PauserChanged = Types.MakeRegister(Types.FiatTokenProxy.PauserChanged)
  module RescuerChanged = Types.MakeRegister(Types.FiatTokenProxy.RescuerChanged)
  module Transfer = Types.MakeRegister(Types.FiatTokenProxy.Transfer)
  module UnBlacklisted = Types.MakeRegister(Types.FiatTokenProxy.UnBlacklisted)
  module Unpause = Types.MakeRegister(Types.FiatTokenProxy.Unpause)
  module Upgraded = Types.MakeRegister(Types.FiatTokenProxy.Upgraded)
}

  @genType
module TokenMintERC20Token = {
  module Approval = Types.MakeRegister(Types.TokenMintERC20Token.Approval)
  module Transfer = Types.MakeRegister(Types.TokenMintERC20Token.Transfer)
}

