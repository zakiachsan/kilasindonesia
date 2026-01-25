import Link from 'next/link'
import Image from 'next/image'
import { formatDate, formatRelativeTime } from '@/lib/utils'

export interface PostCardProps {
  id: string
  title: string
  slug: string
  excerpt?: string | null
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
}

export default function PostCard({
  title,
  slug,
  excerpt,
  featuredImage,
  category,
  author,
  publishedAt,
  viewCount = 0,
  variant = 'default',
}: PostCardProps) {
  if (variant === 'featured') {
    return (
      <article className="post-card group relative bg-white rounded-lg overflow-hidden shadow-sm border border-gray-200">
        <Link href={`/${slug}`} className="block">
          {/* Image */}
          <div className="aspect-video relative bg-gradient-to-br from-gray-200 to-gray-300">
            {featuredImage ? (
              <Image
                src={featuredImage}
                alt={title}
                fill
                className="object-cover group-hover:scale-105 transition-transform duration-300"
              />
            ) : (
              <div className="absolute inset-0 flex items-center justify-center">
                <svg className="w-16 h-16 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                </svg>
              </div>
            )}
            {/* Overlay */}
            <div className="absolute inset-0 bg-gradient-to-t from-black/80 via-black/40 to-transparent" />
            {/* Content */}
            <div className="absolute bottom-0 left-0 right-0 p-6 text-white">
              {category && (
                <span className="category-badge mb-3 inline-block">
                  {category.name}
                </span>
              )}
              <h2 className="text-xl md:text-2xl font-bold mb-2 line-clamp-2 group-hover:text-red-300 transition-colors">
                {title}
              </h2>
              {excerpt && (
                <p className="text-gray-300 text-sm line-clamp-2 mb-3">
                  {excerpt}
                </p>
              )}
              <div className="flex items-center gap-4 text-xs text-gray-400">
                {publishedAt && <span>{formatDate(new Date(publishedAt))}</span>}
                {viewCount > 0 && <span>{viewCount.toLocaleString('id-ID')} views</span>}
              </div>
            </div>
          </div>
        </Link>
      </article>
    )
  }

  if (variant === 'horizontal') {
    return (
      <article className="post-card bg-white rounded-lg border border-gray-200 overflow-hidden">
        <div className="flex flex-col sm:flex-row">
          {/* Thumbnail */}
          <Link href={`/${slug}`} className="sm:w-48 h-32 sm:h-auto flex-shrink-0 relative bg-gradient-to-br from-gray-200 to-gray-300">
            {featuredImage ? (
              <Image
                src={featuredImage}
                alt={title}
                fill
                className="object-cover"
              />
            ) : (
              <div className="absolute inset-0 flex items-center justify-center">
                <svg className="w-10 h-10 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                </svg>
              </div>
            )}
          </Link>

          {/* Content */}
          <div className="flex-1 p-4">
            <div className="flex items-center gap-2 mb-2">
              {category && (
                <Link href={`/category/${category.slug}`} className="category-badge">
                  {category.name}
                </Link>
              )}
              {publishedAt && (
                <span className="text-xs text-gray-500">
                  {formatDate(new Date(publishedAt))}
                </span>
              )}
            </div>

            <h3 className="font-semibold text-gray-900 mb-2 line-clamp-2 hover:text-red-600 transition-colors">
              <Link href={`/${slug}`}>{title}</Link>
            </h3>

            {excerpt && (
              <p className="text-sm text-gray-600 line-clamp-2 mb-3">
                {excerpt}
              </p>
            )}

            <div className="flex items-center gap-4 text-xs text-gray-500">
              {author && <span>Oleh {author.name}</span>}
              {viewCount > 0 && (
                <span className="flex items-center gap-1">
                  <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                  </svg>
                  {viewCount.toLocaleString('id-ID')}
                </span>
              )}
            </div>
          </div>
        </div>
      </article>
    )
  }

  if (variant === 'compact') {
    return (
      <article className="flex gap-3">
        {/* Small Thumbnail */}
        <Link href={`/${slug}`} className="w-20 h-20 flex-shrink-0 relative bg-gradient-to-br from-gray-200 to-gray-300 rounded overflow-hidden">
          {featuredImage ? (
            <Image src={featuredImage} alt={title} fill className="object-cover" />
          ) : (
            <div className="absolute inset-0 flex items-center justify-center">
              <svg className="w-6 h-6 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
              </svg>
            </div>
          )}
        </Link>
        <div className="flex-1 min-w-0">
          <h4 className="text-sm font-medium text-gray-900 line-clamp-2 hover:text-red-600 transition-colors">
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

  // Default card (vertical)
  return (
    <article className="post-card bg-white rounded-lg border border-gray-200 overflow-hidden">
      {/* Thumbnail */}
      <Link href={`/${slug}`} className="block aspect-video relative bg-gradient-to-br from-gray-200 to-gray-300">
        {featuredImage ? (
          <Image src={featuredImage} alt={title} fill className="object-cover" />
        ) : (
          <div className="absolute inset-0 flex items-center justify-center">
            <svg className="w-12 h-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
            </svg>
          </div>
        )}
      </Link>

      {/* Content */}
      <div className="p-4">
        <div className="flex items-center gap-2 mb-2">
          {category && (
            <Link href={`/category/${category.slug}`} className="category-badge">
              {category.name}
            </Link>
          )}
        </div>

        <h3 className="font-semibold text-gray-900 mb-2 line-clamp-2 hover:text-red-600 transition-colors">
          <Link href={`/${slug}`}>{title}</Link>
        </h3>

        {excerpt && (
          <p className="text-sm text-gray-600 line-clamp-2 mb-3">
            {excerpt}
          </p>
        )}

        <div className="flex items-center justify-between text-xs text-gray-500">
          {publishedAt && <span>{formatDate(new Date(publishedAt))}</span>}
          {viewCount > 0 && <span>{viewCount.toLocaleString('id-ID')} views</span>}
        </div>
      </div>
    </article>
  )
}
