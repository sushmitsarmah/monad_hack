import { HypersyncClient } from "@envio-dev/hypersync-client";

const ENVIO_TOKEN="c4e36f17-8d03-4d88-8d1f-7fc8647e9988"
const CHAIN_IDS: any = {
    "monad-testnet": "10143",
    "eth-mainnet": "1"
};

async function wallet_tracker(address: string, network = "monad-testnet") {
  // Create hypersync client using the mainnet hypersync endpoint
  const chainId = CHAIN_IDS[network];
  if (!chainId) {
    throw new Error(`Network ${network} not supported`);
  }
  const url = `https://${CHAIN_IDS[network]}.hypersync.xyz`;
  const client = HypersyncClient.new({
    url,
  });

  // The query to run
  const query = {
    "fromBlock": 0,
    "transactions": [
      // get all transactions coming from and going to our address.
      {
        from: [address]
      },
      {
        to: [address]
      }
    ],
    "fieldSelection": {
      "transaction": [
        "blockNumber",
        "hash",
        "from",
        "to",
        "value",
      ]
    }
  };

  // Stream data in reverse order
  //
  // This will parallelize internal requests so we don't have to worry about pipelining/parallelizing make request -> handle response -> handle data loop
  const receiver = await client.stream(query, { reverse: true } as any);
  const txns: any[] = [];

  while (true) {
    let res: any = await receiver.recv();
    if (res === null) {
      break;
    }
    txns.push(...res.data.transactions);
    // for (const tx of (res).data.transactions) {
    //   console.log(tx);
    // }
  }
  return {
    transactions: txns,
  };
}

// const address = "0xb40162fE63aC898bF5b221AC8C73de4c42A39A79";
// const network = "monad-testnet";
// main(address, network);

export default wallet_tracker;