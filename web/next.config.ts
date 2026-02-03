import type { NextConfig } from "next";

// Import setupDevPlatform for Cloudflare local development
// This is only needed for local development, not for production builds
import { setupDevPlatform } from '@cloudflare/next-on-pages/next-dev';

// Setup Cloudflare platform for local development
if (process.env.NODE_ENV === 'development') {
  setupDevPlatform();
}

const nextConfig: NextConfig = {
  // Note: 'standalone' output removed for Cloudflare Pages compatibility
  // For Docker deployment, add: output: 'standalone'

  // Image optimization (unoptimized for Cloudflare Pages)
  // To use Cloudflare Images, set up a custom loader instead
  images: {
    unoptimized: true,
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'kilasindonesia.com',
      },
      {
        protocol: 'https',
        hostname: '*.kilasindonesia.com',
      },
    ],
    formats: ['image/avif', 'image/webp'],
    deviceSizes: [640, 750, 828, 1080, 1200, 1920],
    imageSizes: [16, 32, 48, 64, 96, 128, 256, 384],
  },

  // Enable experimental features for better performance
  experimental: {
    optimizePackageImports: ['@heroicons/react'],
  },

  // Rewrites for serving uploaded files via API route
  async rewrites() {
    return [
      {
        source: '/uploads/:path*',
        destination: '/api/uploads/:path*',
      },
    ]
  },
};

export default nextConfig;
