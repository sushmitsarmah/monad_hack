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
            Config.name: "WETHTokenMintERC20Token",
            abi: Types.WETHTokenMintERC20Token.abi,
            addresses: [
              "0xB5a30b0FDc5EA94A52fDc42e3E9760Cb8449Fb37"->Address.Evm.fromStringOrThrow
,
            ],
            events: [
              module(Types.WETHTokenMintERC20Token.Approval),
              module(Types.WETHTokenMintERC20Token.Transfer),
            ],
          },
          {
            Config.name: "DAKTokenMintERC20Token",
            abi: Types.DAKTokenMintERC20Token.abi,
            addresses: [
              "0x0F0BDEbF0F83cD1EE3974779Bcb7315f9808c714"->Address.Evm.fromStringOrThrow
,
            ],
            events: [
              module(Types.DAKTokenMintERC20Token.Approval),
              module(Types.DAKTokenMintERC20Token.Transfer),
            ],
          },
          {
            Config.name: "YAKITokenMintERC20Token",
            abi: Types.YAKITokenMintERC20Token.abi,
            addresses: [
              "0xfe140e1dCe99Be9F4F15d657CD9b7BF622270C50"->Address.Evm.fromStringOrThrow
,
            ],
            events: [
              module(Types.YAKITokenMintERC20Token.Approval),
              module(Types.YAKITokenMintERC20Token.Transfer),
            ],
          },
          {
            Config.name: "CHOGTokenMintERC20Token",
            abi: Types.CHOGTokenMintERC20Token.abi,
            addresses: [
              "0xE0590015A873bF326bd645c3E1266d4db41C4E6B"->Address.Evm.fromStringOrThrow
,
            ],
            events: [
              module(Types.CHOGTokenMintERC20Token.Approval),
              module(Types.CHOGTokenMintERC20Token.Transfer),
            ],
          },
        ]
        let chain = ChainMap.Chain.makeUnsafe(~chainId=10143)
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
              endpointUrl: "https://10143.hypersync.xyz",
              allEventSignatures: [
                Types.WETHTokenMintERC20Token.eventSignatures,
                Types.DAKTokenMintERC20Token.eventSignatures,
                Types.YAKITokenMintERC20Token.eventSignatures,
                Types.CHOGTokenMintERC20Token.eventSignatures,
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
        module(Entities.CHOGTokenMintERC20Token_Approval),
        module(Entities.CHOGTokenMintERC20Token_Transfer),
        module(Entities.DAKTokenMintERC20Token_Approval),
        module(Entities.DAKTokenMintERC20Token_Transfer),
        module(Entities.WETHTokenMintERC20Token_Approval),
        module(Entities.WETHTokenMintERC20Token_Transfer),
        module(Entities.YAKITokenMintERC20Token_Approval),
        module(Entities.YAKITokenMintERC20Token_Transfer),
      ],
    )
  }

  let config: ref<option<Config.t>> = ref(None)
)

let registerAllHandlers = () => {
  registerContractHandlers(
    ~contractName="CHOGTokenMintERC20Token",
    ~handlerPathRelativeToRoot="src/EventHandlers.ts",
    ~handlerPathRelativeToConfig="src/EventHandlers.ts",
  )
  registerContractHandlers(
    ~contractName="DAKTokenMintERC20Token",
    ~handlerPathRelativeToRoot="src/EventHandlers.ts",
    ~handlerPathRelativeToConfig="src/EventHandlers.ts",
  )
  registerContractHandlers(
    ~contractName="WETHTokenMintERC20Token",
    ~handlerPathRelativeToRoot="src/EventHandlers.ts",
    ~handlerPathRelativeToConfig="src/EventHandlers.ts",
  )
  registerContractHandlers(
    ~contractName="YAKITokenMintERC20Token",
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
