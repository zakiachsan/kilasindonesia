'use client'

import Link from 'next/link'

interface BreakingNews {
  id: string
  title: string
  slug: string
}

interface TopBarProps {
  breakingNews?: BreakingNews[]
}

export default function TopBar({ breakingNews = [] }: TopBarProps) {
  // Default breaking news if none provided
  const news = breakingNews.length > 0 ? breakingNews : [
    { id: '1', title: 'Selamat datang di Kilas Indonesia - Portal Berita Terkini', slug: '#' },
  ]

  return (
    <div className="bg-gray-900 text-white">
      <div className="container">
        <div className="flex items-center h-10">
          {/* Breaking News Label */}
          <div className="flex-shrink-0 flex items-center gap-2 pr-4 border-r border-gray-700">
            <span className="relative flex h-2 w-2">
              <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-red-400 opacity-75"></span>
              <span className="relative inline-flex rounded-full h-2 w-2 bg-red-500"></span>
            </span>
            <span className="text-xs font-semibold uppercase tracking-wide text-red-500">
              Breaking
            </span>
          </div>

          {/* Marquee */}
          <div className="flex-1 overflow-hidden ml-4">
            <div className="marquee">
              <div className="marquee-content">
                {[...news, ...news].map((item, index) => (
                  <Link
                    key={`${item.id}-${index}`}
                    href={item.slug === '#' ? '#' : `/${item.slug}`}
                    className="inline-block text-sm text-gray-300 hover:text-white transition-colors mr-12"
                  >
                    {item.title}
                    <span className="mx-4 text-gray-600">•</span>
                  </Link>
                ))}
              </div>
            </div>
          </div>

          {/* Date & Time */}
          <div className="hidden sm:flex items-center gap-4 pl-4 border-l border-gray-700 text-xs text-gray-400">
            <span>
              {new Date().toLocaleDateString('id-ID', {
                weekday: 'long',
                day: 'numeric',
                month: 'long',
                year: 'numeric',
              })}
            </span>
          </div>
        </div>
      </div>
    </div>
  )
}
