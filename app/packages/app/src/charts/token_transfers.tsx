'use client'

import React, { useEffect, useState } from 'react'
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
  PieChart,
  Pie,
  Cell,
  ScatterChart,
  Scatter,
  ZAxis,
} from 'recharts'

import { getTokenTransfers } from '@/services'
import Link from 'next/link'

// Define types for the data structure
interface TokenTransfer {
  id: string
  from: string
  to: string
  value: string
}

interface DataStructure {
  data: {
    [key: string]: TokenTransfer[]
  }
}

interface TokenDistributionItem {
  name: string
  count: number
  totalValue: number
}

interface AddressActivityItem {
  address: string
  count: number
}

interface AddressActivityDetail {
  address: string
  sent: number
  received: number
  uniqueTokens: Set<string>
}

interface AddressDataItem {
  address: string
  sent: number
  received: number
  tokenCount: number
}

interface TopPairItem {
  from: string
  to: string
  count: number
  value: number
}

interface Props {
  token?: string
}

const TokenTransfersDashboard: React.FC<Props> = ({ token }) => {
  const [data, setData] = useState<DataStructure>()
  const [walletId, setWalletId] = useState<string>('')

  useEffect(() => {
    if (token) {
      getTokenTransfers(10, token).then((data) => {
        setData(data)
      })
    } else {
      getTokenTransfers(10).then((data) => {
        setData(data)
      })
    }
  }, [token])

  // Format wallet addresses for display
  const formatAddress = (address: string): string => {
    if (!address) return ''
    return `${address.substring(0, 6)}...${address.substring(address.length - 4)}`
  }

  // Process data for token distribution chart
  const tokenDistribution: TokenDistributionItem[] = Object.keys(data?.data || {}).map((token) => {
    const count = data?.data[token].length
    let totalValue = data?.data[token].reduce((sum, item) => {
      const value = BigInt(item.value)
      // Avoid overflow by using a reasonable upper limit
      const cappedValue = value > BigInt('1000000000000000000000000') ? BigInt('1000000000000000000000000') : value
      return sum + Number(cappedValue) / 1e18 // Convert to ETH equivalent for readability
    }, 0)

    totalValue = totalValue || 0

    return {
      name: token.replace('TokenMintERC20Token_Transfer', ''),
      count: count,
      totalValue: parseFloat(totalValue.toFixed(2)),
    } as any
  })

  // Process data for address analysis
  const addressActivity: Record<string, AddressActivityDetail> = {}
  Object.keys(data?.data || {}).forEach((token) => {
    data?.data[token].forEach((transfer) => {
      // Process sender
      if (!addressActivity[transfer.from]) {
        addressActivity[transfer.from] = {
          address: transfer.from,
          sent: 0,
          received: 0,
          uniqueTokens: new Set(),
        }
      }
      addressActivity[transfer.from].sent++
      addressActivity[transfer.from].uniqueTokens.add(token.replace('TokenMintERC20Token_Transfer', ''))

      // Process receiver
      if (!addressActivity[transfer.to]) {
        addressActivity[transfer.to] = {
          address: transfer.to,
          sent: 0,
          received: 0,
          uniqueTokens: new Set(),
        }
      }
      addressActivity[transfer.to].received++
      addressActivity[transfer.to].uniqueTokens.add(token.replace('TokenMintERC20Token_Transfer', ''))
    })
  })

  // Convert to array for scatter plot
  const addressData: AddressDataItem[] = Object.values(addressActivity).map((item) => ({
    address: item.address,
    sent: item.sent,
    received: item.received,
    tokenCount: item.uniqueTokens.size,
  }))

  // Get top addresses by total activity
  const topAddresses: AddressActivityItem[] = Object.values(addressActivity)
    .map((item) => ({
      address: item.address,
      count: item.sent + item.received,
    }))
    .sort((a, b) => b.count - a.count)
    .slice(0, 5)

  // Find top transfer pairs (from-to combinations)
  const transferPairs: Record<string, TopPairItem> = {}
  Object.keys(data?.data || {}).forEach((token) => {
    data?.data[token].forEach((transfer) => {
      const pairKey = `${transfer.from}:${transfer.to}`

      if (!transferPairs[pairKey]) {
        transferPairs[pairKey] = {
          from: transfer.from,
          to: transfer.to,
          count: 0,
          value: 0,
        }
      }

      transferPairs[pairKey].count++

      const value = BigInt(transfer.value)
      const cappedValue = value > BigInt('1000000000000000000000000') ? BigInt('1000000000000000000000000') : value
      transferPairs[pairKey].value += Number(cappedValue) / 1e18
    })
  })

  // Get top transfer pairs
  const topPairs = Object.values(transferPairs)
    .sort((a, b) => b.count - a.count)
    .slice(0, 5)
    .map((pair) => ({
      ...pair,
      fromShort: formatAddress(pair.from),
      toShort: formatAddress(pair.to),
      displayName: `${formatAddress(pair.from)} → ${formatAddress(pair.to)}`,
    }))

  // Colors for charts
  const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042', '#8884d8']

  // Format for large values
  const formatValue = (value: number): string => {
    if (value > 1000000) return `${(value / 1000000).toFixed(1)}M`
    if (value > 1000) return `${(value / 1000).toFixed(1)}K`
    return value.toFixed(1)
  }

  return (
    <div className='p-4'>
      <div>
        <h1 className='text-2xl font-bold mb-6'>ERC20 Token Transfers Dashboard</h1>
        <div className='mb-6 flex gap-2'>
          <input
            onChange={(e) => setWalletId(e.target.value)}
            type='text'
            placeholder='Enter wallet address'
            className='flex-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500'
          />
          <Link
            href={`/wallet/${walletId}`}
            className='px-6 py-2 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 transition duration-300'>
            HyperSync Search
          </Link>
        </div>
      </div>

      <div className='grid grid-cols-1 md:grid-cols-2 gap-6'>
        {/* Token Distribution Chart */}
        <div className='bg-transparent p-4 rounded shadow'>
          <h2 className='text-lg font-semibold mb-4'>Token Transfer Distribution</h2>
          <ResponsiveContainer width='100%' height={300}>
            <BarChart data={tokenDistribution}>
              <CartesianGrid strokeDasharray='3 3' />
              <XAxis dataKey='name' />
              <YAxis />
              <Tooltip formatter={(value: number) => [`${value}`, 'Count']} />
              <Legend />
              <Bar dataKey='count' fill='#8884d8' name='Number of Transfers' />
            </BarChart>
          </ResponsiveContainer>
        </div>

        {/* Value Distribution */}
        <div className='bg-transparent p-4 rounded shadow'>
          <h2 className='text-lg font-semibold mb-4'>Total Value by Token (ETH equivalent)</h2>
          <ResponsiveContainer width='100%' height={300}>
            <PieChart>
              <Pie
                data={tokenDistribution}
                cx='50%'
                cy='50%'
                labelLine={false}
                outerRadius={100}
                fill='#8884d8'
                dataKey='totalValue'
                nameKey='name'
                label={({ name, percent }: { name: string; percent: number }) =>
                  `${name}: ${(percent * 100).toFixed(0)}%`
                }>
                {tokenDistribution.map((entry, index) => (
                  <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
                ))}
              </Pie>
              <Tooltip formatter={(value: number) => [`${formatValue(value)}`, 'Value']} />
            </PieChart>
          </ResponsiveContainer>
        </div>

        {/* Top Active Addresses */}
        <div className='bg-transparent p-4 rounded shadow'>
          <h2 className='text-lg font-semibold mb-4'>Top Addresses by Transfer Activity</h2>
          <ResponsiveContainer width='100%' height={300}>
            <BarChart data={topAddresses} layout='vertical'>
              <CartesianGrid strokeDasharray='3 3' />
              <XAxis type='number' />
              <YAxis type='category' dataKey='address' tickFormatter={formatAddress} width={80} />
              <Tooltip labelFormatter={formatAddress} />
              <Legend />
              <Bar dataKey='count' fill='#82ca9d' name='Transfer Count' />
            </BarChart>
          </ResponsiveContainer>
        </div>

        {/* Top Transfer Pairs */}
        <div className='bg-transparent p-4 rounded shadow'>
          <h2 className='text-lg font-semibold mb-4'>Top Transfer Pairs</h2>
          <ResponsiveContainer width='100%' height={300}>
            <BarChart data={topPairs} layout='vertical'>
              <CartesianGrid strokeDasharray='3 3' />
              <XAxis type='number' />
              <YAxis type='category' dataKey='displayName' width={150} tick={{ fontSize: 12 }} />
              <Tooltip
                formatter={(value: number) => [`${value}`, 'Count']}
                labelFormatter={(value) => `From: ${value.split('→')[0].trim()}\nTo: ${value.split('→')[1].trim()}`}
              />
              <Legend />
              <Bar dataKey='count' fill='#ff7300' name='Transfer Count' />
            </BarChart>
          </ResponsiveContainer>
        </div>

        {/* Address Activity Analysis */}
        <div className='bg-transparent p-4 rounded shadow col-span-1 md:col-span-2'>
          <h2 className='text-lg font-semibold mb-4'>Address Activity Analysis</h2>
          <ResponsiveContainer width='100%' height={300}>
            <ScatterChart>
              <CartesianGrid strokeDasharray='3 3' />
              <XAxis dataKey='sent' name='Sent Transfers' />
              <YAxis dataKey='received' name='Received Transfers' />
              <ZAxis dataKey='tokenCount' name='Unique Tokens' range={[60, 400]} />
              <Tooltip
                formatter={(value: number) => [value, '']}
                labelFormatter={(value: any) => `Address: ${formatAddress(value.address)}`}
                cursor={{ strokeDasharray: '3 3' }}
              />
              <Legend />
              <Scatter name='Address Activity' data={addressData} fill='#ff7300' shape='circle' />
            </ScatterChart>
          </ResponsiveContainer>
        </div>
      </div>
    </div>
  )
}

export default TokenTransfersDashboard
