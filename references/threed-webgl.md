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
| Warp speed stars | **Hyperspeed** ⭐ | three | ~150KB |
| Flowing 3D lines | **Threads** | three | ~150KB |
| Cinematic rays | **Beams** | three | ~150KB |
| Blurred shapes | **ShapeBlur** | three | ~150KB |
| Interactive particles | **Particles** | three | ~150KB |
| Galaxy starfield | **Galaxy** | three | ~150KB |
| 3D ball pit | **Ballpit** | three | ~150KB |
| 3D model viewer | **ModelViewer** | three | ~150KB |
| Flowing silk | **Silk** | three | ~150KB |
| Grid distortion | **GridDistortion** | three | ~150KB |
| Northern lights | **Aurora** | ogl | ~5KB |

All components are from ReactBits.

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
