# Hero Section — Bedrock Composition Guide

The hero is the first thing users see. It must load fast, communicate value instantly, and feel intentional. **The best heroes are often the simplest.** Don't reach for animation before you've nailed the typography.

> **Insight from Unicorn Studio (a WebGL company):** Their hero has ONE headline, ONE subtitle, ONE button. The WebGL canvas IS the product demo, not decoration. Even a visual effects company keeps the hero copy minimal.

## Decision Framework: Which Hero?

| Product Type | Recommended Variant | Why |
|-------------|-------------------|-----|
| **SaaS / B2B** | Typography-Led (A) | Authority through type. Let the product prove itself later. |
| **Creative tool / Design** | Ambient Background (B) | The bg hints at what the tool creates. |
| **Dev tool / API** | Split with code (C) | Show the DX immediately. Devs want proof, not promises. |
| **Consumer app** | Typography + Video (D) | Emotional, fast, lifestyle-driven. |
| **Enterprise / Fintech** | Minimal (E) | Restraint = trust. No sparkle. |

---

## Variant A: Typography-Led Hero

**When to use:** Most SaaS products. When the value prop is clear and doesn't need visual proof.

The headline IS the hero. No background animation. Massive type, tight tracking, intentional line breaks.

```tsx
'use client';
import { Magnet } from '@/components/ui/magnet';
import { motion } from 'motion/react';

export function Hero() {
  return (
    <section className="min-h-[90vh] flex flex-col justify-center px-6 md:px-12">
      <div className="max-w-6xl">
        {/* Badge — monospace texture */}
        <motion.p
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ duration: 0.4 }}
          className="font-mono text-sm text-muted-foreground tracking-wider uppercase mb-8"
        >
          Now in public beta
        </motion.p>

        {/* Headline — display font at massive scale, tight tracking */}
        <h1 className="font-display text-5xl sm:text-7xl lg:text-8xl xl:text-[6.5rem] tracking-tighter leading-[0.9]">
          Build products<br />
          <span className="text-muted-foreground">people love</span>
        </h1>

        {/* Subheadline — restrained, informative */}
        <motion.p
          initial={{ opacity: 0, y: 16 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.3, type: "spring", stiffness: 200, damping: 25 }}
          className="mt-8 text-lg md:text-xl text-muted-foreground max-w-xl leading-relaxed"
        >
          The modern platform for teams who ship fast.
          From idea to production in minutes, not months.
        </motion.p>

        {/* CTAs — left-aligned, not centered */}
        <motion.div
          initial={{ opacity: 0, y: 16 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.5, type: "spring", stiffness: 200, damping: 25 }}
          className="mt-10 flex flex-wrap gap-4"
        >
          <Magnet>
            <a href="/start"
               className="px-7 py-3.5 bg-foreground text-background rounded-full text-sm font-medium">
              Start building
            </a>
          </Magnet>
          <a href="/demo"
             className="px-7 py-3.5 border border-border rounded-full text-sm font-medium hover:bg-muted transition-colors">
            Watch demo
          </a>
        </motion.div>
      </div>
    </section>
  );
}
```

**What makes this premium:**
- **Left-aligned**, not centered — feels editorial, intentional
- **Two-tone headline** — foreground + muted-foreground creates depth without color
- **Massive type with `tracking-tighter` and `leading-[0.9]`** — this mirrors Unicorn Studio's `-0.04em letter-spacing` and `line-height: 1`
- **Monospace badge** — three typeface voices (display/body/mono) = typographic richness
- **NO background animation** — the typography IS the design
- **`min-h-[90vh]` not `min-h-screen`** — the next section peeks, hinting there's more

---

## Variant B: Ambient Background Hero

**When to use:** Creative tools, visual products, brands with high energy.

```tsx
'use client';
import { SplitText } from '@/components/ui/split-text';
import { Aurora } from '@/components/ui/aurora';
import { Magnet } from '@/components/ui/magnet';
import { motion } from 'motion/react';

export function Hero() {
  return (
    <section className="relative min-h-screen flex flex-col items-center justify-center overflow-hidden px-6">
      {/* Background — ONE ambient element, LOW opacity */}
      <div className="absolute inset-0 -z-10">
        <Aurora
          colorStops={["var(--color-primary)", "#8b5cf6", "#06b6d4"]}
          speed={0.4}
          opacity={0.2}
        />
      </div>

      <div className="text-center max-w-4xl">
        <SplitText text="
          as="h1"
          per="word"
          preset="blur"
          className="font-display text-5xl md:text-7xl lg:text-8xl tracking-tighter leading-[0.9]"
        >
          Create enchanting visual experiences
        /" delay={30} />

        <motion.p
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.5, type: "spring", stiffness: 200, damping: 25 }}
          className="mt-8 text-lg md:text-xl text-muted-foreground max-w-2xl mx-auto"
        >
          In minutes, not hours. No code required.
        </motion.p>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.7, type: "spring", stiffness: 200, damping: 25 }}
          className="mt-10"
        >
          <Magnet>
            <a href="/start"
               className="inline-flex px-8 py-4 bg-primary text-primary-foreground rounded-full text-base font-medium">
              Start creating — free
            </a>
          </Magnet>
        </motion.div>
      </div>
    </section>
  );
}
```

**Background choice guide:**
| Background | Personality | Use For |
|-----------|------------|---------|
| **Aurora** | Organic, flowing | Creative/design tools |
| **Particles** | Technical, precise | Dev tools, data platforms (use `ssr: false`) |
| **CSS gradient** | Subtle, performant | When you want a hint of color without JS overhead |
| **Nothing** | Confident, editorial | When the typography is strong enough alone |

**RULE: Ambient backgrounds belong in ONE section per page** — usually the hero. Using Aurora in both the hero and footer CTA creates visual noise.

---

## Variant C: Split Hero (Product Visual)

**When to use:** Products with a UI/interface to showcase. Dev tools with code snippets.

```tsx
'use client';
import { TiltedCard } from '@/components/ui/tilted-card';
import { Magnet } from '@/components/ui/magnet';
import { motion } from 'motion/react';
import Image from 'next/image';

export function Hero() {
  return (
    <section className="min-h-screen grid lg:grid-cols-2 gap-12 lg:gap-0 items-center px-6 lg:px-12">
      {/* Left: text */}
      <div className="max-w-xl pt-24 lg:pt-0">
        <p className="font-mono text-xs tracking-widest uppercase text-muted-foreground mb-6">
          Developer Platform
        </p>
        <h1 className="font-display text-5xl lg:text-7xl tracking-tighter leading-[0.9]">
          The API for<br />modern finance
        </h1>
        <p className="mt-6 text-lg text-muted-foreground max-w-md leading-relaxed">
          Accept payments, send payouts, and build financial products
          with a unified API.
        </p>
        <div className="mt-8 flex gap-4">
          <Magnet>
            <a href="/docs"
               className="px-7 py-3.5 bg-foreground text-background rounded-full text-sm font-medium">
              Read the docs
            </a>
          </Magnet>
          <a href="/contact"
             className="px-7 py-3.5 text-sm font-medium text-muted-foreground hover:text-foreground transition-colors">
            Contact sales →
          </a>
        </div>
      </div>

      {/* Right: product visual */}
      <motion.div
        initial={{ opacity: 0, x: 40 }}
        animate={{ opacity: 1, x: 0 }}
        transition={{ delay: 0.3, type: "spring", stiffness: 150, damping: 25 }}
        className="relative"
      >
        <TiltedCard>
          <Image
            src="/product-hero.png"
            alt="Product interface"
            width={800}
            height={600}
            className="rounded-2xl border border-border/50 shadow-2xl"
            priority
          />
        </TiltedCard>
      </motion.div>
    </section>
  );
}
```

**For dev tools — code snippet variant:**
```tsx
{/* Replace the Image with a terminal/code block */}
<div className="relative rounded-2xl border border-border/50 bg-zinc-950 p-6 font-mono text-sm overflow-hidden">
  <div className="flex items-center gap-2 mb-4">
    <div className="w-3 h-3 rounded-full bg-red-500/50" />
    <div className="w-3 h-3 rounded-full bg-yellow-500/50" />
    <div className="w-3 h-3 rounded-full bg-green-500/50" />
  </div>
  <pre className="text-zinc-300 leading-relaxed overflow-x-auto">
    <code>{codeSnippet}</code>
  </pre>
</div>
```

---

## Variant D: Video Hero

**When to use:** Consumer products, lifestyle brands, products that need motion to tell their story.

```tsx
<section className="relative min-h-screen flex items-center justify-center overflow-hidden">
  <video
    autoPlay muted loop playsInline
    className="absolute inset-0 w-full h-full object-cover -z-10"
    poster="/hero-poster.jpg"
  >
    <source src="/hero-video.mp4" type="video/mp4" />
  </video>
  <div className="absolute inset-0 bg-background/60 -z-10" />

  <div className="text-center px-6">
    <h1 className="font-display text-5xl md:text-7xl lg:text-8xl tracking-tighter text-foreground">
      Move at the<br />speed of thought
    </h1>
    <p className="mt-6 text-lg text-muted-foreground max-w-lg mx-auto">
      The creative tool for teams who move fast.
    </p>
    <div className="mt-10">
      <Magnet>
        <a href="/start"
           className="px-8 py-4 bg-foreground text-background rounded-full text-base font-medium">
          Try it free
        </a>
      </Magnet>
    </div>
  </div>
</section>
```

**Video requirements:** autoplay + muted + loop + playsInline, poster image, 5-15s duration, compressed (<3MB), no audio track.

---

## Variant E: Minimal / Enterprise

**When to use:** Fintech, enterprise, regulated industries. Restraint = trust.

```tsx
<section className="pt-32 pb-20 md:pt-48 md:pb-32 px-6">
  <div className="max-w-4xl mx-auto">
    <h1 className="text-4xl md:text-6xl font-semibold tracking-tight leading-tight">
      Financial infrastructure for the internet
    </h1>
    <p className="mt-6 text-lg text-muted-foreground max-w-2xl leading-relaxed">
      Millions of businesses of every size use our platform to accept payments,
      grow their revenue, and accelerate new business opportunities.
    </p>
    <div className="mt-10 flex gap-4">
      <a href="/start"
         className="px-7 py-3.5 bg-primary text-primary-foreground rounded-lg text-sm font-medium">
        Start now
      </a>
      <a href="/contact"
         className="px-7 py-3.5 text-sm font-medium text-muted-foreground hover:text-foreground transition-colors">
        Contact sales →
      </a>
    </div>
  </div>
</section>
```

**No animations. No backgrounds. No Magnet. No SplitText.** Just clean type, proper hierarchy, and space. This is the hardest variant to execute because there's nothing to hide behind.

---

## Enhancements (Use ONE Per Hero, Not All)

### Animated Badge
```tsx
<motion.div
  initial={{ opacity: 0, y: -8 }}
  animate={{ opacity: 1, y: 0 }}
  className="inline-flex items-center gap-2 px-4 py-1.5 rounded-lg border border-border/30 bg-muted/20 mb-8"
>
  <span className="relative flex h-1.5 w-1.5">
    <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-primary opacity-75" />
    <span className="relative inline-flex rounded-full h-1.5 w-1.5 bg-primary" />
  </span>
  <span className="text-xs font-medium text-muted-foreground">Now in public beta</span>
</motion.div>
```

### Gradient Accent (On ONE word, not the entire headline)
```tsx
<h1 className="font-display text-7xl tracking-tighter leading-[0.9]">
  Ship{' '}
  <span className="bg-gradient-to-r from-primary via-purple-500 to-primary bg-clip-text text-transparent">
    faster
  </span>
</h1>
```

### Scroll Indicator (Full-height heroes only)
```tsx
<motion.div
  initial={{ opacity: 0 }}
  animate={{ opacity: 1 }}
  transition={{ delay: 1.5 }}
  className="absolute bottom-8 left-1/2 -translate-x-1/2"
>
  <motion.div
    animate={{ y: [0, 8, 0] }}
    transition={{ repeat: Infinity, duration: 1.5, ease: "easeInOut" }}
    className="w-6 h-10 rounded-full border-2 border-muted-foreground/30 flex justify-center pt-2"
  >
    <div className="w-1 h-2 rounded-full bg-muted-foreground/50" />
  </motion.div>
</motion.div>
```

---

## Checklists

### SSR/SEO
1. `<h1>` tag for main headline (SplitText renders text server-side)
2. Headline text is in the DOM — not hidden behind JS-only rendering
3. CTA uses `<a>` with `href`, not `<button>` with onClick
4. Background component doesn't contain indexable content
5. Images use `priority` prop for LCP

### Performance
1. Hero content visible without JS (progressive enhancement)
2. Background loads AFTER content (CSS fallback during load)
3. No layout shift — hero height stable (`min-h-screen` or `min-h-[90vh]`)
4. Fonts use `display: 'swap'` to prevent FOIT
5. Product images use `priority` and explicit `width`/`height`

### Typography (The Real Checklist)
1. Display font chosen deliberately, not just "Inter" for everything
2. `tracking-tighter` or `tracking-tight` on all headlines
3. `leading-[0.9]` to `leading-tight` on display text (NOT default leading)
4. Body text uses `text-muted-foreground`, never raw gray classes
5. Max-width on paragraphs (`max-w-xl` to `max-w-2xl`) for readability
6. Font loaded with `display: 'swap'` and preloaded if critical
