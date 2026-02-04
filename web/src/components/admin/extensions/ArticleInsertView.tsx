'use client'

import { NodeViewWrapper, NodeViewProps } from '@tiptap/react'

export default function ArticleInsertView({ node, deleteNode }: NodeViewProps) {
  const { articleTitle } = node.attrs

  return (
    <NodeViewWrapper className="article-insert-wrapper my-4">
      <div className="flex items-center gap-3 p-4 bg-gray-50 border-l-4 border-red-600 rounded-r-lg group">
        <div className="flex-shrink-0">
          <svg
            className="w-5 h-5 text-red-600"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"
            />
          </svg>
        </div>
        <div className="flex-1 min-w-0">
          <span className="text-xs font-semibold text-red-600 uppercase tracking-wide">
            Baca Juga
          </span>
          <p className="text-sm font-medium text-gray-900 truncate">{articleTitle}</p>
        </div>
        <button
          onClick={deleteNode}
          className="opacity-0 group-hover:opacity-100 p-1 text-gray-400 hover:text-red-600 transition-all"
          title="Hapus sisipan"
          type="button"
        >
          <svg
            className="w-4 h-4"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              strokeLinecap="round"
              strokeLinejoin="round"
              strokeWidth={2}
              d="M6 18L18 6M6 6l12 12"
            />
          </svg>
        </button>
      </div>
    </NodeViewWrapper>
  )
}
