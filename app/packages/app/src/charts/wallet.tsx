'use client'

import React, { useState, useEffect } from 'react'
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
  LineChart,
  Line,
  AreaChart,
  Area,
} from 'recharts'

import { getWalletTransactions } from '@/services'

// Define types for transaction data
interface Transaction {
  from: string
  to: string
  hash: string
  value: string
}

interface TransactionResponse {
  transactions: Transaction[]
}

interface ProcessedTransaction {
  hash: string
  from: string
  to: string
  value: number
  valueEth: number
  type: 'incoming' | 'outgoing' | 'self'
}

interface WalletSummary {
  address: string
  totalIncoming: number
  totalOutgoing: number
  netBalance: number
  transactionCount: number
  uniqueContacts: number
}

interface AddressActivity {
  address: string
  incoming: number
  outgoing: number
  txCount: number
}

interface Props {
  walletId: string
}

const WalletTransactionsDashboard: React.FC<Props> = ({ walletId }) => {
  // Sample transaction data
  const [transactionData, setTransactionData] = useState<TransactionResponse>()

  useEffect(() => {
    getWalletTransactions(walletId).then((data) => {
      setTransactionData(data)
    })
  }, [walletId])

  // Find the main wallet address by identifying the most common address
  const getMainWalletAddress = (): string => {
    const addressCounts: Record<string, number> = {}

    transactionData?.transactions.forEach((tx) => {
      if (!addressCounts[tx.from]) addressCounts[tx.from] = 0
      if (!addressCounts[tx.to]) addressCounts[tx.to] = 0

      addressCounts[tx.from]++
      addressCounts[tx.to]++
    })

    return Object.entries(addressCounts)
      .sort((a, b) => b[1] - a[1])
      .map((entry) => entry[0])[0]
  }

  const mainWalletAddress = getMainWalletAddress()

  // Convert hex values to ETH
  const hexToEth = (hexValue: string): number => {
    try {
      // Remove '0x' prefix if present
      const cleanHex = hexValue.startsWith('0x') ? hexValue.slice(2) : hexValue
      // Convert hex to decimal (BigInt handles large numbers)
      const decimalValue = BigInt(`0x${cleanHex}`)
      // Convert to ETH (1 ETH = 10^18 wei)
      return Number(decimalValue) / 1e18
    } catch (error) {
      console.error('Error converting hex value:', error)
      return 0
    }
  }

  // Process transactions data
  const processTransactions = (): ProcessedTransaction[] => {
    if (!transactionData) return []
    return transactionData?.transactions.map((tx) => {
      const valueEth = hexToEth(tx.value)
      let type: 'incoming' | 'outgoing' | 'self' = 'self'

      if (tx.to === mainWalletAddress && tx.from !== mainWalletAddress) {
        type = 'incoming'
      } else if (tx.from === mainWalletAddress && tx.to !== mainWalletAddress) {
        type = 'outgoing'
      }

      return {
        hash: tx.hash,
        from: tx.from,
        to: tx.to,
        value: Number(BigInt(tx.value)),
        valueEth,
        type,
      }
    })
  }

  const processedTransactions = processTransactions()

  // Calculate wallet summary
  const calculateWalletSummary = (): WalletSummary => {
    const totalIncoming = processedTransactions
      .filter((tx) => tx.type === 'incoming')
      .reduce((sum, tx) => sum + tx.valueEth, 0)

    const totalOutgoing = processedTransactions
      .filter((tx) => tx.type === 'outgoing')
      .reduce((sum, tx) => sum + tx.valueEth, 0)

    const uniqueAddresses = new Set<string>()
    processedTransactions.forEach((tx) => {
      if (tx.from !== mainWalletAddress) uniqueAddresses.add(tx.from)
      if (tx.to !== mainWalletAddress) uniqueAddresses.add(tx.to)
    })

    return {
      address: mainWalletAddress,
      totalIncoming,
      totalOutgoing,
      netBalance: totalIncoming - totalOutgoing,
      transactionCount: processedTransactions.length,
      uniqueContacts: uniqueAddresses.size,
    }
  }

  const walletSummary = calculateWalletSummary()

  // Get top interacting addresses
  const getTopAddresses = (): AddressActivity[] => {
    const addressActivity: Record<string, AddressActivity> = {}

    processedTransactions.forEach((tx) => {
      let counterparty: string | null = null

      if (tx.from === mainWalletAddress) {
        counterparty = tx.to
      } else if (tx.to === mainWalletAddress) {
        counterparty = tx.from
      }

      if (counterparty && counterparty !== mainWalletAddress) {
        if (!addressActivity[counterparty]) {
          addressActivity[counterparty] = {
            address: counterparty,
            incoming: 0,
            outgoing: 0,
            txCount: 0,
          }
        }

        if (tx.from === mainWalletAddress) {
          addressActivity[counterparty].outgoing += tx.valueEth
        } else {
          addressActivity[counterparty].incoming += tx.valueEth
        }

        addressActivity[counterparty].txCount += 1
      }
    })

    return Object.values(addressActivity)
      .sort((a, b) => b.txCount - a.txCount)
      .slice(0, 5)
  }

  // Get transaction volume by type
  const getTransactionVolumeByType = () => {
    return [
      {
        name: 'Incoming',
        value: walletSummary.totalIncoming,
        color: '#4caf50',
      },
      {
        name: 'Outgoing',
        value: walletSummary.totalOutgoing,
        color: '#f44336',
      },
    ]
  }

  // Format addresses for display
  const formatAddress = (address: string): string => {
    return `${address.substring(0, 6)}...${address.substring(address.length - 4)}`
  }

  // Colors for charts
  const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042', '#8884d8']

  return (
    <div className='p-4'>
      <h1 className='text-2xl font-bold mb-6'>Wallet Transaction Analysis</h1>

      {/* Summary Cards */}
      <div className='grid grid-cols-1 md:grid-cols-3 gap-4 mb-6'>
        <div className='bg-white shadow-md rounded-lg p-4'>
          <h2 className='text-lg font-semibold'>Total Incoming</h2>
          <p className='text-xl'>{walletSummary.totalIncoming.toFixed(2)} ETH</p>
        </div>
        <div className='bg-white shadow-md rounded-lg p-4'>
          <h2 className='text-lg font-semibold'>Total Outgoing</h2>
          <p className='text-xl'>{walletSummary.totalOutgoing.toFixed(2)} ETH</p>
        </div>
        <div className='bg-white shadow-md rounded-lg p-4'>
          <h2 className='text-lg font-semibold'>Net Balance</h2>
          <p className='text-xl'>{walletSummary.netBalance.toFixed(2)} ETH</p>
        </div>
      </div>
      {/* Transaction Volume Pie Chart */}
      <ResponsiveContainer width='100%' height={300}>
        <PieChart>
          <Pie
            data={getTransactionVolumeByType()}
            dataKey='value'
            nameKey='name'
            cx='50%'
            cy='50%'
            outerRadius={80}
            fill='#8884d8'
            label>
            {getTransactionVolumeByType().map((entry, index) => (
              <Cell key={`cell-${index}`} fill={entry.color} />
            ))}
          </Pie>
          <Tooltip />
          <Legend />
        </PieChart>
      </ResponsiveContainer>
      {/* Top Interacting Addresses */}
      <div className='mt-6'>
        <h2 className='text-lg font-semibold mb-4'>Top Interacting Addresses</h2>
        <ul>
          {getTopAddresses().map((addressActivity, index) => (
            <li key={index} className='mb-2'>
              <span className='font-mono'>{formatAddress(addressActivity.address)}</span>:
              <span className='ml-2'>Incoming: {addressActivity.incoming.toFixed(2)} ETH,</span>
              <span className='ml-2'>Outgoing: {addressActivity.outgoing.toFixed(2)} ETH,</span>
              <span className='ml-2'>Transactions: {addressActivity.txCount}</span>
            </li>
          ))}
        </ul>
      </div>
    </div>
  )
}

export default WalletTransactionsDashboard
