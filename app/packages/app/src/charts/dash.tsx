import React, { useState } from 'react'
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts'

interface Token {
  id: number
  name: string
  totalSupply: number
  circulatingSupply: number
  price: number
}

interface TokenPrice {
  date: string
  price: number
}

const tokensData: Token[] = [
  { id: 1, name: 'CHOGTokenMintERC20Token', totalSupply: 1000000, circulatingSupply: 750000, price: 0.05 },
  { id: 2, name: 'MySecondToken', totalSupply: 500000, circulatingSupply: 300000, price: 0.12 },
  { id: 3, name: 'ThirdERC20Token', totalSupply: 2000000, circulatingSupply: 1500000, price: 0.03 },
  { id: 4, name: 'FourthToken', totalSupply: 300000, circulatingSupply: 250000, price: 0.25 },
]

const tokenPriceData: Record<number, TokenPrice[]> = {
  1: [
    { date: '2024-01', price: 0.03 },
    { date: '2024-02', price: 0.04 },
    { date: '2024-03', price: 0.05 },
  ],
  2: [
    { date: '2024-01', price: 0.08 },
    { date: '2024-02', price: 0.1 },
    { date: '2024-03', price: 0.12 },
  ],
}

const Dashboard: React.FC = () => {
  const [view, setView] = useState<'tokenOverview' | 'tokenDetails'>('tokenOverview')
  const [selectedToken, setSelectedToken] = useState<Token | null>(null)

  const handleTokenClick = (token: Token) => {
    setSelectedToken(token)
    setView('tokenDetails')
  }

  const handleBackClick = () => {
    setView('tokenOverview')
    setSelectedToken(null)
  }

  const renderTokenOverview = () => (
    <div className='p-4'>
      <h2 className='text-2xl font-bold mb-4'>Token Overview</h2>
      <table className='min-w-full divide-y divide-gray-200'>
        <thead className='bg-gray-50'>
          <tr>
            <th className='px-6 py-3 text-left'>Token Name</th>
            <th className='px-6 py-3 text-left'>Total Supply</th>
            <th className='px-6 py-3 text-left'>Circulating Supply</th>
            <th className='px-6 py-3 text-left'>Price</th>
          </tr>
        </thead>
        <tbody>
          {tokensData.map((token) => (
            <tr key={token.id} className='cursor-pointer' onClick={() => handleTokenClick(token)}>
              <td className='px-6 py-4'>{token.name}</td>
              <td className='px-6 py-4'>{token.totalSupply}</td>
              <td className='px-6 py-4'>{token.circulatingSupply}</td>
              <td className='px-6 py-4'>${token.price.toFixed(2)}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )

  const renderTokenDetails = () => (
    <div className='p-4'>
      <button onClick={handleBackClick} className='mb-4 px-4 py-2 bg-gray-200 rounded'>
        Back
      </button>
      <h2 className='text-2xl font-bold mb-4'>{selectedToken?.name} Details</h2>
      {selectedToken && (
        <ResponsiveContainer width='100%' height={300}>
          <LineChart data={tokenPriceData[selectedToken.id]}>
            <CartesianGrid strokeDasharray='3 3' />
            <XAxis dataKey='date' />
            <YAxis />
            <Tooltip />
            <Legend />
            <Line type='monotone' dataKey='price' stroke='#8884d8' />
          </LineChart>
        </ResponsiveContainer>
      )}
    </div>
  )

  return (
    <div className='container mx-auto p-4'>
      {view === 'tokenOverview' && renderTokenOverview()}
      {view === 'tokenDetails' && renderTokenDetails()}
    </div>
  )
}

export default Dashboard
