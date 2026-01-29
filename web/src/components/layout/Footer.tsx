'use client'

import Link from 'next/link'

interface FooterLink {
  title: string
  url: string
}

interface FooterProps {
  links?: FooterLink[]
}

const defaultLinks: FooterLink[] = [
  { title: 'Tentang Kami', url: '/tentang-kami' },
  { title: 'Kontak', url: '/kontak' },
  { title: 'Kebijakan Privasi', url: '/kebijakan-privasi' },
  { title: 'Syarat & Ketentuan', url: '/syarat-ketentuan' },
]

export default function Footer({ links = defaultLinks }: FooterProps) {
  const currentYear = new Date().getFullYear()

  const scrollToTop = () => {
    window.scrollTo({ top: 0, behavior: 'smooth' })
  }

  return (
    <footer className="bg-gradient-to-b from-primary-900 to-primary-950 text-gray-300 relative">
      {/* Wave Separator */}
      <div className="absolute top-0 left-0 right-0 -translate-y-full overflow-hidden">
        <svg
          className="w-full h-6 text-primary-900"
          viewBox="0 0 1200 30"
          preserveAspectRatio="none"
        >
          <path
            fill="currentColor"
            d="M0,30 C300,0 900,0 1200,30 L1200,30 L0,30 Z"
          />
        </svg>
      </div>

      {/* Main Footer */}
      <div className="container py-12">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-10">
          {/* Brand */}
          <div className="md:col-span-2">
            <Link href="/" className="flex items-center gap-3 mb-6 group">
              <div className="w-14 h-14 bg-white rounded-xl flex items-center justify-center shadow-lg group-hover:shadow-xl transition-shadow">
                <span className="text-primary-700 font-bold text-3xl">K</span>
              </div>
              <div>
                <h2 className="text-2xl font-bold text-white group-hover:text-primary-200 transition-colors">
                  Kilas Indonesia
                </h2>
                <p className="text-sm text-primary-300">Portal Berita Terkini</p>
              </div>
            </Link>
            <p className="text-sm text-primary-200 mb-6 max-w-md leading-relaxed">
              Kilas Indonesia adalah portal berita yang menyajikan informasi terkini,
              akurat, dan terpercaya seputar pendidikan Islam, madrasah, pesantren,
              dan berbagai topik menarik lainnya.
            </p>

            {/* Social Links */}
            <div className="flex items-center gap-3">
              <a
                href="https://facebook.com/kilasindonesia"
                target="_blank"
                rel="noopener noreferrer"
                className="w-10 h-10 flex items-center justify-center bg-primary-800 text-white rounded-xl hover:bg-white hover:text-primary-700 hover:scale-110 transition-all duration-200"
                aria-label="Facebook"
              >
                <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M18.77 7.46H14.5v-1.9c0-.9.6-1.1 1-1.1h3V.5h-4.33C10.24.5 9.5 3.44 9.5 5.32v2.15h-3v4h3v12h5v-12h3.85l.42-4z" />
                </svg>
              </a>
              <a
                href="https://twitter.com/kilasindonesia"
                target="_blank"
                rel="noopener noreferrer"
                className="w-10 h-10 flex items-center justify-center bg-primary-800 text-white rounded-xl hover:bg-white hover:text-primary-700 hover:scale-110 transition-all duration-200"
                aria-label="Twitter"
              >
                <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M23.44 4.83c-.8.37-1.5.38-2.22.02.93-.56.98-.96 1.32-2.02-.88.52-1.86.9-2.9 1.1-.82-.88-2-1.43-3.3-1.43-2.5 0-4.55 2.04-4.55 4.54 0 .36.03.7.1 1.04-3.77-.2-7.12-2-9.36-4.75-.4.67-.6 1.45-.6 2.3 0 1.56.8 2.95 2 3.77-.74-.03-1.44-.23-2.05-.57v.06c0 2.2 1.56 4.03 3.64 4.44-.67.2-1.37.2-2.06.08.58 1.8 2.26 3.12 4.25 3.16C5.78 18.1 3.37 18.74 1 18.46c2 1.3 4.4 2.04 6.97 2.04 8.35 0 12.92-6.92 12.92-12.93 0-.2 0-.4-.02-.6.9-.63 1.96-1.22 2.56-2.14z" />
                </svg>
              </a>
              <a
                href="https://instagram.com/kilasindonesia"
                target="_blank"
                rel="noopener noreferrer"
                className="w-10 h-10 flex items-center justify-center bg-primary-800 text-white rounded-xl hover:bg-white hover:text-primary-700 hover:scale-110 transition-all duration-200"
                aria-label="Instagram"
              >
                <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zM12 0C8.741 0 8.333.014 7.053.072 2.695.272.273 2.69.073 7.052.014 8.333 0 8.741 0 12c0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98C8.333 23.986 8.741 24 12 24c3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98C15.668.014 15.259 0 12 0zm0 5.838a6.162 6.162 0 100 12.324 6.162 6.162 0 000-12.324zM12 16a4 4 0 110-8 4 4 0 010 8zm6.406-11.845a1.44 1.44 0 100 2.881 1.44 1.44 0 000-2.881z" />
                </svg>
              </a>
              <a
                href="https://youtube.com/@kilasindonesia"
                target="_blank"
                rel="noopener noreferrer"
                className="w-10 h-10 flex items-center justify-center bg-primary-800 text-white rounded-xl hover:bg-white hover:text-primary-700 hover:scale-110 transition-all duration-200"
                aria-label="YouTube"
              >
                <svg className="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z" />
                </svg>
              </a>
            </div>
          </div>

          {/* Categories */}
          <div>
            <h3 className="text-white font-semibold mb-5 text-lg">Kategori</h3>
            <ul className="space-y-3">
              <li>
                <Link href="/category/nasional" className="text-sm text-primary-200 hover:text-white hover:translate-x-1 inline-block transition-all">
                  Nasional
                </Link>
              </li>
              <li>
                <Link href="/category/madrasah" className="text-sm text-primary-200 hover:text-white hover:translate-x-1 inline-block transition-all">
                  Madrasah
                </Link>
              </li>
              <li>
                <Link href="/category/pesantren" className="text-sm text-primary-200 hover:text-white hover:translate-x-1 inline-block transition-all">
                  Pesantren
                </Link>
              </li>
              <li>
                <Link href="/category/perguruan-tinggi" className="text-sm text-primary-200 hover:text-white hover:translate-x-1 inline-block transition-all">
                  Perguruan Tinggi
                </Link>
              </li>
              <li>
                <Link href="/category/opini" className="text-sm text-primary-200 hover:text-white hover:translate-x-1 inline-block transition-all">
                  Opini
                </Link>
              </li>
              <li>
                <Link href="/category/berita" className="text-sm text-primary-200 hover:text-white hover:translate-x-1 inline-block transition-all">
                  Berita
                </Link>
              </li>
            </ul>
          </div>

          {/* Links */}
          <div>
            <h3 className="text-white font-semibold mb-5 text-lg">Informasi</h3>
            <ul className="space-y-3">
              {links.map((link) => (
                <li key={link.url}>
                  <Link href={link.url} className="text-sm text-primary-200 hover:text-white hover:translate-x-1 inline-block transition-all">
                    {link.title}
                  </Link>
                </li>
              ))}
            </ul>

            {/* Contact Info */}
            <div className="mt-6 pt-6 border-t border-primary-800">
              <p className="text-sm text-primary-200 mb-2 flex items-center gap-2">
                <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                </svg>
                redaksi@kilasindonesia.com
              </p>
            </div>
          </div>
        </div>
      </div>

      {/* Bottom Footer */}
      <div className="border-t border-primary-800/50">
        <div className="container py-5">
          <div className="text-sm text-primary-300 text-center sm:text-left">
            <p>&copy; {currentYear} Kilas Indonesia. All rights reserved.</p>
          </div>
        </div>
      </div>

      {/* Back to Top Button */}
      <button
        onClick={scrollToTop}
        className="back-to-top"
        aria-label="Kembali ke atas"
      >
        <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 10l7-7m0 0l7 7m-7-7v18" />
        </svg>
      </button>
    </footer>
  )
}
