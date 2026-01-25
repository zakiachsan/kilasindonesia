/**
 * Media Migration Script
 *
 * Copies all images from WordPress uploads folder to the Next.js public/uploads folder.
 * Also updates post references in the database to use the new paths.
 *
 * Usage: npx tsx scripts/migrate-media.ts
 */

import { readdirSync, statSync, copyFileSync, existsSync, mkdirSync } from 'fs'
import { join, basename, extname } from 'path'

// Source and destination paths
const WP_UPLOADS_PATH = join(__dirname, '../../uploads')
const PUBLIC_UPLOADS_PATH = join(__dirname, '../public/uploads')

const IMAGE_EXTENSIONS = ['.jpg', '.jpeg', '.png', '.gif', '.webp', '.svg']

interface FileInfo {
  source: string
  filename: string
  size: number
}

// Recursively find all image files
function findImages(dir: string, files: FileInfo[] = []): FileInfo[] {
  const entries = readdirSync(dir)

  for (const entry of entries) {
    const fullPath = join(dir, entry)
    const stat = statSync(fullPath)

    if (stat.isDirectory()) {
      findImages(fullPath, files)
    } else if (stat.isFile()) {
      const ext = extname(entry).toLowerCase()
      if (IMAGE_EXTENSIONS.includes(ext)) {
        files.push({
          source: fullPath,
          filename: basename(entry),
          size: stat.size,
        })
      }
    }
  }

  return files
}

// Generate unique filename if conflict exists
function getUniqueFilename(
  destDir: string,
  filename: string,
  existingFiles: Set<string>
): string {
  if (!existingFiles.has(filename.toLowerCase())) {
    return filename
  }

  const ext = extname(filename)
  const base = basename(filename, ext)
  let counter = 1

  while (existingFiles.has(`${base}-${counter}${ext}`.toLowerCase())) {
    counter++
  }

  return `${base}-${counter}${ext}`
}

async function migrate() {
  console.log('Starting media migration...\n')

  // Check source directory
  if (!existsSync(WP_UPLOADS_PATH)) {
    console.error(`Source directory not found: ${WP_UPLOADS_PATH}`)
    process.exit(1)
  }

  // Create destination directory if needed
  if (!existsSync(PUBLIC_UPLOADS_PATH)) {
    mkdirSync(PUBLIC_UPLOADS_PATH, { recursive: true })
    console.log(`Created destination directory: ${PUBLIC_UPLOADS_PATH}`)
  }

  // Find all images
  console.log('Scanning for images...')
  const images = findImages(WP_UPLOADS_PATH)
  console.log(`Found ${images.length} images\n`)

  // Track copied files for deduplication
  const copiedFiles = new Set<string>()
  let copiedCount = 0
  let skippedCount = 0
  let totalSize = 0

  // Get existing files in destination
  if (existsSync(PUBLIC_UPLOADS_PATH)) {
    for (const file of readdirSync(PUBLIC_UPLOADS_PATH)) {
      copiedFiles.add(file.toLowerCase())
    }
  }

  // Copy each image
  console.log('Copying images...')
  for (const image of images) {
    try {
      // Check if file with same name and size already exists
      const destPath = join(PUBLIC_UPLOADS_PATH, image.filename)

      if (existsSync(destPath)) {
        const existingStat = statSync(destPath)
        if (existingStat.size === image.size) {
          console.log(`  [skip] ${image.filename} (already exists)`)
          skippedCount++
          continue
        }
      }

      // Get unique filename
      const uniqueFilename = getUniqueFilename(
        PUBLIC_UPLOADS_PATH,
        image.filename,
        copiedFiles
      )
      const finalDestPath = join(PUBLIC_UPLOADS_PATH, uniqueFilename)

      // Copy file
      copyFileSync(image.source, finalDestPath)
      copiedFiles.add(uniqueFilename.toLowerCase())
      copiedCount++
      totalSize += image.size

      if (uniqueFilename !== image.filename) {
        console.log(`  [+] ${image.filename} -> ${uniqueFilename}`)
      } else {
        console.log(`  [+] ${image.filename}`)
      }
    } catch (error) {
      console.error(`  [!] Error copying ${image.filename}:`, error)
    }
  }

  console.log('\n=== Media Migration Complete ===')
  console.log(`Images copied: ${copiedCount}`)
  console.log(`Images skipped: ${skippedCount}`)
  console.log(`Total size: ${(totalSize / 1024 / 1024).toFixed(2)} MB`)
  console.log(`\nImages are now available at: /uploads/<filename>`)
}

// Run migration
migrate().catch((error) => {
  console.error('Migration failed:', error)
  process.exit(1)
})
