const fs = require('fs');
const content = fs.readFileSync('database.sql', 'utf-8');

// Extract terms (categories and tags)
const terms = [];
const termTaxonomy = [];
const termRelationships = [];

// Parse term_taxonomy - maps term_id to taxonomy type
const taxLines = content.split('\n').filter(l => l.includes("SERVMASK_PREFIX_term_taxonomy"));
for (const line of taxLines) {
  if (!line.includes("INSERT INTO")) continue;
  const match = line.match(/VALUES \((.+)\);$/);
  if (!match) continue;

  const rows = match[1].split("),(");
  for (let row of rows) {
    row = row.replace(/^\(/, '').replace(/\)$/, '');
    const parts = row.split(',').map(p => p.replace(/^'|'$/g, ''));
    // term_taxonomy_id, term_id, taxonomy, description, parent, count
    if (parts.length >= 3) {
      termTaxonomy.push({
        termTaxonomyId: parts[0],
        termId: parts[1],
        taxonomy: parts[2],
        count: parts[5] || '0'
      });
    }
  }
}

// Parse terms - gets term names and slugs
const termLines = content.split('\n').filter(l => l.includes("SERVMASK_PREFIX_terms`") && l.includes("INSERT INTO"));
for (const line of termLines) {
  const match = line.match(/VALUES \((.+)\);$/);
  if (!match) continue;

  const rows = match[1].split("),(");
  for (let row of rows) {
    row = row.replace(/^\(/, '').replace(/\)$/, '');
    const parts = row.split(',').map(p => p.replace(/^'|'$/g, ''));
    // term_id, name, slug, term_group
    if (parts.length >= 3) {
      terms.push({
        termId: parts[0],
        name: parts[1],
        slug: parts[2]
      });
    }
  }
}

// Parse term_relationships - maps posts to terms
const relLines = content.split('\n').filter(l => l.includes("SERVMASK_PREFIX_term_relationships") && l.includes("INSERT INTO"));
for (const line of relLines) {
  const match = line.match(/VALUES \((.+)\);$/);
  if (!match) continue;

  const rows = match[1].split("),(");
  for (let row of rows) {
    row = row.replace(/^\(/, '').replace(/\)$/, '');
    const parts = row.split(',').map(p => p.replace(/^'|'$/g, ''));
    // object_id (post_id), term_taxonomy_id, term_order
    if (parts.length >= 2) {
      termRelationships.push({
        postId: parts[0],
        termTaxonomyId: parts[1]
      });
    }
  }
}

// Build category map
const categories = [];
const tags = [];

for (const tax of termTaxonomy) {
  const term = terms.find(t => t.termId === tax.termId);
  if (!term) continue;

  if (tax.taxonomy === 'category') {
    categories.push({
      id: tax.termTaxonomyId,
      termId: tax.termId,
      name: term.name,
      slug: term.slug,
      count: tax.count
    });
  } else if (tax.taxonomy === 'post_tag') {
    tags.push({
      id: tax.termTaxonomyId,
      termId: tax.termId,
      name: term.name,
      slug: term.slug
    });
  }
}

// Build post-category relationships
const postCategories = [];
const postTags = [];

for (const rel of termRelationships) {
  const cat = categories.find(c => c.id === rel.termTaxonomyId);
  if (cat) {
    postCategories.push({
      postId: rel.postId,
      categorySlug: cat.slug,
      categoryName: cat.name
    });
  }

  const tag = tags.find(t => t.id === rel.termTaxonomyId);
  if (tag) {
    postTags.push({
      postId: rel.postId,
      tagSlug: tag.slug,
      tagName: tag.name
    });
  }
}

console.log(`Categories: ${categories.length}`);
categories.forEach(c => console.log(`  - ${c.name} (${c.slug}): ${c.count} posts`));

console.log(`\nTags: ${tags.length}`);
tags.forEach(t => console.log(`  - ${t.name} (${t.slug})`));

// Save to JSON
fs.writeFileSync('categories.json', JSON.stringify(categories, null, 2));
fs.writeFileSync('tags.json', JSON.stringify(tags, null, 2));
fs.writeFileSync('post-categories.json', JSON.stringify(postCategories, null, 2));
fs.writeFileSync('post-tags.json', JSON.stringify(postTags, null, 2));

console.log('\nSaved to categories.json, tags.json, post-categories.json, post-tags.json');
