import React from 'react'
import { LinkComponent } from './LinkComponent'
import { SITE_EMOJI } from '@/utils/site'
import { Connect } from './Connect'
import { NotificationsDrawer } from './NotificationsDrawer'
import Image from 'next/image'

export function Header() {
  return (
    <header className='navbar flex justify-between items-center p-4 pt-2 border-b border-gray-200'>
      <div className='flex items-center gap-2'>
        <LinkComponent href='/'>
          <div className='flex items-center gap-2'>
            <Image src='/img1.png' alt='TokenScope' width={32} height={32} />
            <Image src='/img2.png' alt='TokenScope' width={32} height={32} />
            <h1 className='text-xl font-bold'>TokenScope</h1>
          </div>
        </LinkComponent>
      </div>

      <div className='flex gap-6'>
        <nav className='hidden md:flex items-center gap-6'>
          <LinkComponent href='/dashboard' className='text-gray-200 hover:text-indigo-600 transition'>
            Dashboard
          </LinkComponent>
          <LinkComponent href='/dashboard/approvals' className='text-gray-200 hover:text-indigo-600 transition'>
            Approvals
          </LinkComponent>
          <LinkComponent href='/dashboard/transfers' className='text-gray-200 hover:text-indigo-600 transition'>
            Transfers
          </LinkComponent>
        </nav>

        <div className='flex items-center gap-2'>
          <Connect />
          <NotificationsDrawer />
        </div>
      </div>

      {/* Mobile menu button - only shown on small screens */}
      <div className='md:hidden'>
        <button className='px-2 py-1 text-gray-500 hover:text-gray-700 focus:outline-none'>
          <svg
            xmlns='http://www.w3.org/2000/svg'
            className='h-6 w-6'
            fill='none'
            viewBox='0 0 24 24'
            stroke='currentColor'>
            <path strokeLinecap='round' strokeLinejoin='round' strokeWidth={2} d='M4 6h16M4 12h16M4 18h16' />
          </svg>
        </button>
      </div>
    </header>
  )
}
