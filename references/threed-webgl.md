# 3D & WebGL — Bedrock Reference

Use sparingly. One WebGL element per page max. Always lazy-load.

## Performance Rules (Non-Negotiable)
1. `dynamic(() => import(...), { ssr: false })` — ALWAYS
2. Provide static CSS fallback for SSR/crawlers
3. Max one WebGL canvas per viewport section
4. Disable or simplify on mobile
5. Dispose geometries/materials/textures on unmount

## Components

| Need | Component | Dep | Bundle Size |
|------|-----------|-----|-------------|
| Warp speed stars | **Hyperspeed** ⭐ (ReactBits) | three | ~150KB |
| Flowing 3D lines | **Threads** (ReactBits) | three | ~150KB |
| Cinematic rays | **Beams** (ReactBits) | three | ~150KB |
| Blurred shapes | **ShapeBlur** (ReactBits) | three | ~150KB |
| AI orb (no Three!) | **SiriOrb** (SmoothUI) | motion | ~0KB |
| Bot avatar | **AgentAvatar** (SmoothUI) | motion | ~0KB |
| AI branching viz | **AIBranch** (SmoothUI) | motion | ~0KB |
| Grid loading | **GridLoader** (SmoothUI) | motion | ~0KB |
| Star particles | **GithubStarsAnimation** (SmoothUI) | motion | ~0KB |

**SiriOrb is the secret weapon** — achieves convincing 3D with pure CSS/Motion. Use when you want "3D-looking" without the Three.js payload.

## Dynamic Import Pattern (Next.js)
```tsx
import dynamic from 'next/dynamic';
const HeavyComponent = dynamic(() => import('@/components/heavy-component'), {
  ssr: false,
  loading: () => (
    <div className="w-full h-[500px] bg-muted animate-pulse rounded-lg"
         aria-label="Loading 3D content" />
  ),
});
```
