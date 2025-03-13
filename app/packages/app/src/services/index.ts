const HSYNC_API_URL = 'http://localhost:4000/api'
// const HINDEX_GRAPHQL_URL = 'http://localhost:8080/v1/graphql'
const HINDEX_GRAPHQL_URL = 'https://indexer.dev.hyperindex.xyz/892dd7a/v1/graphql'

export const getWalletTransactions = async (address: string) => {
  const response = await fetch(`${HSYNC_API_URL}/wallet-txns`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ address }),
  })

  if (!response.ok) {
    throw new Error(`Failed to fetch wallet transactions: ${response.statusText}`)
  }

  return response.json()
}

export const getVolumes = async (addresses: string[]) => {
  const response = await fetch(`${HSYNC_API_URL}/volumes`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ addresses }),
  })

  if (!response.ok) {
    throw new Error(`Failed to fetch volumes: ${response.statusText}`)
  }

  return response.json()
}

export const getTokenApprovals = async (limit = 50) => {
  const query = `
      query TokenApprovals {
        CHOGTokenMintERC20Token_Approval(limit: ${limit}) {
          id
          owner
          spender
          value
        }
        DAKTokenMintERC20Token_Approval(limit: ${limit}) {
          id
          owner
          spender
          value
        }
        WETHTokenMintERC20Token_Approval(limit: ${limit}) {
          id
          owner
          spender
          value
        }
        YAKITokenMintERC20Token_Approval(limit: ${limit}) {
          id
          owner
          spender
          value
        }
      }
    `

  const response = await fetch(HINDEX_GRAPHQL_URL, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      // 'x-hasura-admin-secret': 'testing',
    },
    body: JSON.stringify({ query }),
  })

  if (!response.ok) {
    throw new Error(`Failed to fetch token approvals: ${response.statusText}`)
  }

  return response.json()
}

export const getTokenTransfers = async (limit = 50) => {
  const query = `
      query TokenTransfers {
        CHOGTokenMintERC20Token_Transfer(limit: ${limit}) {
          id
          from
          to
          value
        }
        DAKTokenMintERC20Token_Transfer(limit: ${limit}) {
          id
          from
          to
          value
        }
        WETHTokenMintERC20Token_Transfer(limit: ${limit}) {
          id
          from
          to
          value
        }
        YAKITokenMintERC20Token_Transfer(limit: ${limit}) {
          id
          from
          to
          value
        }
      }
    `

  const response = await fetch(HINDEX_GRAPHQL_URL, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      // 'x-hasura-admin-secret': 'testing',
    },
    body: JSON.stringify({ query }),
  })

  if (!response.ok) {
    throw new Error(`Failed to fetch token transfers: ${response.statusText}`)
  }

  return response.json()
}
