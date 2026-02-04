CREATE TYPE "public"."AdType" AS ENUM('placeholder', 'custom', 'programmatic');--> statement-breakpoint
CREATE TYPE "public"."CommentStatus" AS ENUM('PENDING', 'APPROVED', 'REJECTED');--> statement-breakpoint
CREATE TYPE "public"."PostStatus" AS ENUM('DRAFT', 'PUBLISHED', 'SCHEDULED', 'ARCHIVED');--> statement-breakpoint
CREATE TYPE "public"."Role" AS ENUM('ADMIN', 'AUTHOR');--> statement-breakpoint
CREATE TABLE "ads" (
	"id" text PRIMARY KEY NOT NULL,
	"position" text NOT NULL,
	"name" text NOT NULL,
	"width" integer NOT NULL,
	"height" integer NOT NULL,
	"enabled" boolean DEFAULT false NOT NULL,
	"type" "AdType" DEFAULT 'placeholder' NOT NULL,
	"imageUrl" text,
	"redirectUrl" text,
	"altText" text,
	"adCode" text,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	"updatedAt" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "ads_position_unique" UNIQUE("position")
);
--> statement-breakpoint
CREATE TABLE "categories" (
	"id" text PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"slug" text NOT NULL,
	"description" text,
	"parentId" text,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "categories_slug_unique" UNIQUE("slug")
);
--> statement-breakpoint
CREATE TABLE "comments" (
	"id" text PRIMARY KEY NOT NULL,
	"postId" text NOT NULL,
	"authorName" text NOT NULL,
	"authorEmail" text NOT NULL,
	"content" text NOT NULL,
	"status" "CommentStatus" DEFAULT 'PENDING' NOT NULL,
	"parentId" text,
	"createdAt" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "media" (
	"id" text PRIMARY KEY NOT NULL,
	"filename" text NOT NULL,
	"url" text NOT NULL,
	"altText" text,
	"caption" text,
	"mimeType" text NOT NULL,
	"size" integer NOT NULL,
	"uploadedBy" text,
	"createdAt" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "menu_items" (
	"id" text PRIMARY KEY NOT NULL,
	"menuId" text NOT NULL,
	"title" text NOT NULL,
	"url" text NOT NULL,
	"target" text DEFAULT '_self' NOT NULL,
	"parentId" text,
	"order" integer DEFAULT 0 NOT NULL
);
--> statement-breakpoint
CREATE TABLE "menus" (
	"id" text PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"location" text NOT NULL,
	CONSTRAINT "menus_location_unique" UNIQUE("location")
);
--> statement-breakpoint
CREATE TABLE "pages" (
	"id" text PRIMARY KEY NOT NULL,
	"slug" text NOT NULL,
	"title" text NOT NULL,
	"content" text NOT NULL,
	"excerpt" text,
	"featuredImage" text,
	"seoTitle" text,
	"seoDescription" text,
	"publishedAt" timestamp,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	"updatedAt" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "pages_slug_unique" UNIQUE("slug")
);
--> statement-breakpoint
CREATE TABLE "_PostCategories" (
	"A" text NOT NULL,
	"B" text NOT NULL,
	CONSTRAINT "_PostCategories_A_B_pk" PRIMARY KEY("A","B")
);
--> statement-breakpoint
CREATE TABLE "_PostTags" (
	"A" text NOT NULL,
	"B" text NOT NULL,
	CONSTRAINT "_PostTags_A_B_pk" PRIMARY KEY("A","B")
);
--> statement-breakpoint
CREATE TABLE "posts" (
	"id" text PRIMARY KEY NOT NULL,
	"title" text NOT NULL,
	"slug" text NOT NULL,
	"content" text NOT NULL,
	"excerpt" text,
	"featuredImage" text,
	"authorId" text NOT NULL,
	"status" "PostStatus" DEFAULT 'DRAFT' NOT NULL,
	"viewCount" integer DEFAULT 0 NOT NULL,
	"publishedAt" timestamp,
	"scheduledAt" timestamp,
	"isPinned" boolean DEFAULT false NOT NULL,
	"pinnedOrder" integer DEFAULT 0 NOT NULL,
	"metaTitle" text,
	"metaDescription" text,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	"updatedAt" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "posts_slug_unique" UNIQUE("slug")
);
--> statement-breakpoint
CREATE TABLE "settings" (
	"key" text PRIMARY KEY NOT NULL,
	"value" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE "tags" (
	"id" text PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"slug" text NOT NULL,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "tags_slug_unique" UNIQUE("slug")
);
--> statement-breakpoint
CREATE TABLE "users" (
	"id" text PRIMARY KEY NOT NULL,
	"email" text NOT NULL,
	"password" text NOT NULL,
	"name" text NOT NULL,
	"avatar" text,
	"role" "Role" DEFAULT 'AUTHOR' NOT NULL,
	"createdAt" timestamp DEFAULT now() NOT NULL,
	"updatedAt" timestamp DEFAULT now() NOT NULL,
	CONSTRAINT "users_email_unique" UNIQUE("email")
);
--> statement-breakpoint
ALTER TABLE "comments" ADD CONSTRAINT "comments_postId_posts_id_fk" FOREIGN KEY ("postId") REFERENCES "public"."posts"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "menu_items" ADD CONSTRAINT "menu_items_menuId_menus_id_fk" FOREIGN KEY ("menuId") REFERENCES "public"."menus"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_PostCategories" ADD CONSTRAINT "_PostCategories_A_categories_id_fk" FOREIGN KEY ("A") REFERENCES "public"."categories"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_PostCategories" ADD CONSTRAINT "_PostCategories_B_posts_id_fk" FOREIGN KEY ("B") REFERENCES "public"."posts"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_PostTags" ADD CONSTRAINT "_PostTags_A_posts_id_fk" FOREIGN KEY ("A") REFERENCES "public"."posts"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "_PostTags" ADD CONSTRAINT "_PostTags_B_tags_id_fk" FOREIGN KEY ("B") REFERENCES "public"."tags"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "posts" ADD CONSTRAINT "posts_authorId_users_id_fk" FOREIGN KEY ("authorId") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "ads_position_idx" ON "ads" USING btree ("position");--> statement-breakpoint
CREATE INDEX "ads_enabled_idx" ON "ads" USING btree ("enabled");--> statement-breakpoint
CREATE INDEX "comments_post_status_idx" ON "comments" USING btree ("postId","status");--> statement-breakpoint
CREATE INDEX "menu_items_menu_order_idx" ON "menu_items" USING btree ("menuId","order");--> statement-breakpoint
CREATE INDEX "pages_slug_idx" ON "pages" USING btree ("slug");--> statement-breakpoint
CREATE INDEX "pages_published_idx" ON "pages" USING btree ("publishedAt");--> statement-breakpoint
CREATE INDEX "posts_status_published_idx" ON "posts" USING btree ("status","publishedAt");--> statement-breakpoint
CREATE INDEX "posts_status_scheduled_idx" ON "posts" USING btree ("status","scheduledAt");--> statement-breakpoint
CREATE INDEX "posts_author_idx" ON "posts" USING btree ("authorId");--> statement-breakpoint
CREATE INDEX "posts_pinned_idx" ON "posts" USING btree ("isPinned","pinnedOrder");