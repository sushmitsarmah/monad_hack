'use client'

import TokenTransfersDashboard from '@/charts/token_transfers'

interface Props {
  params: {
    id: string
  }
}

export default function TokenApprovalsPage({ params }: Props) {
  return (
    <main className='min-h-screen p-4'>
      <TokenTransfersDashboard token={params.id} />
    </main>
  )
}
