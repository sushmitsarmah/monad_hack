import { CardList } from '@/components/CardList'
import { SITE_DESCRIPTION, SITE_NAME } from '@/utils/site'
import { EXAMPLE_ITEMS } from './examples/examples'

import TokenApprovalsDashboard from '@/charts'

export default function Home() {
  return (
    <>
      <TokenApprovalsDashboard />
    </>
  )
}
