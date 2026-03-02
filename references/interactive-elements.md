# Interactive Elements — Bedrock Reference

Interactive elements respond to cursor, hover, scroll, and drag. They make interfaces feel reactive.

## When to Use What
| Need | Component |
|------|-----------|
| Magnetic pull on hover | **Magnet** ⭐ (ReactBits) |
| Fluid cursor splash | **SplashCursor** (ReactBits) — heavy, hero only |
| Lines to cursor | **MagnetLines** (ReactBits) |
| Crosshair overlay | **Crosshair** (ReactBits) |
| Infinite logo scroll | **LogoLoop** (ReactBits) |
| Scroll/mount entrance | **AnimatedContent** (ReactBits, gsap) |
| Simple fade entrance | **FadeContent** (ReactBits) |
| Click spark effect | **ClickSpark** (ReactBits) |
| Glare on hover | **GlareHover** (ReactBits) |
| Electric border | **ElectricBorder** (ReactBits) |
| Sparkle border | **StarBorder** (ReactBits) |
| Pixel transition | **PixelTransition** (ReactBits) |
| Image trail | **ImageTrail** (ReactBits) |
| Pixel trail | **PixelTrail** (ReactBits) |
| Blob cursor | **BlobCursor** (ReactBits, gsap) |
| Ghost cursor | **GhostCursor** (ReactBits) |
| Target cursor | **TargetCursor** (ReactBits) |
| Metallic paint | **MetallicPaint** (ReactBits) |
| Gradual blur | **GradualBlur** (ReactBits) |
| Sticker peel | **StickerPeel** (ReactBits) |
| Laser flow | **LaserFlow** (ReactBits) |
| Ribbons | **Ribbons** (ReactBits) |

## Key Implementation Notes
- **Magnet:** Use on buttons/links for magnetic pull toward cursor. Spring physics built-in.
- **LogoLoop:** Use for logo bars / infinite scrolling strips. Seamless infinite logo scroll.
- **AnimatedContent:** Wrapper with configurable direction, distance, duration. Uses gsap.
- **FadeContent:** Lighter alternative to AnimatedContent — no gsap needed.
- **SplashCursor:** Uses canvas — heavy GPU. Mobile fallback required.
