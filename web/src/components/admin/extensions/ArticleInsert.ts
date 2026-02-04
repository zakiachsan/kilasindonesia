import { Node, mergeAttributes } from '@tiptap/core'
import { ReactNodeViewRenderer } from '@tiptap/react'
import ArticleInsertView from './ArticleInsertView'

export interface ArticleInsertOptions {
  HTMLAttributes: Record<string, unknown>
}

declare module '@tiptap/core' {
  interface Commands<ReturnType> {
    articleInsert: {
      setArticleInsert: (attrs: {
        articleId: string
        articleTitle: string
        articleSlug: string
      }) => ReturnType
    }
  }
}

export const ArticleInsert = Node.create<ArticleInsertOptions>({
  name: 'articleInsert',
  group: 'block',
  atom: true,
  draggable: true,

  addOptions() {
    return {
      HTMLAttributes: {
        class: 'article-insert',
      },
    }
  },

  addAttributes() {
    return {
      articleId: {
        default: null,
        parseHTML: element => element.getAttribute('data-article-id'),
        renderHTML: attributes => ({
          'data-article-id': attributes.articleId,
        }),
      },
      articleTitle: {
        default: '',
        parseHTML: element => element.getAttribute('data-article-title'),
        renderHTML: attributes => ({
          'data-article-title': attributes.articleTitle,
        }),
      },
      articleSlug: {
        default: '',
        parseHTML: element => element.getAttribute('data-article-slug'),
        renderHTML: attributes => ({
          'data-article-slug': attributes.articleSlug,
        }),
      },
    }
  },

  parseHTML() {
    return [
      {
        tag: 'div.article-insert',
      },
    ]
  },

  renderHTML({ HTMLAttributes, node }) {
    return [
      'div',
      mergeAttributes(this.options.HTMLAttributes, HTMLAttributes),
      ['span', { class: 'article-insert-label' }, 'Baca Juga:'],
      ['a', { href: `/${node.attrs.articleSlug}` }, node.attrs.articleTitle],
    ]
  },

  addNodeView() {
    return ReactNodeViewRenderer(ArticleInsertView)
  },

  addCommands() {
    return {
      setArticleInsert:
        (attrs) =>
        ({ commands }) => {
          return commands.insertContent({
            type: this.name,
            attrs,
          })
        },
    }
  },
})
