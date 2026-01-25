import { ReactNode } from 'react'

interface SidebarProps {
  children: ReactNode
}

export default function Sidebar({ children }: SidebarProps) {
  return (
    <aside className="w-full lg:w-80 flex-shrink-0">
      <div className="sidebar-sticky space-y-6">
        {children}
      </div>
    </aside>
  )
}

// Sidebar Widget Container
interface SidebarWidgetProps {
  title: string
  children: ReactNode
  className?: string
}

export function SidebarWidget({ title, children, className = '' }: SidebarWidgetProps) {
  return (
    <div className={`bg-white border border-gray-200 rounded-lg overflow-hidden ${className}`}>
      <div className="bg-red-600 px-4 py-3">
        <h3 className="text-white font-semibold text-sm uppercase tracking-wide">
          {title}
        </h3>
      </div>
      <div className="p-4">
        {children}
      </div>
    </div>
  )
}

// Sidebar Ad Placeholder
interface SidebarAdProps {
  width?: number
  height?: number
}

export function SidebarAd({ width = 300, height = 250 }: SidebarAdProps) {
  return (
    <div
      className="bg-gray-100 border border-gray-200 rounded-lg flex items-center justify-center text-gray-400 text-sm"
      style={{ width: '100%', height }}
    >
      <div className="text-center">
        <svg
          className="w-8 h-8 mx-auto mb-2 opacity-50"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth={1.5}
            d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"
          />
        </svg>
        <p>Iklan {width}x{height}</p>
      </div>
    </div>
  )
}
