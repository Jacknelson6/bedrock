# Backgrounds — Bedrock Reference

One background effect per viewport section max. Layer them for depth (base + texture).

## Performance Tiers
**CSS-only (<1KB):** Aurora, Beams, Noise, Squares, Waves, BlobCursor, LetterGlitch, ShapeBlur
**Motion (2-10KB):** GridMotion, AnimatedGradient, BorderTrail, StarBorder
**Three.js (50KB+):** Particles, Hyperspeed, Threads — always lazy-load, ssr: false

## When to Use What
| Need | Component |
|------|-----------|
| Elegant hero bg | **Aurora** ⭐ (northern lights, CSS-only) |
| Tech/SaaS hero | **Particles** (interactive field, Three.js) |
| Cinematic rays | **Beams** (light beams, CSS) |
| Dramatic hero | **Hyperspeed** (warp speed, Three.js) |
| Image/content grid bg | **GridMotion** (Motion) |
| Subtle texture | **Noise** (grain overlay, CSS) |
| Geometric pattern | **Squares** (animated grid, CSS) |
| Organic flow | **Waves** (sine lines, CSS) |
| Abstract 3D lines | **Threads** (flowing lines, Three.js) |
| Cursor interaction | **BlobCursor** (follows mouse, CSS) |
| Cyberpunk aesthetic | **LetterGlitch** (glitch chars, CSS) |
| Soft SaaS bg | **ShapeBlur** (blurred blobs, CSS) |
| Sparkle border | **StarBorder** (AnimateUI, Motion) |
| Color-cycling bg | **AnimatedGradient** (AnimateUI, Motion) |
| Animated border | **BorderTrail** (Motion Primitives) |

## Layering Recipes
**Elegant Dark:** Aurora (0.6) + Noise (0.04)
**Tech SaaS:** Dark bg + Particles (500, 0.3) + Noise (0.03)
**Editorial:** Light bg + ShapeBlur (0.15) + Noise (0.02)
**Cyberpunk:** LetterGlitch (0.15) + Beams (low opacity)

## SSR Notes
Backgrounds are decorative — no indexable content. Three.js backgrounds MUST use `dynamic(() => import(...), { ssr: false })`.
