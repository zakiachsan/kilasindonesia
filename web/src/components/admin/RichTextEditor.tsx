'use client'

import { useEditor, EditorContent } from '@tiptap/react'
import StarterKit from '@tiptap/starter-kit'
import Link from '@tiptap/extension-link'
import Image from '@tiptap/extension-image'
import Placeholder from '@tiptap/extension-placeholder'
import TextAlign from '@tiptap/extension-text-align'
import Underline from '@tiptap/extension-underline'
import { ArticleInsert } from './extensions'
import { useCallback, useEffect, useRef, useState } from 'react'
import ImageCropper from '@/components/admin/ImageCropper'

interface ArticleSearchResult {
  id: string
  title: string
  slug: string
  categories?: { name: string }[]
}

interface RichTextEditorProps {
  content: string
  onChange: (content: string) => void
  placeholder?: string
}

export default function RichTextEditor({
  content,
  onChange,
  placeholder = 'Tulis konten artikel...',
}: RichTextEditorProps) {
  const [linkUrl, setLinkUrl] = useState('')
  const [showLinkInput, setShowLinkInput] = useState(false)
  const [imageUrl, setImageUrl] = useState('')
  const [showImageInput, setShowImageInput] = useState(false)
  const [showArticleSearch, setShowArticleSearch] = useState(false)
  const [articleSearchQuery, setArticleSearchQuery] = useState('')
  const [articleSearchResults, setArticleSearchResults] = useState<ArticleSearchResult[]>([])
  const [articleSearchLoading, setArticleSearchLoading] = useState(false)
  const [cropImageSrc, setCropImageSrc] = useState<string | null>(null)
  const fileInputRef = useRef<HTMLInputElement>(null)

  const editor = useEditor({
    extensions: [
      StarterKit.configure({
        heading: {
          levels: [2, 3, 4],
        },
      }),
      Link.configure({
        openOnClick: false,
        HTMLAttributes: {
          class: 'text-red-600 underline hover:text-red-700',
        },
      }),
      Image.configure({
        HTMLAttributes: {
          class: 'max-w-full h-auto rounded-lg my-4',
        },
      }),
      Placeholder.configure({
        placeholder,
      }),
      TextAlign.configure({
        types: ['heading', 'paragraph'],
      }),
      Underline,
      ArticleInsert,
    ],
    content,
    editorProps: {
      attributes: {
        class:
          'prose prose-sm max-w-none focus:outline-none min-h-[400px] px-4 py-3',
      },
    },
    onUpdate: ({ editor }) => {
      onChange(editor.getHTML())
    },
    immediatelyRender: false,
  })

  useEffect(() => {
    if (editor && content !== editor.getHTML()) {
      editor.commands.setContent(content)
    }
  }, [content, editor])

  const addLink = useCallback(() => {
    if (linkUrl && editor) {
      editor
        .chain()
        .focus()
        .extendMarkRange('link')
        .setLink({ href: linkUrl })
        .run()
      setLinkUrl('')
      setShowLinkInput(false)
    }
  }, [editor, linkUrl])

  const removeLink = useCallback(() => {
    if (editor) {
      editor.chain().focus().unsetLink().run()
    }
  }, [editor])

  const addImage = useCallback(() => {
    if (imageUrl && editor) {
      editor.chain().focus().setImage({ src: imageUrl }).run()
      setImageUrl('')
      setShowImageInput(false)
    }
  }, [editor, imageUrl])

  // Article search function
  const searchArticles = useCallback(async (query: string) => {
    if (!query.trim()) {
      setArticleSearchResults([])
      return
    }

    setArticleSearchLoading(true)
    try {
      const res = await fetch(`/api/posts?search=${encodeURIComponent(query)}&limit=5`)
      const data = await res.json()
      setArticleSearchResults(data.posts || [])
    } catch (err) {
      console.error('Search error:', err)
      setArticleSearchResults([])
    } finally {
      setArticleSearchLoading(false)
    }
  }, [])

  // Debounced search effect
  useEffect(() => {
    const timer = setTimeout(() => {
      if (showArticleSearch) {
        searchArticles(articleSearchQuery)
      }
    }, 300)
    return () => clearTimeout(timer)
  }, [articleSearchQuery, searchArticles, showArticleSearch])

  // Insert article reference
  const insertArticle = useCallback((article: ArticleSearchResult) => {
    if (editor) {
      editor.chain().focus().setArticleInsert({
        articleId: article.id,
        articleTitle: article.title,
        articleSlug: article.slug,
      }).run()
      setShowArticleSearch(false)
      setArticleSearchQuery('')
      setArticleSearchResults([])
    }
  }, [editor])

  const handleImageUpload = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (!file || !editor) return

    const objectUrl = URL.createObjectURL(file)
    setCropImageSrc(objectUrl)

    if (fileInputRef.current) {
      fileInputRef.current.value = ''
    }
  }

  const handleCropComplete = async (croppedBlob: Blob) => {
    if (cropImageSrc) URL.revokeObjectURL(cropImageSrc)
    setCropImageSrc(null)

    if (!editor) return

    try {
      const uploadData = new FormData()
      uploadData.append('file', croppedBlob, 'cropped-image.webp')

      const res = await fetch('/api/upload', {
        method: 'POST',
        body: uploadData,
      })

      const data = await res.json()

      if (!res.ok) {
        throw new Error(data.error || 'Upload gagal')
      }

      editor.chain().focus().setImage({ src: data.url }).run()
    } catch (err) {
      console.error('Upload error:', err)
      alert('Gagal upload gambar')
    }
  }

  const handleCropCancel = () => {
    if (cropImageSrc) URL.revokeObjectURL(cropImageSrc)
    setCropImageSrc(null)
  }

  if (!editor) {
    return null
  }

  return (
    <div className="border border-gray-300 rounded-lg overflow-hidden">
      {/* Toolbar */}
      <div className="bg-gray-50 border-b border-gray-300 p-2 flex flex-wrap gap-1">
        {/* Text Format */}
        <div className="flex gap-0.5 border-r border-gray-300 pr-2 mr-1">
          <ToolbarButton
            onClick={() => editor.chain().focus().toggleBold().run()}
            active={editor.isActive('bold')}
            title="Bold"
          >
            <span className="font-bold">B</span>
          </ToolbarButton>
          <ToolbarButton
            onClick={() => editor.chain().focus().toggleItalic().run()}
            active={editor.isActive('italic')}
            title="Italic"
          >
            <span className="italic">I</span>
          </ToolbarButton>
          <ToolbarButton
            onClick={() => editor.chain().focus().toggleUnderline().run()}
            active={editor.isActive('underline')}
            title="Underline"
          >
            <span className="underline">U</span>
          </ToolbarButton>
          <ToolbarButton
            onClick={() => editor.chain().focus().toggleStrike().run()}
            active={editor.isActive('strike')}
            title="Strikethrough"
          >
            <span className="line-through">S</span>
          </ToolbarButton>
        </div>

        {/* Headings */}
        <div className="flex gap-0.5 border-r border-gray-300 pr-2 mr-1">
          <ToolbarButton
            onClick={() => editor.chain().focus().toggleHeading({ level: 2 }).run()}
            active={editor.isActive('heading', { level: 2 })}
            title="Heading 2"
          >
            H2
          </ToolbarButton>
          <ToolbarButton
            onClick={() => editor.chain().focus().toggleHeading({ level: 3 }).run()}
            active={editor.isActive('heading', { level: 3 })}
            title="Heading 3"
          >
            H3
          </ToolbarButton>
          <ToolbarButton
            onClick={() => editor.chain().focus().setParagraph().run()}
            active={editor.isActive('paragraph')}
            title="Paragraph"
          >
            P
          </ToolbarButton>
        </div>

        {/* Lists */}
        <div className="flex gap-0.5 border-r border-gray-300 pr-2 mr-1">
          <ToolbarButton
            onClick={() => editor.chain().focus().toggleBulletList().run()}
            active={editor.isActive('bulletList')}
            title="Bullet List"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h16M4 18h16" />
            </svg>
          </ToolbarButton>
          <ToolbarButton
            onClick={() => editor.chain().focus().toggleOrderedList().run()}
            active={editor.isActive('orderedList')}
            title="Numbered List"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M7 20l4-16m2 16l4-16M6 9h14M4 15h14" />
            </svg>
          </ToolbarButton>
        </div>

        {/* Alignment */}
        <div className="flex gap-0.5 border-r border-gray-300 pr-2 mr-1">
          <ToolbarButton
            onClick={() => editor.chain().focus().setTextAlign('left').run()}
            active={editor.isActive({ textAlign: 'left' })}
            title="Align Left"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M4 12h10M4 18h16" />
            </svg>
          </ToolbarButton>
          <ToolbarButton
            onClick={() => editor.chain().focus().setTextAlign('center').run()}
            active={editor.isActive({ textAlign: 'center' })}
            title="Align Center"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M7 12h10M4 18h16" />
            </svg>
          </ToolbarButton>
          <ToolbarButton
            onClick={() => editor.chain().focus().setTextAlign('right').run()}
            active={editor.isActive({ textAlign: 'right' })}
            title="Align Right"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6h16M10 12h10M4 18h16" />
            </svg>
          </ToolbarButton>
        </div>

        {/* Quote & Code */}
        <div className="flex gap-0.5 border-r border-gray-300 pr-2 mr-1">
          <ToolbarButton
            onClick={() => editor.chain().focus().toggleBlockquote().run()}
            active={editor.isActive('blockquote')}
            title="Quote"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z" />
            </svg>
          </ToolbarButton>
          <ToolbarButton
            onClick={() => editor.chain().focus().setHorizontalRule().run()}
            title="Horizontal Line"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M20 12H4" />
            </svg>
          </ToolbarButton>
        </div>

        {/* Article Insert (Sisipan) */}
        <div className="flex gap-0.5 border-r border-gray-300 pr-2 mr-1 relative">
          <ToolbarButton
            onClick={() => {
              setShowArticleSearch(!showArticleSearch)
              setShowLinkInput(false)
              setShowImageInput(false)
            }}
            title="Sisipan Artikel"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
            </svg>
          </ToolbarButton>
          {showArticleSearch && (
            <div className="absolute top-full left-0 mt-1 bg-white border border-gray-300 rounded-lg shadow-lg z-10 w-72">
              <div className="p-2 border-b border-gray-200">
                <input
                  type="text"
                  value={articleSearchQuery}
                  onChange={(e) => setArticleSearchQuery(e.target.value)}
                  placeholder="Cari artikel..."
                  className="w-full px-2 py-1.5 border border-gray-300 rounded text-sm focus:ring-2 focus:ring-red-500 focus:border-red-500"
                  autoFocus
                />
              </div>
              <div className="max-h-60 overflow-y-auto">
                {articleSearchLoading ? (
                  <div className="p-4 text-center text-gray-500 text-sm">Mencari...</div>
                ) : articleSearchResults.length > 0 ? (
                  articleSearchResults.map((article) => (
                    <button
                      key={article.id}
                      onClick={() => insertArticle(article)}
                      className="w-full text-left px-3 py-2 hover:bg-gray-50 border-b border-gray-100 last:border-b-0"
                      type="button"
                    >
                      <p className="text-sm font-medium text-gray-900 truncate">{article.title}</p>
                      <p className="text-xs text-gray-500 truncate">
                        {article.categories?.[0]?.name || 'Berita'}
                      </p>
                    </button>
                  ))
                ) : articleSearchQuery ? (
                  <div className="p-4 text-center text-gray-500 text-sm">Tidak ada hasil</div>
                ) : (
                  <div className="p-4 text-center text-gray-500 text-sm">Ketik untuk mencari artikel</div>
                )}
              </div>
            </div>
          )}
        </div>

        {/* Link */}
        <div className="flex gap-0.5 border-r border-gray-300 pr-2 mr-1 relative">
          <ToolbarButton
            onClick={() => {
              if (editor.isActive('link')) {
                removeLink()
              } else {
                setShowLinkInput(!showLinkInput)
                setShowImageInput(false)
              }
            }}
            active={editor.isActive('link')}
            title={editor.isActive('link') ? 'Remove Link' : 'Add Link'}
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1" />
            </svg>
          </ToolbarButton>
          {showLinkInput && (
            <div className="absolute top-full left-0 mt-1 bg-white border border-gray-300 rounded-lg shadow-lg p-2 z-10 flex gap-2">
              <input
                type="url"
                value={linkUrl}
                onChange={(e) => setLinkUrl(e.target.value)}
                placeholder="https://..."
                className="px-2 py-1 border border-gray-300 rounded text-sm w-48"
                onKeyDown={(e) => e.key === 'Enter' && addLink()}
              />
              <button
                onClick={addLink}
                className="px-2 py-1 bg-red-600 text-white rounded text-sm hover:bg-red-700"
              >
                OK
              </button>
            </div>
          )}
        </div>

        {/* Image */}
        <div className="flex gap-0.5 relative">
          <input
            ref={fileInputRef}
            type="file"
            accept="image/jpeg,image/jpg,image/png,image/webp"
            onChange={handleImageUpload}
            className="hidden"
            id="editor-image-upload"
          />
          <ToolbarButton
            onClick={() => fileInputRef.current?.click()}
            title="Upload Image (1200x675, 16:9)"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
            </svg>
          </ToolbarButton>
          <ToolbarButton
            onClick={() => {
              setShowImageInput(!showImageInput)
              setShowLinkInput(false)
            }}
            title="Image URL"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1" />
            </svg>
          </ToolbarButton>
          {showImageInput && (
            <div className="absolute top-full right-0 mt-1 bg-white border border-gray-300 rounded-lg shadow-lg p-2 z-10 flex gap-2">
              <input
                type="url"
                value={imageUrl}
                onChange={(e) => setImageUrl(e.target.value)}
                placeholder="URL gambar..."
                className="px-2 py-1 border border-gray-300 rounded text-sm w-48"
                onKeyDown={(e) => e.key === 'Enter' && addImage()}
              />
              <button
                onClick={addImage}
                className="px-2 py-1 bg-red-600 text-white rounded text-sm hover:bg-red-700"
              >
                OK
              </button>
            </div>
          )}
        </div>

        {/* Undo/Redo */}
        <div className="flex gap-0.5 ml-auto">
          <ToolbarButton
            onClick={() => editor.chain().focus().undo().run()}
            disabled={!editor.can().undo()}
            title="Undo"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M3 10h10a8 8 0 018 8v2M3 10l6 6m-6-6l6-6" />
            </svg>
          </ToolbarButton>
          <ToolbarButton
            onClick={() => editor.chain().focus().redo().run()}
            disabled={!editor.can().redo()}
            title="Redo"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 10h-10a8 8 0 00-8 8v2M21 10l-6 6m6-6l-6-6" />
            </svg>
          </ToolbarButton>
        </div>
      </div>

      {/* Editor Content */}
      <EditorContent editor={editor} className="bg-white" />

      {/* Character Count */}
      <div className="bg-gray-50 border-t border-gray-300 px-3 py-1.5 text-xs text-gray-500 flex justify-between">
        <span>{editor.storage.characterCount?.characters?.() || editor.getText().length} karakter</span>
        <span>Upload gambar: 1200x675 px (16:9)</span>
        <span>{editor.storage.characterCount?.words?.() || editor.getText().split(/\s+/).filter(Boolean).length} kata</span>
      </div>

      {cropImageSrc && (
        <ImageCropper
          imageSrc={cropImageSrc}
          onCropComplete={handleCropComplete}
          onCancel={handleCropCancel}
        />
      )}
    </div>
  )
}

interface ToolbarButtonProps {
  onClick: () => void
  active?: boolean
  disabled?: boolean
  title?: string
  children: React.ReactNode
}

function ToolbarButton({
  onClick,
  active = false,
  disabled = false,
  title,
  children,
}: ToolbarButtonProps) {
  return (
    <button
      type="button"
      onClick={onClick}
      disabled={disabled}
      title={title}
      className={`p-1.5 rounded text-sm font-medium transition-colors ${
        active
          ? 'bg-red-600 text-white'
          : disabled
          ? 'text-gray-300 cursor-not-allowed'
          : 'text-gray-700 hover:bg-gray-200'
      }`}
    >
      {children}
    </button>
  )
}
