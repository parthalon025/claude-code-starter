# [Project Name]

## Tech Stack
- Next.js 14+ (App Router)
- TypeScript (strict)
- Tailwind CSS
- Prisma ORM + PostgreSQL
- NextAuth.js for authentication

## Commands
- `npm run dev` -- start dev server (localhost:3000)
- `npm run build` -- production build
- `npm test` -- run tests
- `npx prisma studio` -- visual database browser
- `npx prisma migrate dev` -- run database migrations
- `npx prisma generate` -- regenerate Prisma client

## Code Style
- Use Server Components by default, Client Components only when needed
- Strict TypeScript, never use `any`
- Tailwind for styling
- Server Actions for mutations (no API routes for form submissions)
- Zod for all input validation

## File Structure
```
app/
  (auth)/           # Auth-related pages (grouped route)
  (dashboard)/      # Dashboard pages
  api/              # API routes (only for webhooks/external)
  layout.tsx        # Root layout
  page.tsx          # Home page
components/
  ui/               # Generic UI components
  forms/            # Form components
lib/
  db.ts             # Prisma client
  auth.ts           # NextAuth config
  utils.ts          # Helper functions
prisma/
  schema.prisma     # Database schema
  migrations/       # Migration files
```

## Rules
- Prefer Server Components -- add "use client" only for interactivity
- Data fetching in Server Components, not useEffect
- Use Next.js Image component for all images
- All database changes need a Prisma migration
- API routes only for webhooks and external integrations
- Environment variables: NEXT_PUBLIC_ prefix for client-side only
- Never commit `.env.local`
