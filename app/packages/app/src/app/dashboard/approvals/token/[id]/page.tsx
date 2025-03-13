'use client'

import TokenApprovalsDashboard from '@/charts'

interface Props {
  params: {
    id: string
  }
}

export default function TokenApprovalsPage({ params }: Props) {
  return (
    <main className='min-h-screen p-4'>
      <TokenApprovalsDashboard token={params.id} />
    </main>
  )
}
