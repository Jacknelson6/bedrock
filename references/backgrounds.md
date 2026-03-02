# Backgrounds — Bedrock Reference

One background effect per viewport section max. Layer them for depth (base + texture).

## Performance Tiers
**CSS-only (<1KB):** Noise, Squares, Waves, LetterGlitch, Iridescence, LiquidChrome, Orb, Balatro, Dither, Lightning, DotGrid, RippleGrid, DarkVeil, LightRays, FaultyTerminal, Plasma, Prism, GradientBlinds, Grainient, PrismaticBurst, PixelBlast, LiquidEther, ColorBends, GridScan, FloatingLines, LightPillar, PixelSnow
**OGL WebGL (<5KB):** Aurora (requires `ogl` package)
**Motion (2-10KB):** GridMotion, StarBorder
**Three.js (50KB+):** Particles, Hyperspeed, Threads, Beams, ShapeBlur, Silk, Ballpit, GridDistortion, Galaxy — always lazy-load, ssr: false
**GSAP:** BlobCursor (requires `gsap` package)

## When to Use What
| Need | Component |
|------|-----------|
| Elegant hero bg | **Aurora** ⭐ (northern lights, OGL WebGL) |
| Tech/SaaS hero | **Particles** (interactive field, Three.js) |
| Cinematic rays | **Beams** (light beams, Three.js) |
| Dramatic hero | **Hyperspeed** (warp speed, Three.js) |
| Image/content grid bg | **GridMotion** (Motion) |
| Subtle texture | **Noise** (grain overlay, CSS) |
| Geometric pattern | **Squares** (animated grid, CSS) |
| Organic flow | **Waves** (sine lines, CSS) |
| Abstract 3D lines | **Threads** (flowing lines, Three.js) |
| Cursor interaction | **BlobCursor** (follows mouse, GSAP) |
| Cyberpunk aesthetic | **LetterGlitch** (glitch chars, CSS) |
| Soft SaaS bg | **ShapeBlur** (blurred blobs, Three.js) |
| Flowing silk | **Silk** (fabric texture, Three.js) |
| Rainbow shimmer | **Iridescence** (CSS) |
| Sparkle border | **StarBorder** (Motion) |

## Layering Recipes
**Elegant Dark:** Aurora (0.6) + Noise (0.04)
**Tech SaaS:** Dark bg + Particles (500, 0.3) + Noise (0.03)
**Editorial:** Light bg + ShapeBlur (0.15) + Noise (0.02)
**Cyberpunk:** LetterGlitch (0.15) + Beams (low opacity)

## SSR Notes
Backgrounds are decorative — no indexable content. Three.js AND OGL backgrounds MUST use `dynamic(() => import(...), { ssr: false })`.
