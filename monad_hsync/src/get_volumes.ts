import { HypersyncClient, Decoder } from "@envio-dev/hypersync-client";
import pkg from "@envio-dev/hypersync-client";

const CHAIN_IDS: any = {
  'monad-testnet': '10143',
  'eth-mainnet': '1',
}

// Convert address to topic for filtering. Padds the address with zeroes.
function addressToTopic(address: string): string {
  return "0x000000000000000000000000" + address.toLowerCase().slice(2, address.length);
}

// Helper function to format large numbers to ETH/Token format with specified decimals
function formatTokenValue(value: bigint, decimals: number = 18, isEth: boolean = false): string {
  const divisor = BigInt(10 ** decimals);
  const integerPart = (value / divisor).toString();
  const fractionalPart = (value % divisor).toString().padStart(decimals, '0');
  
  // Remove trailing zeros from fractional part
  const trimmedFractional = fractionalPart.replace(/0+$/, '');
  
  // If there's a fractional part after trimming, add it with decimal point
  const formattedNumber = trimmedFractional ? `${integerPart}.${trimmedFractional}` : integerPart;
  return isEth ? `${formattedNumber} ETH` : formattedNumber;
}

async function get_volumes(addresses: string[], network = 'monad-testnet') {
  // Create hypersync client using the mainnet hypersync endpoint
  const chainId = CHAIN_IDS[network]
  if (!chainId) {
    throw new Error(`Network ${network} not supported`)
  }
  const url = `https://${CHAIN_IDS[network]}.hypersync.xyz`
  const client = HypersyncClient.new({
    url,
  })

  const addressTopicFilter = addresses.map(addressToTopic);

  // The query to run
  const query = {
    // start from block 0 and go to the end of the chain (we don't specify a toBlock).
    "fromBlock": 0,
    // The logs we want. We will also automatically get transactions and blocks relating to these logs (the query implicitly joins them).
    "logs": [
      {
        // We want All ERC20 transfers coming to any of our addresses
        "topics": [
          // keccak256 hash of the standard Transfer event signature in ERC-20 tokens
          // type of event. In this case (Transfer(address,address,uint256))
          ["0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"],
          [], // topic 2 . In this case the from address
          addressTopicFilter, // topic 3. In this case the to address
          [], // topic 4. In this case the amount
        ]
      },
      {
        // We want All ERC20 transfers going from any of our addresses
        "topics": [
          // keccak256 hash of the standard Transfer event signature in ERC-20 tokens
          // type of event. In this case (Transfer(address,address,uint256))
          ["0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"],
          addressTopicFilter, // topic 2. In this case the from address
          [], // topic 3. In this case the to address
          [], // topic 4. In this case the amount
        ]
      }
    ],
    "transactions": [
      // get all transactions coming from and going to any of our addresses.
      {
        from: addresses
      },
      {
        to: addresses
      }
    ],
    // Select the fields we are interested in, notice topics are selected as topic0,1,2,3
    "fieldSelection": {
      "block": [
        "number",
        "timestamp",
        "hash",
      ],
      "log": [
        "blockNumber",
        "logIndex",
        "transactionIndex",
        "transactionHash",
        "data",
        "address",
        "topic0",
        "topic1",
        "topic2",
        "topic3",
      ],
      "transaction": [
        "blockNumber",
        "transactionIndex",
        "hash",
        "from",
        "to",
        "value",
        "input",
      ]
    },
  };

  console.log("Running the query...");

  // Run the query once, the query is automatically paginated so it will return when it reaches some limit (time, response size etc.)
  //  there is a nextBlock field on the response object so we can set the fromBlock of our query to this value and continue our query until
  // res.nextBlock is equal to res.archiveHeight or query.toBlock in case we specified an end block.
  const res = await client.get(query);

  console.log(`Ran the query once. Next block to query is ${res.nextBlock}`);

  const decoder = Decoder.fromSignatures([
    "Transfer(address indexed from, address indexed to, uint amount)"
  ]);

  // Decode the log on a background thread so we don't block the event loop.
  // Can also use decoder.decodeLogsSync if it is more convenient.
  const decodedLogs = await decoder.decodeLogs(res.data.logs);

  // Let's count total volume for each address, it is meaningless because of currency differences but good as an example.
  let total_erc20_volume: any = {};

  for (const log of decodedLogs as pkg.DecodedEvent[]) {
    // skip invalid logs
    if (log === null) {
      continue;
    }

    if (!total_erc20_volume[log?.indexed[0].val as string]) {
      total_erc20_volume[log?.indexed[0].val as string] = BigInt(0);
    }
    if (!total_erc20_volume[log?.indexed[1].val as string]) {
      total_erc20_volume[log?.indexed[1].val as string] = BigInt(0);
    }
    // We count for both sides but we will filter by our addresses later so we will ignore unnecessary addresses.
    total_erc20_volume[log?.indexed[0].val as string] += log?.body[0].val as bigint;
    total_erc20_volume[log?.indexed[1].val as string] += log?.body[0].val as bigint;
  }

  // for (const addr of addresses) {
  //   console.log(`Total erc20 transfer volume for address ${addr} is ${total_erc20_volume[addr]}`);
  // }

  let total_wei_volume: any = {};

  for (const tx of res.data.transactions) {
    if (tx != undefined) {
      if (tx.from && !total_wei_volume[tx.from]) {
        total_wei_volume[tx.from] = BigInt(0);
      }
      if (tx.to && !total_wei_volume[tx.to]) {
        total_wei_volume[tx.to] = BigInt(0);
      }

      if (tx.from && tx.value) {
        total_wei_volume[tx.from] += BigInt(tx.value);
      }
      if (tx.to && tx.value) {
        total_wei_volume[tx.to] += BigInt(tx.value);
      }
    }
  }

  // for (const addr of addresses) {
  //   console.log(`Total wei transfer wolume for address ${addr} is ${total_wei_volume[addr]}`);
  // }

  // Convert BigInt values to strings in the volume objects
  const stringifiedErc20Volume: { [key: string]: string } = {};
  const stringifiedWeiVolume: { [key: string]: string } = {};

  // Convert ERC20 volumes - only for tracked addresses
  for (const address of addresses) {
    const rawValue = total_erc20_volume[address] || BigInt(0);
    stringifiedErc20Volume[address] = formatTokenValue(rawValue); // Assuming 18 decimals for tokens
  }

  // Convert Wei volumes to ETH - only for tracked addresses
  for (const address of addresses) {
    const rawValue = total_wei_volume[address] || BigInt(0);
    stringifiedWeiVolume[address] = formatTokenValue(rawValue); // 18 decimals for ETH
  }

  return {
    erc20Volume: stringifiedErc20Volume,
    weiVolume: stringifiedWeiVolume,
  }
}

// The addresses we want to get data for
// const addresses = [
//   "0xD1a923D70510814EaE7695A76326201cA06d080F".toLowerCase(),
//   "0xc0A101c4E9Bb4463BD2F5d6833c2276C36914Fb6".toLowerCase(),
//   "0xa0FBaEdC4C110f5A0c5E96c3eeAC9B5635b74CE7".toLowerCase(),
//   "0x32448eb389aBe39b20d5782f04a8d71a2b2e7189".toLowerCase(),
// ];

// txn_tracker(addresses);

export default get_volumes;