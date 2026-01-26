'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { useState, useEffect } from 'react'
import { cn } from '@/lib/utils'

interface NavItem {
  title: string
  url: string
  icon?: 'home'
}

interface MainNavProps {
  items?: NavItem[]
}

const defaultNavItems: NavItem[] = [
  { title: 'Home', url: '/', icon: 'home' },
  { title: 'Nasional', url: '/category/nasional' },
  { title: 'Madrasah', url: '/category/madrasah' },
  { title: 'Pesantren', url: '/category/pesantren' },
  { title: 'Perguruan Tinggi', url: '/category/perguruan-tinggi' },
  { title: 'Opini', url: '/category/opini' },
  { title: 'Tokoh', url: '/category/tokoh' },
]

export default function MainNav({ items = defaultNavItems }: MainNavProps) {
  const pathname = usePathname()
  const [isScrolled, setIsScrolled] = useState(false)
  const [searchFocused, setSearchFocused] = useState(false)

  // Detect scroll for glassmorphism effect
  useEffect(() => {
    const handleScroll = () => {
      setIsScrolled(window.scrollY > 10)
    }

    window.addEventListener('scroll', handleScroll, { passive: true })
    handleScroll() // Check initial state

    return () => {
      window.removeEventListener('scroll', handleScroll)
    }
  }, [])

  return (
    <nav
      className={cn(
        'sticky top-0 z-50 transition-all duration-300',
        isScrolled
          ? 'glass shadow-lg'
          : 'bg-primary-800 shadow-md'
      )}
    >
      <div className="container">
        <div className="flex items-center justify-between gap-4">
          {/* Navigation Items */}
          <ul className="flex items-center overflow-x-auto scrollbar-hide flex-1 min-w-0">
            {items.map((item) => {
              const isActive = pathname === item.url ||
                (item.url !== '/' && pathname.startsWith(item.url))

              return (
                <li key={item.url}>
                  <Link
                    href={item.url}
                    className={cn(
                      'nav-link group relative flex items-center gap-1.5 px-4 py-3.5 text-sm font-medium whitespace-nowrap transition-all duration-200',
                      isActive
                        ? isScrolled
                          ? 'text-primary-700'
                          : 'text-white bg-white/10'
                        : isScrolled
                          ? 'text-gray-700 hover:text-primary-600'
                          : 'text-primary-100 hover:text-white hover:bg-white/10'
                    )}
                  >
                    {item.icon === 'home' && (
                      <svg className="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z" />
                      </svg>
                    )}
                    {item.title}
                    {/* Active/Hover indicator line */}
                    <span
                      className={cn(
                        'absolute bottom-0 left-1/2 -translate-x-1/2 h-0.5 rounded-full transition-all duration-300',
                        isActive
                          ? isScrolled
                            ? 'w-8 bg-primary-600'
                            : 'w-8 bg-accent-500'
                          : 'w-0 group-hover:w-6',
                        isScrolled
                          ? 'group-hover:bg-primary-400'
                          : 'group-hover:bg-white/70'
                      )}
                    />
                  </Link>
                </li>
              )
            })}
          </ul>

          {/* Search */}
          <div className="hidden md:flex items-center">
            <form action="/search" method="GET" className="relative flex">
              <div
                className={cn(
                  'flex items-center rounded-full overflow-hidden transition-all duration-300',
                  searchFocused
                    ? 'ring-2 ring-accent-500 shadow-lg'
                    : '',
                  isScrolled
                    ? 'bg-gray-100 border border-gray-200'
                    : 'bg-white/10 border border-white/20'
                )}
              >
                <input
                  type="text"
                  name="q"
                  placeholder="Cari berita..."
                  onFocus={() => setSearchFocused(true)}
                  onBlur={() => setSearchFocused(false)}
                  className={cn(
                    'w-36 focus:w-48 px-4 py-2 text-sm bg-transparent border-0 outline-none transition-all duration-300',
                    isScrolled
                      ? 'text-gray-900 placeholder-gray-500'
                      : 'text-white placeholder-white/60'
                  )}
                />
                <button
                  type="submit"
                  className={cn(
                    'px-3 py-2 transition-colors duration-200',
                    isScrolled
                      ? 'text-gray-500 hover:text-primary-600'
                      : 'text-white/70 hover:text-white'
                  )}
                >
                  <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2}>
                    <path strokeLinecap="round" strokeLinejoin="round" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                  </svg>
                </button>
              </div>
            </form>
          </div>

          {/* Mobile Search Toggle */}
          <Link
            href="/search"
            className={cn(
              'md:hidden p-3 rounded-lg transition-colors',
              isScrolled
                ? 'text-gray-600 hover:text-primary-600 hover:bg-gray-100'
                : 'text-primary-100 hover:text-white hover:bg-white/10'
            )}
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              className="h-5 w-5"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
              strokeWidth={2}
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
              />
            </svg>
          </Link>
        </div>
      </div>
    </nav>
  )
}
