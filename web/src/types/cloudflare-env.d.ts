// Cloudflare Workers environment bindings
// Add your Cloudflare bindings here (D1, KV, R2, Hyperdrive, etc.)

interface CloudflareEnv {
  // Hyperdrive binding for PostgreSQL (if configured)
  // HYPERDRIVE: Hyperdrive;

  // Example KV namespace binding
  // MY_KV: KVNamespace;

  // Example D1 database binding
  // MY_DB: D1Database;

  // Example R2 bucket binding
  // MY_BUCKET: R2Bucket;
}

// Extend the global environment
declare global {
  namespace NodeJS {
    interface ProcessEnv extends CloudflareEnv {}
  }
}

export {};
