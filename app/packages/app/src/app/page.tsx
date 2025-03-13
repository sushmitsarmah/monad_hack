'use client'

import Link from 'next/link'
import Image from 'next/image'
import { motion } from 'framer-motion'

const LandingPage = () => {
  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.8, ease: 'easeOut' }}>
      {/* Background Image */}
      <div className='absolute inset-0 z-[-2] h-screen'>
        <Image
          src='/background.jpeg' // Replace with your image path
          alt='Background'
          fill
          style={{ objectFit: 'cover', opacity: 0.3 }} // Or 'contain' if you prefer
        />
      </div>

      {/* Subtle Background Animation */}
      {/* <motion.div
        style={{ transformOrigin: 'center' }}
        animate={{
          scale: [1, 1.25, 1], // Slightly increased scale
          opacity: [0.7, 1, 0.7], // Increased opacity variation
        }}
        transition={{
          duration: 15,
          ease: 'easeInOut',
          repeat: Infinity,
          repeatType: 'reverse',
        }}
        className='absolute inset-0 bg-gradient-to-r from-indigo-400/40 via-purple-400/40 to-indigo-400/40 blur-2xl z-[-1]' // Lighter colors, more opacity, less blur
      /> */}

      {/* Hero Section */}
      <header className='w-full text-center py-20'>
        <motion.h1
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2, duration: 0.8, ease: 'easeOut' }}
          className='text-5xl font-bold text-blue-200'>
          TokenScope
        </motion.h1>
        <motion.p
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.4, duration: 0.8, ease: 'easeOut' }}
          className='text-lg mt-4 text-gray-400 max-w-xl mx-auto'>
          Track, Analyze, and Predict Your Crypto Assets in Real-Time
        </motion.p>
        <motion.div
          initial={{ opacity: 0, scale: 0.8 }}
          animate={{ opacity: 1, scale: 1 }}
          whileHover={{ scale: 1.05 }} // Added hover effect
          transition={{ type: 'spring', stiffness: 400, damping: 10 }} // Smooth hover transition
        >
          <Link href='/dashboard'>
            <button className='mt-6 px-6 py-3 bg-indigo-600 rounded-lg shadow-lg hover:bg-indigo-700 transition duration-300'>
              Get Started
            </button>
          </Link>
        </motion.div>
      </header>

      {/* Features Section  */}
      <section className='w-full grid grid-cols-1 md:grid-cols-3 gap-8 text-center p-10'>
        {[
          { title: 'Live Token Tracking', description: 'Get real-time data on your favorite tokens.' },
          { title: 'Historical Price Analysis', description: 'Analyze trends and make informed decisions.' },
          { title: 'Secure Wallet Insights', description: 'Monitor your holdings with privacy and security.' },
        ].map((feature, index) => (
          <motion.div
            key={index}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 1 + index * 0.2, duration: 0.8, ease: 'easeOut' }}
            whileHover={{ scale: 1.02, y: -2 }} // Subtle lift on hover
            className='bg-gray-800 p-8 rounded-lg shadow-md backdrop-blur-md hover:bg-gray-700 transition duration-300'>
            <h2 className='text-xl font-semibold text-indigo-400'>{feature.title}</h2>
            <p className='text-gray-400 mt-2'>{feature.description}</p>
          </motion.div>
        ))}
      </section>

      {/* Image Section */}
      <motion.section
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.8, duration: 0.8, ease: 'easeOut' }}
        className='flex flex-row gap-8 justify-center w-full text-center py-5'>
        <motion.div whileHover={{ scale: 1.05 }} transition={{ type: 'spring', stiffness: 300 }}>
          <Image src='/img1.png' alt='img1' width={150} height={150} className='rounded-lg shadow-md' />
        </motion.div>
        <motion.div whileHover={{ scale: 1.05 }} transition={{ type: 'spring', stiffness: 300 }}>
          <Image src='/img2.png' alt='img2' width={150} height={150} className='rounded-lg shadow-md' />
        </motion.div>
      </motion.section>

      {/* CTA Section with Hover Animation */}
    </motion.div>
  )
}

export default LandingPage
