
type hyperSyncConfig = {endpointUrl: string}
type hyperFuelConfig = {endpointUrl: string}

@genType.opaque
type rpcConfig = {
  syncConfig: Config.syncConfig,
}

@genType
type syncSource = HyperSync(hyperSyncConfig) | HyperFuel(hyperFuelConfig) | Rpc(rpcConfig)

@genType.opaque
type aliasAbi = Ethers.abi

type eventName = string

type contract = {
  name: string,
  abi: aliasAbi,
  addresses: array<string>,
  events: array<eventName>,
}

type configYaml = {
  syncSource,
  startBlock: int,
  confirmedBlockThreshold: int,
  contracts: dict<contract>,
}

let publicConfig = ChainMap.fromArrayUnsafe([
  {
    let contracts = Js.Dict.fromArray([
      (
        "TokenMintERC20Token",
        {
          name: "TokenMintERC20Token",
          abi: Types.TokenMintERC20Token.abi,
          addresses: [
            "0x95aD61b0a150d79219dCF64E1E6Cc01f0B64C4cE",
          ],
          events: [
            Types.TokenMintERC20Token.Approval.name,
            Types.TokenMintERC20Token.Transfer.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=1)
    (
      chain,
      {
        confirmedBlockThreshold: 200,
        syncSource: 
          HyperSync({endpointUrl: "https://1.hypersync.xyz"})
,
        startBlock: 0,
        contracts
      }
    )
  },
  {
    let contracts = Js.Dict.fromArray([
      (
        "FiatTokenProxy",
        {
          name: "FiatTokenProxy",
          abi: Types.FiatTokenProxy.abi,
          addresses: [
            "0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913",
          ],
          events: [
            Types.FiatTokenProxy.AdminChanged.name,
            Types.FiatTokenProxy.Approval.name,
            Types.FiatTokenProxy.AuthorizationCanceled.name,
            Types.FiatTokenProxy.AuthorizationUsed.name,
            Types.FiatTokenProxy.Blacklisted.name,
            Types.FiatTokenProxy.BlacklisterChanged.name,
            Types.FiatTokenProxy.Burn.name,
            Types.FiatTokenProxy.MasterMinterChanged.name,
            Types.FiatTokenProxy.Mint.name,
            Types.FiatTokenProxy.MinterConfigured.name,
            Types.FiatTokenProxy.MinterRemoved.name,
            Types.FiatTokenProxy.OwnershipTransferred.name,
            Types.FiatTokenProxy.Pause.name,
            Types.FiatTokenProxy.PauserChanged.name,
            Types.FiatTokenProxy.RescuerChanged.name,
            Types.FiatTokenProxy.Transfer.name,
            Types.FiatTokenProxy.UnBlacklisted.name,
            Types.FiatTokenProxy.Unpause.name,
            Types.FiatTokenProxy.Upgraded.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=8453)
    (
      chain,
      {
        confirmedBlockThreshold: 200,
        syncSource: 
          HyperSync({endpointUrl: "https://8453.hypersync.xyz"})
,
        startBlock: 0,
        contracts
      }
    )
  },
])

@genType
let getGeneratedByChainId: int => configYaml = chainId => {
  let chain = ChainMap.Chain.makeUnsafe(~chainId)
  if !(publicConfig->ChainMap.has(chain)) {
    Js.Exn.raiseError(
      "No chain with id " ++ chain->ChainMap.Chain.toString ++ " found in config.yaml",
    )
  }
  publicConfig->ChainMap.get(chain)
}
