@val external require: string => unit = "require"

let registerContractHandlers = (
  ~contractName,
  ~handlerPathRelativeToRoot,
  ~handlerPathRelativeToConfig,
) => {
  try {
    require("root/" ++ handlerPathRelativeToRoot)
  } catch {
  | exn =>
    let params = {
      "Contract Name": contractName,
      "Expected Handler Path": handlerPathRelativeToConfig,
      "Code": "EE500",
    }
    let logger = Logging.createChild(~params)

    let errHandler = exn->ErrorHandling.make(~msg="Failed to import handler file", ~logger)
    errHandler->ErrorHandling.log
    errHandler->ErrorHandling.raiseExn
  }
}

%%private(
  let makeGeneratedConfig = () => {
    let chains = [
      {
        let contracts = [
          {
            Config.name: "TokenMintERC20Token",
            abi: Types.TokenMintERC20Token.abi,
            addresses: [
              "0x95aD61b0a150d79219dCF64E1E6Cc01f0B64C4cE"->Address.Evm.fromStringOrThrow
,
            ],
            events: [
              module(Types.TokenMintERC20Token.Approval),
              module(Types.TokenMintERC20Token.Transfer),
            ],
          },
        ]
        let chain = ChainMap.Chain.makeUnsafe(~chainId=1)
        {
          Config.confirmedBlockThreshold: 200,
          syncSource: 
            HyperSync
,
          startBlock: 0,
          endBlock:  None ,
          chain,
          contracts,
          source:
            HyperSyncSource.make({
              chain,
              contracts,
              endpointUrl: "https://1.hypersync.xyz",
              allEventSignatures: [
                Types.TokenMintERC20Token.eventSignatures,
              ]->Belt.Array.concatMany,
              eventRouter:
                contracts
                ->Belt.Array.flatMap(contract => contract.events)
                ->EventRouter.fromEvmEventModsOrThrow(~chain),
              /*
                Determines whether to use HypersyncClient Decoder or Viem for parsing events
                Default is hypersync client decoder, configurable in config with:
                ```yaml
                event_decoder: "viem" || "hypersync-client"
                ```
              */
              shouldUseHypersyncClientDecoder: Env.Configurable.shouldUseHypersyncClientDecoder->Belt.Option.getWithDefault(
                true,
              )
            })
        }
      },
      {
        let contracts = [
          {
            Config.name: "FiatTokenProxy",
            abi: Types.FiatTokenProxy.abi,
            addresses: [
              "0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913"->Address.Evm.fromStringOrThrow
,
            ],
            events: [
              module(Types.FiatTokenProxy.AdminChanged),
              module(Types.FiatTokenProxy.Approval),
              module(Types.FiatTokenProxy.AuthorizationCanceled),
              module(Types.FiatTokenProxy.AuthorizationUsed),
              module(Types.FiatTokenProxy.Blacklisted),
              module(Types.FiatTokenProxy.BlacklisterChanged),
              module(Types.FiatTokenProxy.Burn),
              module(Types.FiatTokenProxy.MasterMinterChanged),
              module(Types.FiatTokenProxy.Mint),
              module(Types.FiatTokenProxy.MinterConfigured),
              module(Types.FiatTokenProxy.MinterRemoved),
              module(Types.FiatTokenProxy.OwnershipTransferred),
              module(Types.FiatTokenProxy.Pause),
              module(Types.FiatTokenProxy.PauserChanged),
              module(Types.FiatTokenProxy.RescuerChanged),
              module(Types.FiatTokenProxy.Transfer),
              module(Types.FiatTokenProxy.UnBlacklisted),
              module(Types.FiatTokenProxy.Unpause),
              module(Types.FiatTokenProxy.Upgraded),
            ],
          },
        ]
        let chain = ChainMap.Chain.makeUnsafe(~chainId=8453)
        {
          Config.confirmedBlockThreshold: 200,
          syncSource: 
            HyperSync
,
          startBlock: 0,
          endBlock:  None ,
          chain,
          contracts,
          source:
            HyperSyncSource.make({
              chain,
              contracts,
              endpointUrl: "https://8453.hypersync.xyz",
              allEventSignatures: [
                Types.FiatTokenProxy.eventSignatures,
              ]->Belt.Array.concatMany,
              eventRouter:
                contracts
                ->Belt.Array.flatMap(contract => contract.events)
                ->EventRouter.fromEvmEventModsOrThrow(~chain),
              /*
                Determines whether to use HypersyncClient Decoder or Viem for parsing events
                Default is hypersync client decoder, configurable in config with:
                ```yaml
                event_decoder: "viem" || "hypersync-client"
                ```
              */
              shouldUseHypersyncClientDecoder: Env.Configurable.shouldUseHypersyncClientDecoder->Belt.Option.getWithDefault(
                true,
              )
            })
        }
      },
    ]

    Config.make(
      ~shouldRollbackOnReorg=true,
      ~shouldSaveFullHistory=false,
      ~isUnorderedMultichainMode=false,
      ~chains,
      ~enableRawEvents=false,
      ~entities=[
        module(Entities.FiatTokenProxy_AdminChanged),
        module(Entities.FiatTokenProxy_Approval),
        module(Entities.FiatTokenProxy_AuthorizationCanceled),
        module(Entities.FiatTokenProxy_AuthorizationUsed),
        module(Entities.FiatTokenProxy_Blacklisted),
        module(Entities.FiatTokenProxy_BlacklisterChanged),
        module(Entities.FiatTokenProxy_Burn),
        module(Entities.FiatTokenProxy_MasterMinterChanged),
        module(Entities.FiatTokenProxy_Mint),
        module(Entities.FiatTokenProxy_MinterConfigured),
        module(Entities.FiatTokenProxy_MinterRemoved),
        module(Entities.FiatTokenProxy_OwnershipTransferred),
        module(Entities.FiatTokenProxy_Pause),
        module(Entities.FiatTokenProxy_PauserChanged),
        module(Entities.FiatTokenProxy_RescuerChanged),
        module(Entities.FiatTokenProxy_Transfer),
        module(Entities.FiatTokenProxy_UnBlacklisted),
        module(Entities.FiatTokenProxy_Unpause),
        module(Entities.FiatTokenProxy_Upgraded),
        module(Entities.TokenMintERC20Token_Approval),
        module(Entities.TokenMintERC20Token_Transfer),
      ],
    )
  }

  let config: ref<option<Config.t>> = ref(None)
)

let registerAllHandlers = () => {
  registerContractHandlers(
    ~contractName="FiatTokenProxy",
    ~handlerPathRelativeToRoot="src/EventHandlers.ts",
    ~handlerPathRelativeToConfig="src/EventHandlers.ts",
  )
  registerContractHandlers(
    ~contractName="TokenMintERC20Token",
    ~handlerPathRelativeToRoot="src/EventHandlers.ts",
    ~handlerPathRelativeToConfig="src/EventHandlers.ts",
  )

  let generatedConfig = makeGeneratedConfig()
  config := Some(generatedConfig)
  generatedConfig
}

let getConfig = () => {
  switch config.contents {
  | Some(config) => config
  | None => registerAllHandlers()
  }
}
