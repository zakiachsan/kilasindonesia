'use client'

import Link from 'next/link'
import Image from 'next/image'
import { formatDate, formatRelativeTime } from '@/lib/utils'
import { cn } from '@/lib/utils'

export interface PostCardProps {
  id: string
  title: string
  slug: string
  excerpt?: string | null
  content?: string
  featuredImage?: string | null
  category?: {
    name: string
    slug: string
  }
  author?: {
    name: string
  }
  publishedAt?: Date | string | null
  viewCount?: number
  variant?: 'default' | 'horizontal' | 'compact' | 'featured'
  index?: number // For numbered display in compact variant
  isTrending?: boolean
  isBreaking?: boolean
}

// Calculate reading time from content
function calculateReadingTime(content?: string): number {
  if (!content) return 2
  const wordCount = content.replace(/<[^>]*>/g, '').split(/\s+/).length
  return Math.max(1, Math.ceil(wordCount / 200))
}

export default function PostCard({
  title,
  slug,
  excerpt,
  content,
  featuredImage,
  category,
  author,
  publishedAt,
  viewCount = 0,
  variant = 'default',
  index,
  isTrending = false,
  isBreaking = false,
}: PostCardProps) {
  const readingTime = calculateReadingTime(content || excerpt || '')

  // Featured variant - Hero-style card with overlay (like Detik.com)
  if (variant === 'featured') {
    return (
      <article className="post-card group relative bg-gray-900 rounded-xl overflow-hidden shadow-lg hover:shadow-2xl transition-all duration-500">
        <Link href={`/${slug}`} className="block">
          {/* Image */}
          <div className="aspect-[4/3] sm:aspect-[16/10] lg:aspect-[16/9] relative">
            {featuredImage ? (
              <Image
                src={featuredImage}
                alt={title}
                fill
                className="object-cover group-hover:scale-105 transition-transform duration-700 ease-out"
                priority
              />
            ) : (
              <div className="absolute inset-0 bg-gradient-to-br from-primary-700 to-primary-900 flex items-center justify-center">
                <svg className="w-20 h-20 text-primary-500/50" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                </svg>
              </div>
            )}

            {/* Gradient Overlay */}
            <div className="absolute inset-0 bg-gradient-to-t from-black/90 via-black/40 to-transparent" />

            {/* Content - Bottom overlay like Detik */}
            <div className="absolute bottom-0 left-0 right-0 p-4 sm:p-6">
              <h2 className="text-lg sm:text-xl md:text-2xl font-bold text-white mb-2 line-clamp-3 sm:line-clamp-2 group-hover:text-blue-200 transition-colors duration-300">
                {title}
              </h2>
              <div className="flex items-center gap-2 text-sm text-gray-300">
                {category && (
                  <span className="text-white font-medium">{category.name}</span>
                )}
                {category && publishedAt && <span>|</span>}
                {publishedAt && (
                  <span>{formatRelativeTime(new Date(publishedAt))}</span>
                )}
              </div>
            </div>
          </div>
        </Link>
      </article>
    )
  }

  // Horizontal variant - Side by side layout
  if (variant === 'horizontal') {
    return (
      <article className="post-card group bg-white rounded-xl border border-gray-200 overflow-hidden hover:shadow-lg hover:border-primary-200 transition-all duration-300">
        <div className="flex flex-col sm:flex-row">
          {/* Thumbnail */}
          <Link
            href={`/${slug}`}
            className="sm:w-48 h-36 sm:h-auto flex-shrink-0 relative bg-gradient-to-br from-gray-100 to-gray-200 overflow-hidden"
          >
            {featuredImage ? (
              <Image
                src={featuredImage}
                alt={title}
                fill
                className="object-cover group-hover:scale-105 transition-transform duration-500"
              />
            ) : (
              <div className="absolute inset-0 flex items-center justify-center">
                <svg className="w-12 h-12 text-gray-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                </svg>
              </div>
            )}
          </Link>

          {/* Content */}
          <div className="flex-1 p-4">
            {category && (
              <Link href={`/category/${category.slug}`} className="text-primary-600 text-sm font-medium hover:text-primary-700">
                {category.name}
              </Link>
            )}

            <h3 className="font-bold text-gray-900 mt-1 mb-2 line-clamp-2 group-hover:text-primary-600 transition-colors duration-200">
              <Link href={`/${slug}`}>{title}</Link>
            </h3>

            {excerpt && (
              <p className="text-sm text-gray-600 line-clamp-2 mb-2">
                {excerpt}
              </p>
            )}

            {publishedAt && (
              <span className="text-xs text-gray-500">
                {formatRelativeTime(new Date(publishedAt))}
              </span>
            )}
          </div>
        </div>
      </article>
    )
  }

  // Compact variant - Small card for sidebar/lists
  if (variant === 'compact') {
    return (
      <article className="group flex gap-3">
        {/* Number indicator if index is provided */}
        {typeof index === 'number' && (
          <div className="flex-shrink-0 w-8 h-8 bg-primary-600 text-white rounded-lg flex items-center justify-center font-bold text-sm group-hover:bg-primary-700 transition-colors">
            {index + 1}
          </div>
        )}

        {/* Small Thumbnail */}
        <Link
          href={`/${slug}`}
          className={cn(
            'flex-shrink-0 relative bg-gradient-to-br from-gray-100 to-gray-200 rounded-lg overflow-hidden',
            typeof index === 'number' ? 'w-16 h-16' : 'w-20 h-20'
          )}
        >
          {featuredImage ? (
            <Image
              src={featuredImage}
              alt={title}
              fill
              className="object-cover group-hover:scale-110 transition-transform duration-300"
            />
          ) : (
            <div className="absolute inset-0 flex items-center justify-center">
              <svg className="w-6 h-6 text-gray-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
              </svg>
            </div>
          )}
        </Link>

        <div className="flex-1 min-w-0 py-0.5">
          <h4 className="text-sm font-semibold text-gray-900 line-clamp-2 group-hover:text-primary-600 transition-colors duration-200">
            <Link href={`/${slug}`}>{title}</Link>
          </h4>
          {publishedAt && (
            <p className="text-xs text-gray-500 mt-1">
              {formatRelativeTime(new Date(publishedAt))}
            </p>
          )}
        </div>
      </article>
    )
  }

  // Default card (vertical) - Like Detik.com style
  return (
    <article className="post-card group">
      {/* Thumbnail */}
      <Link href={`/${slug}`} className="block aspect-[4/3] relative bg-gradient-to-br from-gray-100 to-gray-200 rounded-lg overflow-hidden mb-2">
        {featuredImage ? (
          <Image
            src={featuredImage}
            alt={title}
            fill
            className="object-cover group-hover:scale-105 transition-transform duration-500"
          />
        ) : (
          <div className="absolute inset-0 flex items-center justify-center">
            <svg className="w-10 h-10 sm:w-14 sm:h-14 text-gray-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
            </svg>
          </div>
        )}
      </Link>

      {/* Content */}
      <div>
        {category && (
          <Link href={`/category/${category.slug}`} className="text-primary-600 text-xs sm:text-sm font-medium hover:text-primary-700">
            {category.name}
          </Link>
        )}

        <h3 className="text-sm sm:text-base font-bold text-gray-900 mt-0.5 sm:mt-1 line-clamp-2 sm:line-clamp-3 group-hover:text-primary-600 transition-colors duration-200">
          <Link href={`/${slug}`}>{title}</Link>
        </h3>
      </div>
    </article>
  )
}
