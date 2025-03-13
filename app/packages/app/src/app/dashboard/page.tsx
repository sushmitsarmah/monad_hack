'use client'

import React, { useState } from 'react'
import Link from 'next/link'
import Image from 'next/image'

interface TokenData {
  id: string
  symbol: string
  name: string
  contract: string
  totalHolders: string
  totalTransfers: string
  totalSupply: string
  logoUrl: string
}

export default function DashboardPage() {
  // Token data as specified
  const tokens: TokenData[] = [
    {
      id: 'chog',
      symbol: 'CHOG',
      name: 'Chog',
      contract: '0xE0590015A873bF326bd645c3E1266d4db41C4E6B',
      totalHolders: '1,594,218',
      totalTransfers: '6,287,034',
      totalSupply: '100,000,000',
      logoUrl: 'https://imagedelivery.net/tWwhAahBw7afBzFUrX5mYQ/5d1206c2-042c-4edc-9f8b-dcef2e9e8f00/public',
    },
    {
      id: 'dak',
      symbol: 'DAK',
      name: 'Molandak',
      contract: '0x0F0BDEbF0F83cD1EE3974779Bcb7315f9808c714',
      totalHolders: '1,642,201',
      totalTransfers: '5,917,429',
      totalSupply: '10,000,000',
      logoUrl: 'https://imagedelivery.net/tWwhAahBw7afBzFUrX5mYQ/27759359-9374-4995-341c-b2636a432800/public',
    },
    {
      id: 'weth',
      symbol: 'WETH',
      name: 'Wrapped Ethereum',
      contract: '0xB5a30b0FDc5EA94A52fDc42e3E9760Cb8449Fb37',
      totalHolders: '315,614',
      totalTransfers: '2,729,626',
      totalSupply: '32,999.98727061',
      logoUrl: 'https://imagedelivery.net/cBNDGgkrsEA-b_ixIp9SkQ/weth.jpg/public',
    },
    {
      id: 'yaki',
      symbol: 'YAKI',
      name: 'Moyaki',
      contract: '0xfe140e1dCe99Be9F4F15d657CD9b7BF622270C50',
      totalHolders: '1,595,570',
      totalTransfers: '5,038,835',
      totalSupply: '1,000,000,000',
      logoUrl: 'https://imagedelivery.net/tWwhAahBw7afBzFUrX5mYQ/6679b698-a845-412b-504b-23463a3e1900/public',
    },
  ]

  const [walletId, setWalletId] = useState<string>('')

  // Format contract address for display
  const formatAddress = (address: string): string => {
    return `${address.substring(0, 6)}...${address.substring(address.length - 4)}`
  }

  return (
    <main className='min-h-screen p-4'>
      <div className='max-w-7xl mx-auto'>
        <div className='flex flex-col justify-between items-center mb-8 gap-4'>
          <h1 className='text-3xl font-bold'>Token Dashboard</h1>
          <div className='flex flex-row gap-4 w-full items-center justify-between'>
            <div className='flex gap-2 w-3/4'>
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
            <div className='flex gap-4 w-1/4 items-center justify-end'>
              <Link
                href='/dashboard/approvals'
                className='px-4 py-2 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 transition duration-300'>
                Approvals
              </Link>
              <Link
                href='/dashboard/transfers'
                className='px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition duration-300'>
                Transfers
              </Link>
            </div>
          </div>
        </div>

        <div className='bg-white rounded-lg shadow overflow-hidden'>
          <div className='overflow-x-auto'>
            <table className='min-w-full divide-y divide-gray-200'>
              <thead className='bg-gray-100'>
                <tr>
                  <th scope='col' className='px-6 py-3 text-left text-sm font-medium text-gray-700'>
                    Token
                  </th>
                  <th scope='col' className='px-6 py-3 text-left text-sm font-medium text-gray-700'>
                    Contract
                  </th>
                  <th scope='col' className='px-6 py-3 text-right text-sm font-medium text-gray-700'>
                    Holders
                  </th>
                  <th scope='col' className='px-6 py-3 text-right text-sm font-medium text-gray-700'>
                    Transfers
                  </th>
                  <th scope='col' className='px-6 py-3 text-right text-sm font-medium text-gray-700'>
                    Supply
                  </th>
                  <th scope='col' className='px-6 py-3 text-right text-sm font-medium text-gray-700'>
                    Actions
                  </th>
                </tr>
              </thead>
              <tbody className='bg-white divide-y divide-gray-200'>
                {tokens.map((token) => (
                  <tr key={token.id} className='hover:bg-gray-50'>
                    <td className='px-6 py-4 whitespace-nowrap'>
                      <div className='flex items-center space-x-3'>
                        <Image
                          width={50}
                          height={50}
                          src={token.logoUrl}
                          alt={token.name}
                          className='w-10 h-10 rounded-full'
                          onError={(e) => {
                            // Fallback to placeholder if image fails to load
                            ;(e.target as HTMLImageElement).src = '/api/placeholder/40/40'
                          }}
                        />
                        <div>
                          <div className='font-medium'>{token.name}</div>
                          <div className='text-sm text-gray-500'>{token.symbol}</div>
                        </div>
                      </div>
                    </td>
                    <td className='px-6 py-4 whitespace-nowrap'>
                      <div className='text-sm text-gray-900'>{formatAddress(token.contract)}</div>
                      <Link href={`https://testnet.monadexplorer.com/token/${token.contract}`} target='_blank'>
                        <div className='text-xs text-gray-500 hover:text-blue-500 cursor-pointer'>
                          View on MonadScan
                        </div>
                      </Link>
                    </td>
                    <td className='px-6 py-4 whitespace-nowrap text-right text-sm font-medium'>{token.totalHolders}</td>
                    <td className='px-6 py-4 whitespace-nowrap text-right text-sm font-medium'>
                      {token.totalTransfers}
                    </td>
                    <td className='px-6 py-4 whitespace-nowrap text-right text-sm font-medium'>{token.totalSupply}</td>
                    <td className='px-6 py-4 whitespace-nowrap text-right text-sm font-medium space-x-2'>
                      <Link
                        href={`/dashboard/approvals/token/${token.id}`}
                        className='inline-block px-3 py-1 bg-blue-100 text-blue-700 rounded hover:bg-blue-200 transition duration-300'>
                        Approvals
                      </Link>
                      <Link
                        href={`/dashboard/transfers/token/${token.id}`}
                        className='inline-block px-3 py-1 bg-purple-100 text-purple-700 rounded hover:bg-purple-200 transition duration-300'>
                        Transfers
                      </Link>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>

        <div className='mt-8 grid grid-cols-1 md:grid-cols-2 gap-6'>
          <div className='bg-white p-6 rounded-lg shadow'>
            <h2 className='text-xl font-semibold mb-4'>Network Overview</h2>
            <div className='space-y-2'>
              <div className='flex justify-between'>
                <span className='text-gray-600'>Total Tokens:</span>
                <span className='font-medium'>4</span>
              </div>
              <div className='flex justify-between'>
                <span className='text-gray-600'>Total Transfers:</span>
                <span className='font-medium'>40.78M</span>
              </div>
              <div className='flex justify-between'>
                <span className='text-gray-600'>Total Holders:</span>
                <span className='font-medium'>8.25M</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  )
}
