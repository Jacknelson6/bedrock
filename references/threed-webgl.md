# 3D & WebGL — Bedrock Reference

Use sparingly. One WebGL element per page max. Always lazy-load.

## Performance Rules (Non-Negotiable)
1. `dynamic(() => import(...), { ssr: false })` — ALWAYS
2. Provide static CSS fallback for SSR/crawlers
3. Max one WebGL canvas per viewport section
4. Disable or simplify on mobile
5. Dispose geometries/materials/textures on unmount

## Components

| Need | Component | Three.js? | Bundle Size |
|------|-----------|-----------|-------------|
| Interactive globe | **Globe** ⭐ (ReactBits) | Yes | ~150KB |
| Warp speed stars | **Hyperspeed** (ReactBits) | Yes | ~150KB |
| Flowing 3D lines | **Threads** (ReactBits) | Yes | ~150KB |
| AI orb (no Three!) | **SiriOrb** (SmoothUI) | No | ~0KB |
| Bot avatar | **AgentAvatar** (SmoothUI) | No | ~0KB |
| AI branching viz | **AIBranch** (SmoothUI) | No | ~0KB |
| Grid loading | **GridLoader** (SmoothUI) | No | ~0KB |
| Star particles | **GithubStarsAnimation** (SmoothUI) | No | ~0KB |

**SiriOrb is the secret weapon** — achieves convincing 3D with pure CSS/Motion. Use when you want "3D-looking" without the Three.js payload.

## Dynamic Import Pattern (Next.js)
```tsx
import dynamic from 'next/dynamic';
const Globe = dynamic(() => import('@/components/globe'), {
  ssr: false,
  loading: () => (
    <div className="w-full h-[500px] bg-muted animate-pulse rounded-lg"
         aria-label="Interactive 3D globe" />
  ),
});
```
