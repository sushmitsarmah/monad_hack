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

// import { HINDEX_DATA } from './sample'

import { getTokenApprovals } from '@/services'
import Link from 'next/link'

// Define types for the data structure
interface TokenApproval {
  id: string
  owner: string
  spender: string
  value: string
}

interface DataStructure {
  data: {
    [key: string]: TokenApproval[]
  }
}

interface TokenDistributionItem {
  name: string
  count: number
  totalValue: number
}

interface SpenderItem {
  spender: string
  token: string
  value: number
}

interface SpenderCount {
  spender: string
  count: number
}

interface OwnerActivityItem {
  owner: string
  approvals: number
  tokens: Set<string>
}

interface OwnerDataItem {
  owner: string
  approvals: number
  tokenCount: number
}

const TokenApprovalsDashboard: React.FC = () => {
  const [data, setData] = useState<DataStructure>()
  const [walletId, setWalletId] = useState<string>('')

  useEffect(() => {
    getTokenApprovals(10).then((data) => {
      setData(data)
    })
  }, [])

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
      name: token.replace('TokenMintERC20Token_Approval', ''),
      count: count,
      totalValue: parseFloat(totalValue.toFixed(2)),
    } as any
  })

  // Process data for popular spenders
  const allSpenders: SpenderItem[] = []
  Object.keys(data?.data || {}).forEach((token) => {
    data?.data[token].forEach((approval) => {
      allSpenders.push({
        spender: approval.spender,
        token: token.replace('TokenMintERC20Token_Approval', ''),
        value:
          Number(
            BigInt(approval.value) > BigInt('1000000000000000000000000')
              ? BigInt('1000000000000000000000000')
              : BigInt(approval.value)
          ) / 1e18,
      })
    })
  })

  // Count approvals by spender
  const spenderCounts: Record<string, number> = {}
  allSpenders.forEach((item) => {
    if (!spenderCounts[item.spender]) {
      spenderCounts[item.spender] = 0
    }
    spenderCounts[item.spender]++
  })

  // Get top spenders
  const topSpenders: SpenderCount[] = Object.keys(spenderCounts)
    .map((spender) => ({ spender: spender, count: spenderCounts[spender] }))
    .sort((a, b) => b.count - a.count)
    .slice(0, 5)

  // Process data for owner analysis
  const ownerActivity: Record<string, OwnerActivityItem> = {}
  Object.keys(data?.data || {}).forEach((token) => {
    data?.data[token].forEach((approval) => {
      if (!ownerActivity[approval.owner]) {
        ownerActivity[approval.owner] = {
          owner: approval.owner,
          approvals: 0,
          tokens: new Set(),
        }
      }
      ownerActivity[approval.owner].approvals++
      ownerActivity[approval.owner].tokens.add(token.replace('TokenMintERC20Token_Approval', ''))
    })
  })

  const ownerData: OwnerDataItem[] = Object.values(ownerActivity).map((item) => ({
    owner: item.owner,
    approvals: item.approvals,
    tokenCount: item.tokens.size,
  }))

  // Colors for charts
  const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042', '#8884d8']

  // Format wallet addresses for display
  const formatAddress = (address: string): string => {
    return `${address.substring(0, 6)}...${address.substring(address.length - 4)}`
  }

  const CustomYAxisTick: React.FC<{ x: number; y: number; payload: any }> = ({ x, y, payload }) => {
    const walletId = payload.value
    return (
      <a href={`/wallet/${walletId}`} style={{ textDecoration: 'none', fill: '#000' }}>
        <text x={x} y={y} dy={4} textAnchor='end' fill='#000'>
          {formatAddress(walletId)}
        </text>
      </a>
    )
  }

  // Format for large values
  const formatValue = (value: number): string => {
    if (value > 1000000) return `${(value / 1000000).toFixed(1)}M`
    if (value > 1000) return `${(value / 1000).toFixed(1)}K`
    return value.toFixed(1)
  }

  return (
    <div className='p-4'>
      <div>
        <h1 className='text-2xl font-bold mb-6'>ERC20 Token Approvals Dashboard</h1>
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
        <div className='bg-white p-4 rounded shadow'>
          <h2 className='text-lg font-semibold mb-4'>Token Approval Distribution</h2>
          <ResponsiveContainer width='100%' height={300}>
            <BarChart data={tokenDistribution}>
              <CartesianGrid strokeDasharray='3 3' />
              <XAxis dataKey='name' />
              <YAxis />
              <Tooltip formatter={(value: number) => [`${value}`, 'Count']} />
              <Legend />
              <Bar dataKey='count' fill='#8884d8' name='Number of Approvals' />
            </BarChart>
          </ResponsiveContainer>
        </div>

        {/* Value Distribution */}
        <div className='bg-white p-4 rounded shadow'>
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

        {/* Top Spenders */}
        <div className='bg-white p-4 rounded shadow'>
          <h2 className='text-lg font-semibold mb-4'>Top Spenders by Approval Count</h2>
          <ResponsiveContainer width='100%' height={300}>
            <BarChart data={topSpenders} layout='vertical'>
              <CartesianGrid strokeDasharray='3 3' />
              <XAxis type='number' />
              <YAxis type='category' dataKey='spender' tickFormatter={formatAddress} width={80} />
              <Tooltip labelFormatter={formatAddress} />
              <Legend />
              <Bar dataKey='count' fill='#82ca9d' name='Approval Count' />
            </BarChart>
          </ResponsiveContainer>
        </div>

        {/* Owner Activity */}
        <div className='bg-white p-4 rounded shadow'>
          <h2 className='text-lg font-semibold mb-4'>Owner Activity Analysis</h2>
          <ResponsiveContainer width='100%' height={300}>
            <ScatterChart>
              <CartesianGrid strokeDasharray='3 3' />
              <XAxis dataKey='approvals' name='Total Approvals' />
              <YAxis dataKey='tokenCount' name='Unique Tokens' />
              <ZAxis range={[60, 400]} />
              <Tooltip
                formatter={(value: number) => [value, '']}
                labelFormatter={(value: any) => `Owner: ${formatAddress(value.owner)}`}
                cursor={{ strokeDasharray: '3 3' }}
              />
              <Legend />
              <Scatter name='Owner Activity' data={ownerData} fill='#ff7300' shape='circle' />
            </ScatterChart>
          </ResponsiveContainer>
        </div>
      </div>
    </div>
  )
}

export default TokenApprovalsDashboard
