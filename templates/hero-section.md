# Hero Section — Bedrock Template

The hero is the first thing users see. It must load fast, look stunning, and communicate the product value instantly. This template covers multiple hero variants.

## Variant A: Centered Text + Ambient Background (Most Common)

Best for: SaaS products, developer tools, B2B platforms

```
┌────────────────────────────────────┐
│          [Aurora Background]       │
│                                    │
│    ⭐ Animated Badge/Label ⭐      │
│                                    │
│     HEADLINE (TextEffect, h1)      │
│     2-3 words per line max         │
│                                    │
│   Subheadline (motion.p, fade up)  │
│   1-2 sentences, muted color       │
│                                    │
│  [Primary CTA]   [Secondary CTA]  │
│  (Magnetic wrap)  (Magnetic wrap)  │
│                                    │
│  ──── Trusted by logos ──────────  │
│  (InfiniteSlider)                  │
└────────────────────────────────────┘
```

**Components used:** TextEffect, Aurora/Particles, Magnetic, InfiniteSlider, BorderTrail (optional badge)

**Timing:**
- 0ms: Background starts animating (ambient, no delay)
- 0ms: Headline TextEffect begins (per-word blur preset)
- 300ms: Subheadline fades up
- 600ms: CTA buttons fade up
- 1000ms: Logo bar fades in

## Variant B: Split Layout — Text Left, Visual Right

Best for: Products with a visual interface to showcase

```
┌─────────────────────┬─────────────────────┐
│                     │                     │
│  Badge (TextShimmer)│   [Product Screenshot│
│                     │    or 3D Visual]    │
│  HEADLINE           │   Wrapped in Tilt   │
│  (TextEffect)       │   or with GlowEffect│
│                     │                     │
│  Subheadline        │                     │
│  (motion.p)         │                     │
│                     │                     │
│  [CTA] [CTA]        │                     │
│                     │                     │
└─────────────────────┴─────────────────────┘
```

**Components used:** TextEffect, TextShimmer, Tilt, GlowEffect, Magnetic

## Variant C: Full-Screen Visual (3D/WebGL)

Best for: Creative agencies, crypto/web3, gaming

```
┌────────────────────────────────────┐
│                                    │
│     [Full-screen Particles/Globe]  │
│                                    │
│         HEADLINE                   │
│         (BlurText or TextEffect)   │
│                                    │
│         [Single Bold CTA]          │
│         (MagneticButton)           │
│                                    │
└────────────────────────────────────┘
```

**Components used:** Particles/Globe/Hyperspeed (dynamic, ssr: false), BlurText, MagneticButton

**Performance critical:** The 3D background MUST be lazy-loaded. Provide a CSS gradient fallback that displays instantly.

## Common Hero Enhancements

### Animated Badge Above Headline
```tsx
<motion.div
  initial={{ opacity: 0, y: -10 }}
  animate={{ opacity: 1, y: 0 }}
  className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full border border-border bg-muted/50 mb-8"
>
  <BorderTrail size={3} className="bg-primary/50" />
  <span className="text-sm">
    <TextShimmer>✨ Now in public beta</TextShimmer>
  </span>
</motion.div>
```

### Gradient Text Headline
```tsx
<TextEffect as="h1" per="word" preset="blur"
  className="text-6xl font-bold bg-gradient-to-r from-foreground via-primary to-foreground bg-clip-text text-transparent">
  Build the future of the web
</TextEffect>
```

### Product Screenshot with Glow
```tsx
<Tilt rotationFactor={8} className="relative">
  <GlowEffect colors={["#3b82f6", "#8b5cf6"]} blur={80}>
    <Image src="/product-screenshot.png" alt="Product interface" width={800} height={500}
           className="rounded-xl border border-border shadow-2xl" priority />
  </GlowEffect>
</Tilt>
```

---

## SSR/SEO Checklist for Heroes

1. ✅ `<h1>` tag used for main headline (via TextEffect's `as="h1"` prop)
2. ✅ Headline text is in the DOM server-side (TextEffect renders text, animation is enhancement)
3. ✅ CTA uses `<a>` tag with `href` (not a button with onClick navigation)
4. ✅ Background component doesn't contain indexable content
5. ✅ Images use `priority` prop for LCP optimization
6. ✅ No content hidden behind JS-only rendering
