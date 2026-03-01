# Interactive Elements — Bedrock Reference

Interactive elements respond to cursor, hover, scroll, and drag. They make interfaces feel reactive.

## When to Use What
| Need | Component |
|------|-----------|
| Magnetic pull on hover | **Magnetic** ⭐ (Motion Primitives) |
| Custom cursor | **Cursor** (Motion Primitives) |
| 3D tilt on hover | **Tilt** (Motion Primitives) |
| Glow follows cursor | **GlowEffect** (Motion Primitives) |
| Spotlight on hover | **Spotlight** (Motion Primitives) |
| Before/after slider | **ImageComparison** (Motion Primitives) |
| Scroll progress bar | **ScrollProgress** (Motion Primitives) |
| macOS dock | **Dock** (Motion Primitives) |
| Decorative cursor follower | **CursorFollow** (SmoothUI) |
| Fluid cursor splash | **SplashCursor** (ReactBits) — heavy, hero only |
| Lines to cursor | **MagnetLines** (ReactBits) |
| Crosshair overlay | **Crosshair** (ReactBits) |
| Infinite scroll strip | **InfiniteSlider** (Motion Primitives) |
| Animated tab indicator | **AnimatedTabs** (SmoothUI) |
| Gradient blur on scroll | **ProgressiveBlur** (Motion Primitives) |

## Key Implementation Notes
- **Magnetic:** Intensity 0.1-0.3 = natural, 0.5+ = feels like a bug. Use on buttons/links only.
- **Tilt:** rotationFactor 10-20, add `perspective: 1000px` to parent.
- **InfiniteSlider:** Set `speedOnHover={0}` to pause on hover. Use for logo bars.
- **ScrollProgress:** Fix to top of viewport with `position: fixed`.
- **SplashCursor:** Uses canvas — heavy GPU. Mobile fallback required.
