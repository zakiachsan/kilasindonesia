'use client'

interface BannerAdProps {
  slot: 'top' | 'header' | 'content' | 'sidebar'
  width?: number
  height?: number
  className?: string
}

export default function BannerAd({ slot, width, height, className = '' }: BannerAdProps) {
  // Define default sizes based on slot
  const sizes = {
    top: { width: 728, height: 90 },
    header: { width: 970, height: 250 },
    content: { width: 728, height: 90 },
    sidebar: { width: 300, height: 250 },
  }

  const defaultSize = sizes[slot] || sizes.sidebar
  const w = width || defaultSize.width
  const h = height || defaultSize.height

  return (
    <div
      className={`flex items-center justify-center bg-gray-100 border border-gray-200 overflow-hidden ${className}`}
      style={{ minHeight: h }}
    >
      {/* Placeholder - replace with actual ad code */}
      <div className="text-center text-gray-400">
        <p className="text-xs">IKLAN</p>
        <p className="text-xs">{w} x {h}</p>
      </div>
    </div>
  )
}
