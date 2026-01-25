import { TopBar, Header, MainNav, Footer } from '@/components/layout'

export default function MainLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <div className="min-h-screen flex flex-col">
      {/* Top Bar with Breaking News */}
      <TopBar />

      {/* Header with Logo and Search */}
      <Header />

      {/* Main Navigation */}
      <MainNav />

      {/* Main Content */}
      <main className="flex-1">
        {children}
      </main>

      {/* Footer */}
      <Footer />
    </div>
  )
}
