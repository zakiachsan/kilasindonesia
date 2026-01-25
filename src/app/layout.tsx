import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'

const inter = Inter({
  subsets: ['latin'],
  display: 'swap',
})

export const metadata: Metadata = {
  title: {
    default: 'Kilas Indonesia - Portal Berita Terkini',
    template: '%s | Kilas Indonesia',
  },
  description: 'Portal berita Indonesia yang menyajikan informasi terkini, akurat, dan terpercaya seputar politik, ekonomi, olahraga, hiburan, dan berbagai topik menarik lainnya.',
  keywords: ['berita', 'indonesia', 'politik', 'olahraga', 'hiburan', 'terkini'],
  authors: [{ name: 'Kilas Indonesia' }],
  openGraph: {
    type: 'website',
    locale: 'id_ID',
    url: 'https://kilasindonesia.com',
    siteName: 'Kilas Indonesia',
    title: 'Kilas Indonesia - Portal Berita Terkini',
    description: 'Portal berita Indonesia yang menyajikan informasi terkini, akurat, dan terpercaya.',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Kilas Indonesia - Portal Berita Terkini',
    description: 'Portal berita Indonesia yang menyajikan informasi terkini, akurat, dan terpercaya.',
  },
  robots: {
    index: true,
    follow: true,
  },
}

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode
}>) {
  return (
    <html lang="id">
      <body className={`${inter.className} antialiased bg-gray-50`}>
        {children}
      </body>
    </html>
  )
}
