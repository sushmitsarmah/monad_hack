'use client'

import WalletTransactionsDashboard from '@/charts/wallet'

interface WalletPageProps {
  params: {
    walletId: string
  }
}

export default function WalletPage({ params }: WalletPageProps) {
  return (
    <div>
      <WalletTransactionsDashboard walletId={params.walletId} />
    </div>
  )
}
