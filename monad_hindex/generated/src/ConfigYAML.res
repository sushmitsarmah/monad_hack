
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
        "WETHTokenMintERC20Token",
        {
          name: "WETHTokenMintERC20Token",
          abi: Types.WETHTokenMintERC20Token.abi,
          addresses: [
            "0xB5a30b0FDc5EA94A52fDc42e3E9760Cb8449Fb37",
          ],
          events: [
            Types.WETHTokenMintERC20Token.Approval.name,
            Types.WETHTokenMintERC20Token.Transfer.name,
          ],
        }
      ),
      (
        "DAKTokenMintERC20Token",
        {
          name: "DAKTokenMintERC20Token",
          abi: Types.DAKTokenMintERC20Token.abi,
          addresses: [
            "0x0F0BDEbF0F83cD1EE3974779Bcb7315f9808c714",
          ],
          events: [
            Types.DAKTokenMintERC20Token.Approval.name,
            Types.DAKTokenMintERC20Token.Transfer.name,
          ],
        }
      ),
      (
        "YAKITokenMintERC20Token",
        {
          name: "YAKITokenMintERC20Token",
          abi: Types.YAKITokenMintERC20Token.abi,
          addresses: [
            "0xfe140e1dCe99Be9F4F15d657CD9b7BF622270C50",
          ],
          events: [
            Types.YAKITokenMintERC20Token.Approval.name,
            Types.YAKITokenMintERC20Token.Transfer.name,
          ],
        }
      ),
      (
        "CHOGTokenMintERC20Token",
        {
          name: "CHOGTokenMintERC20Token",
          abi: Types.CHOGTokenMintERC20Token.abi,
          addresses: [
            "0xE0590015A873bF326bd645c3E1266d4db41C4E6B",
          ],
          events: [
            Types.CHOGTokenMintERC20Token.Approval.name,
            Types.CHOGTokenMintERC20Token.Transfer.name,
          ],
        }
      ),
    ])
    let chain = ChainMap.Chain.makeUnsafe(~chainId=10143)
    (
      chain,
      {
        confirmedBlockThreshold: 200,
        syncSource: 
          HyperSync({endpointUrl: "https://10143.hypersync.xyz"})
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
