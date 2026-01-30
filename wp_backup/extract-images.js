const fs = require('fs');
const content = fs.readFileSync('database.sql', 'utf-8');

// Load posts
const posts = JSON.parse(fs.readFileSync('posts.json', 'utf-8'));

// Extract postmeta to find _thumbnail_id
const postMeta = [];
const metaLines = content.split('\n').filter(l => l.includes("SERVMASK_PREFIX_postmeta") && l.includes("INSERT INTO"));

for (const line of metaLines) {
  const match = line.match(/VALUES \((.+)\);$/);
  if (!match) continue;

  const rows = match[1].split("),(");
  for (let row of rows) {
    row = row.replace(/^\(/, '').replace(/\)$/, '');
    // Split carefully
    const parts = [];
    let current = '';
    let inQuote = false;

    for (let i = 0; i < row.length; i++) {
      const c = row[i];
      if (c === "'" && row[i-1] !== '\\') {
        inQuote = !inQuote;
        continue;
      }
      if (c === ',' && !inQuote) {
        parts.push(current);
        current = '';
        continue;
      }
      current += c;
    }
    parts.push(current);

    // meta_id, post_id, meta_key, meta_value
    if (parts.length >= 4) {
      const metaKey = parts[2];
      if (metaKey === '_thumbnail_id') {
        postMeta.push({
          postId: parts[1],
          thumbnailId: parts[3]
        });
      }
    }
  }
}

console.log(`Found ${postMeta.length} thumbnail references`);

// Extract all attachments (images)
const attachments = [];
const postLines = content.split('\n').filter(l => l.includes("SERVMASK_PREFIX_posts") && l.includes("INSERT INTO"));

for (const line of postLines) {
  const match = line.match(/VALUES \((.+)\);$/);
  if (!match) continue;

  const rows = match[1].split("'),('");
  for (let i = 0; i < rows.length; i++) {
    let row = rows[i];
    if (i === 0) row = row.replace(/^\('?/, '');
    if (i === rows.length - 1) row = row.replace(/'?\)$/, '');

    const parts = [];
    let current = '';
    let inQuote = false;
    let escaped = false;

    for (let j = 0; j < row.length; j++) {
      const c = row[j];
      if (escaped) {
        current += c;
        escaped = false;
        continue;
      }
      if (c === '\\') {
        escaped = true;
        current += c;
        continue;
      }
      if (c === "'" && !escaped) {
        inQuote = !inQuote;
        continue;
      }
      if (c === ',' && !inQuote) {
        parts.push(current);
        current = '';
        continue;
      }
      current += c;
    }
    parts.push(current);

    if (parts.length < 21) continue;

    const postType = parts[20];
    const guid = parts[18]; // This contains the URL for attachments

    if (postType === 'attachment' && guid) {
      attachments.push({
        id: parts[0],
        url: guid.replace(/\\\\/g, '').replace(/\\'/g, "'")
      });
    }
  }
}

console.log(`Found ${attachments.length} attachments`);

// Map posts to their featured images
const postImages = {};

for (const meta of postMeta) {
  const attachment = attachments.find(a => a.id === meta.thumbnailId);
  if (attachment) {
    postImages[meta.postId] = attachment.url;
  }
}

console.log(`\nPost -> Featured Image mapping:`);
for (const post of posts) {
  const imageUrl = postImages[post.id];
  if (imageUrl) {
    console.log(`${post.id}: ${post.title.substring(0, 40)}...`);
    console.log(`   Image: ${imageUrl}`);
  } else {
    console.log(`${post.id}: ${post.title.substring(0, 40)}... (NO IMAGE)`);
  }
}

// Save mapping
fs.writeFileSync('post-images.json', JSON.stringify(postImages, null, 2));
console.log('\nSaved to post-images.json');
