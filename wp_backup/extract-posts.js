const fs = require('fs');
const content = fs.readFileSync('database.sql', 'utf-8');

// Find all post inserts
const lines = content.split('\n');
const allPosts = [];

for (const line of lines) {
  if (!line.includes("INSERT INTO `SERVMASK_PREFIX_posts` VALUES")) continue;

  // Extract values between VALUES and ;
  const valuesMatch = line.match(/VALUES \((.+)\);$/);
  if (!valuesMatch) continue;

  let valuesStr = valuesMatch[1];

  // Split by '),(' for multiple rows
  const rows = valuesStr.split("'),('");

  for (let i = 0; i < rows.length; i++) {
    let row = rows[i];
    // Clean up first and last row
    if (i === 0) row = row.replace(/^\('?/, '');
    if (i === rows.length - 1) row = row.replace(/'?\)$/, '');

    // Parse fields - WordPress posts table structure
    // 0: ID, 1: post_author, 2: post_date, 3: post_date_gmt, 4: post_content,
    // 5: post_title, 6: post_excerpt, 7: post_status, 8: comment_status, 9: ping_status,
    // 10: post_password, 11: post_name (slug), 12: to_ping, 13: pinged,
    // 14: post_modified, 15: post_modified_gmt, 16: post_content_filtered,
    // 17: post_parent, 18: guid, 19: menu_order, 20: post_type, 21: post_mime_type, 22: comment_count

    const fields = [];
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
        continue; // Don't include quotes in value
      }

      if (c === ',' && !inQuote) {
        fields.push(current);
        current = '';
        continue;
      }

      current += c;
    }
    fields.push(current);

    if (fields.length < 21) continue;

    const postType = fields[20];
    const status = fields[7];
    const title = fields[5];

    if (postType === 'post' && status === 'publish' && title && title.trim()) {
      // Unescape content
      const unescape = (s) => s
        .replace(/\\'/g, "'")
        .replace(/\\"/g, '"')
        .replace(/\\\\/g, '\\')
        .replace(/\\n/g, '\n')
        .replace(/\\r/g, '\r');

      allPosts.push({
        id: fields[0],
        authorId: fields[1],
        date: fields[2],
        dateGmt: fields[3],
        content: unescape(fields[4]),
        title: unescape(fields[5]),
        excerpt: unescape(fields[6]),
        status: fields[7],
        slug: fields[11],
        postType: fields[20]
      });
    }
  }
}

// Save to JSON
fs.writeFileSync('posts.json', JSON.stringify(allPosts, null, 2));
console.log(`Extracted ${allPosts.length} posts to posts.json`);

// Show summary
console.log('\nPosts:');
allPosts.forEach((p, i) => {
  console.log(`${i + 1}. ${p.title.substring(0, 70)}...`);
  console.log(`   Slug: ${p.slug}`);
  console.log(`   Date: ${p.date}`);
  console.log(`   Content: ${p.content.length} chars`);
  console.log('');
});
