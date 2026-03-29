# [Project Name]

## Tech Stack
- React 18 + TypeScript
- Vite for bundling
- Tailwind CSS for styling
- React Router for navigation

## Commands
- `npm run dev` -- start dev server (localhost:5173)
- `npm run build` -- production build
- `npm test` -- run tests with Vitest
- `npm run lint` -- ESLint check

## Code Style
- Functional components only (no class components)
- Use TypeScript strict mode, never use `any`
- Tailwind for styling (no CSS modules or styled-components)
- Custom hooks go in `src/hooks/`
- Shared components go in `src/components/shared/`

## File Structure
```
src/
  components/     # UI components
    shared/       # Reusable components (Button, Modal, etc.)
  hooks/          # Custom React hooks
  pages/          # Page-level components (one per route)
  lib/            # Utility functions
  types/          # TypeScript type definitions
  App.tsx         # Root component
  main.tsx        # Entry point
```

## Rules
- Every component must have TypeScript props interface
- Use `useCallback` and `useMemo` for expensive computations
- No inline styles
- Forms use controlled components with Zod validation
- API calls go through `src/lib/api.ts`
- Never commit `.env` files
