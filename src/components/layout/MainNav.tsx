'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { cn } from '@/lib/utils'

interface NavItem {
  title: string
  url: string
}

interface MainNavProps {
  items?: NavItem[]
}

const defaultNavItems: NavItem[] = [
  { title: 'Beranda', url: '/' },
  { title: 'Berita', url: '/category/berita' },
  { title: 'Politik', url: '/category/politik' },
  { title: 'Olahraga', url: '/category/olahraga' },
  { title: 'Hiburan', url: '/category/hiburan' },
  { title: 'Otomotif', url: '/category/otomotif' },
  { title: 'Budaya', url: '/category/budaya' },
]

export default function MainNav({ items = defaultNavItems }: MainNavProps) {
  const pathname = usePathname()

  return (
    <nav className="hidden md:block bg-red-600 sticky top-0 z-50 shadow-md">
      <div className="container">
        <div className="flex items-center">
          {/* Navigation Items */}
          <ul className="flex items-center overflow-x-auto scrollbar-hide">
            {items.map((item) => {
              const isActive = pathname === item.url ||
                (item.url !== '/' && pathname.startsWith(item.url))

              return (
                <li key={item.url}>
                  <Link
                    href={item.url}
                    className={cn(
                      'block px-4 py-3 text-sm font-medium whitespace-nowrap transition-colors',
                      isActive
                        ? 'bg-red-700 text-white'
                        : 'text-red-100 hover:bg-red-700 hover:text-white'
                    )}
                  >
                    {item.title}
                  </Link>
                </li>
              )
            })}
          </ul>

          {/* Mobile Search Toggle */}
          <button className="md:hidden ml-auto p-3 text-red-100 hover:text-white">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              className="h-5 w-5"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                strokeWidth={2}
                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
              />
            </svg>
          </button>
        </div>
      </div>
    </nav>
  )
}
