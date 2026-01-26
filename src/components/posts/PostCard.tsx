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

  // Featured variant - Hero-style card with overlay
  if (variant === 'featured') {
    return (
      <article className="post-card group relative bg-gray-900 rounded-xl overflow-hidden shadow-lg hover:shadow-2xl transition-all duration-500">
        <Link href={`/${slug}`} className="block">
          {/* Image */}
          <div className="aspect-[16/9] md:aspect-[21/9] relative">
            {featuredImage ? (
              <Image
                src={featuredImage}
                alt={title}
                fill
                className="object-cover group-hover:scale-105 transition-transform duration-700 ease-out"
                priority
              />
            ) : (
              <div className="absolute inset-0 bg-gradient-to-br from-primary-800 to-primary-900 flex items-center justify-center">
                <svg className="w-20 h-20 text-primary-600/50" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                </svg>
              </div>
            )}

            {/* Gradient Overlay */}
            <div className="absolute inset-0 bg-gradient-to-t from-black/90 via-black/50 to-transparent" />

            {/* Badges */}
            <div className="absolute top-4 left-4 flex gap-2">
              {isBreaking && (
                <span className="px-3 py-1 bg-red-600 text-white text-xs font-bold rounded-full animate-pulse">
                  BREAKING
                </span>
              )}
              {isTrending && (
                <span className="px-3 py-1 bg-accent-500 text-white text-xs font-bold rounded-full flex items-center gap-1">
                  <svg className="w-3 h-3" fill="currentColor" viewBox="0 0 20 20">
                    <path fillRule="evenodd" d="M12.395 2.553a1 1 0 00-1.45-.385c-.345.23-.614.558-.822.88-.214.33-.403.713-.57 1.116-.334.804-.614 1.768-.84 2.734a31.365 31.365 0 00-.613 3.58 2.64 2.64 0 01-.945-1.067c-.328-.68-.398-1.534-.398-2.654A1 1 0 005.05 6.05 6.981 6.981 0 003 11a7 7 0 1011.95-4.95c-.592-.591-.98-.985-1.348-1.467-.363-.476-.724-1.063-1.207-2.03zM12.12 15.12A3 3 0 017 13s.879.5 2.5.5c0-1 .5-4 1.25-4.5.5 1 .786 1.293 1.371 1.879A2.99 2.99 0 0113 13a2.99 2.99 0 01-.879 2.121z" clipRule="evenodd" />
                  </svg>
                  TRENDING
                </span>
              )}
            </div>

            {/* Content */}
            <div className="absolute bottom-0 left-0 right-0 p-6 md:p-8">
              {category && (
                <Link
                  href={`/category/${category.slug}`}
                  className="category-badge mb-3 inline-block hover:bg-primary-700"
                  onClick={(e) => e.stopPropagation()}
                >
                  {category.name}
                </Link>
              )}
              <h2 className="text-xl md:text-3xl font-bold text-white mb-3 line-clamp-2 group-hover:text-primary-200 transition-colors duration-300">
                {title}
              </h2>
              {excerpt && (
                <p className="text-gray-300 text-sm md:text-base line-clamp-2 mb-4 max-w-3xl">
                  {excerpt}
                </p>
              )}
              <div className="flex flex-wrap items-center gap-4 text-sm text-gray-400">
                {publishedAt && (
                  <span className="flex items-center gap-1">
                    <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                    </svg>
                    {formatDate(new Date(publishedAt))}
                  </span>
                )}
                <span className="flex items-center gap-1">
                  <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                  {readingTime} menit baca
                </span>
                {viewCount > 0 && (
                  <span className="flex items-center gap-1">
                    <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                    </svg>
                    {viewCount.toLocaleString('id-ID')} views
                  </span>
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
            className="sm:w-56 h-40 sm:h-auto flex-shrink-0 relative bg-gradient-to-br from-gray-100 to-gray-200 overflow-hidden"
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
          <div className="flex-1 p-5 border-l-0 sm:border-l-4 border-transparent group-hover:border-primary-500 transition-colors duration-300">
            <div className="flex items-center gap-2 mb-2">
              {category && (
                <Link href={`/category/${category.slug}`} className="category-badge text-xs">
                  {category.name}
                </Link>
              )}
              {publishedAt && (
                <span className="text-xs text-gray-500">
                  {formatRelativeTime(new Date(publishedAt))}
                </span>
              )}
            </div>

            <h3 className="font-bold text-gray-900 mb-2 line-clamp-2 group-hover:text-primary-600 transition-colors duration-200">
              <Link href={`/${slug}`}>{title}</Link>
            </h3>

            {excerpt && (
              <p className="text-sm text-gray-600 line-clamp-2 mb-3">
                {excerpt}
              </p>
            )}

            <div className="flex items-center gap-4 text-xs text-gray-500">
              <span className="flex items-center gap-1">
                <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
                {readingTime} menit
              </span>
              {viewCount > 0 && (
                <span className="flex items-center gap-1">
                  <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                  </svg>
                  {viewCount.toLocaleString('id-ID')}
                </span>
              )}
              <Link
                href={`/${slug}`}
                className="ml-auto text-primary-600 hover:text-primary-700 font-medium flex items-center gap-1 group/link"
              >
                Baca
                <svg className="w-4 h-4 group-hover/link:translate-x-1 transition-transform" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                </svg>
              </Link>
            </div>
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
          <div className="flex items-center gap-2 mt-1">
            {publishedAt && (
              <p className="text-xs text-gray-500">
                {formatRelativeTime(new Date(publishedAt))}
              </p>
            )}
            {viewCount > 0 && (
              <span className="text-xs text-gray-400 flex items-center gap-0.5">
                <svg className="w-3 h-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                </svg>
                {viewCount.toLocaleString('id-ID')}
              </span>
            )}
          </div>
        </div>
      </article>
    )
  }

  // Default card (vertical) - Standard blog card
  return (
    <article className="post-card group bg-white rounded-xl border border-gray-200 overflow-hidden hover:shadow-xl hover:border-transparent hover:-translate-y-1 transition-all duration-300">
      {/* Thumbnail */}
      <Link href={`/${slug}`} className="block aspect-[16/10] relative bg-gradient-to-br from-gray-100 to-gray-200 overflow-hidden">
        {featuredImage ? (
          <Image
            src={featuredImage}
            alt={title}
            fill
            className="object-cover group-hover:scale-105 transition-transform duration-500"
          />
        ) : (
          <div className="absolute inset-0 flex items-center justify-center">
            <svg className="w-14 h-14 text-gray-300" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
            </svg>
          </div>
        )}

        {/* Category badge overlay */}
        {category && (
          <div className="absolute top-3 left-3">
            <Link
              href={`/category/${category.slug}`}
              className="category-badge shadow-md"
              onClick={(e) => e.stopPropagation()}
            >
              {category.name}
            </Link>
          </div>
        )}
      </Link>

      {/* Content */}
      <div className="p-5">
        <h3 className="font-bold text-gray-900 mb-2 line-clamp-2 group-hover:text-primary-600 transition-colors duration-200">
          <Link href={`/${slug}`}>{title}</Link>
        </h3>

        {excerpt && (
          <p className="text-sm text-gray-600 line-clamp-2 mb-4">
            {excerpt}
          </p>
        )}

        <div className="flex items-center justify-between text-xs text-gray-500 pt-3 border-t border-gray-100">
          <div className="flex items-center gap-3">
            {publishedAt && (
              <span>{formatDate(new Date(publishedAt))}</span>
            )}
            <span className="flex items-center gap-1">
              <svg className="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
              {readingTime} mnt
            </span>
          </div>
          {viewCount > 0 && (
            <span className="flex items-center gap-1">
              <svg className="w-3.5 h-3.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
              {viewCount.toLocaleString('id-ID')}
            </span>
          )}
        </div>
      </div>
    </article>
  )
}
