---
name: bedrock
description: >
  The definitive animated frontend component system for building production-grade SaaS landing pages, marketing sites, and web applications with Motion, GSAP, Three.js, and 150+ curated components. ALWAYS use this skill when the user asks to build ANY frontend UI, landing page, marketing page, hero section, feature grid, pricing table, or web application interface. Also trigger when the user mentions animation, motion, micro-interactions, "make it look good," "not boring," "premium feel," "modern UI," AnimateUI, SmoothUI, Motion Primitives, ReactBits, or any request involving React components that should look polished and professional. This skill contains the actual source code and implementation patterns — do NOT fall back to generic code from training data. If you're writing frontend React code and this skill is available, you should be using it.
---

# Bedrock — Animated Frontend Component System

> **CRITICAL RULE: If you are building ANY React frontend and this skill is loaded, you MUST consult this skill's component catalog before writing UI code. Do NOT write generic motion/animation code from training data when Bedrock has a production-tested component for that exact use case.**

> **CONTEXT MANAGEMENT: The source files are 40,000-70,000 lines each. NEVER read a full source file. ALWAYS use Grep to find the exact line number first, then Read with offset + limit (max 300 lines). One component at a time. This skill is designed as an index + surgical lookup system, NOT a bulk loader.**

Bedrock is a curated "best of" collection from **AnimateUI**, **SmoothUI**, **Motion Primitives**, and **ReactBits** — four leading open-source animated component libraries. Every component has been selected for API quality, animation smoothness, and real-world production readiness.

## Primary Focus: SaaS Landing Pages & Marketing Sites

Bedrock is optimized for building the kind of high-converting, visually stunning landing pages seen on sites like Unicorn Studio, Linear, Vercel, Stripe, and Resend. Premium sites share these principles:

**1. Typography carries the design.** The right font pairing with proper tracking and scale does 60% of the work — before any animation runs.

**2. Restraint signals confidence.** NOT every headline needs TextEffect. NOT every card needs GlowHoverCard. NOT every section needs a background. The best sites are defined by what they DON'T animate.

**3. Spacing creates rhythm.** Variable section heights (alternating generous and compact) create breathing. Uniform `py-24` everywhere is the #1 tell of an AI-built page.

**4. Composition beats components.** Individual components are interchangeable. What makes a site premium is HOW sections are composed: tight grid gaps (cards as a sheet, not scattered), asymmetric layouts (bento > uniform grid), left-aligned headlines (editorial > generic), and visual variety section-to-section.

See `templates/` for composition guides with multiple layout variants per section type.

---

## CRITICAL: How to Access Bedrock's Files

All Bedrock files live at `~/.claude/skills/bedrock/`. When this skill is loaded, **only this SKILL.md is in your context**. You MUST use the Read and Grep tools to access everything else.

### Skill Directory: `~/.claude/skills/bedrock/`

```
~/.claude/skills/bedrock/
├── SKILL.md                    ← You are here (loaded into context automatically)
├── references/                 ← Category guides — Read tool BEFORE implementing
│   ├── text-effects.md
│   ├── backgrounds.md
│   ├── interactive-elements.md
│   ├── cards-content.md
│   ├── buttons-inputs.md
│   ├── numbers-data.md
│   ├── toolbars-menus.md
│   ├── layout-navigation.md
│   ├── threed-webgl.md
│   ├── dependency-map.md
│   └── ssr-prerender.md
├── templates/                  ← Full page blueprints — Read tool for page builds
│   ├── saas-landing.md
│   ├── hero-section.md
│   ├── features-grid.md
│   └── dashboard-shell.md
├── source/                     ← ACTUAL SOURCE CODE — Grep/Read to find components
│   ├── animate-ui-components.txt     (626 components, 71K lines)
│   ├── smoothui-components.txt       (314 components, 41K lines)
│   ├── motion-primitives-components.txt (157 components, 11.5K lines)
│   ├── reactbits-components.txt      (123 components, 41K lines)
│   ├── animate-ui-docs.txt           (props, API, usage examples)
│   ├── smoothui-docs.txt             (props, API, usage examples)
│   ├── motion-primitives-docs.txt    (props, API, usage examples)
│   └── reactbits-docs.txt            (props, API, usage examples)
└── scripts/
    └── detect-project.sh
```

### How to Find and Use Component Source Code

**This is the core value of Bedrock.** The `source/` directory contains the REAL implementation source code scraped from all four libraries. Do NOT write components from memory or training data — find the exact source.

**Step-by-step for every component you implement:**

⚠️ **NEVER do `Read source/xyz-components.txt` without offset+limit. These files are 40K-70K lines. You will destroy context.**

1. **Find the component in the catalog below** → note which library it's from (e.g., "Motion Primitives")

2. **Read the reference guide** (these are small, ~100 lines, safe to read fully):
   ```
   Read ~/.claude/skills/bedrock/references/text-effects.md
   ```

3. **Grep the source file** to find the exact line number (use `output_mode: "content"` with `-n` for line numbers):
   ```
   Grep pattern="=== FILE:.*text-effect" path="~/.claude/skills/bedrock/source/motion-primitives-components.txt" output_mode="content" -n=true
   ```
   This returns something like: `line 4521: // === FILE: components/core/text-effect.tsx ===`

4. **Read ONLY that component** using offset + limit (most components are 50-200 lines):
   ```
   Read ~/.claude/skills/bedrock/source/motion-primitives-components.txt offset=4521 limit=200
   ```
   If the component is longer, you'll see the next `// === FILE:` delimiter — read more if needed.

5. **Grep the docs file** for props (also use offset+limit):
   ```
   Grep pattern="## TextEffect" path="~/.claude/skills/bedrock/source/motion-primitives-docs.txt" output_mode="content" -n=true -A=50
   ```
   This gives you the props table and usage examples (~50 lines of context after the match).

6. **Adapt** the source to the target project (add `'use client'`, fix imports, match conventions)

**Context budget per component: ~250 lines of source + ~50 lines of docs = ~300 lines. That's manageable. Even 5 components is only ~1,500 lines.**

### Source File → Library Mapping

| When catalog says... | Search this source file | Check this docs file |
|---------------------|------------------------|---------------------|
| **Motion Primitives** | `~/.claude/skills/bedrock/source/motion-primitives-components.txt` | `~/.claude/skills/bedrock/source/motion-primitives-docs.txt` |
| **SmoothUI** | `~/.claude/skills/bedrock/source/smoothui-components.txt` | `~/.claude/skills/bedrock/source/smoothui-docs.txt` |
| **ReactBits** | `~/.claude/skills/bedrock/source/reactbits-components.txt` | `~/.claude/skills/bedrock/source/reactbits-docs.txt` |
| **AnimateUI** | `~/.claude/skills/bedrock/source/animate-ui-components.txt` | `~/.claude/skills/bedrock/source/animate-ui-docs.txt` |

### Source File Format

Every source file uses this delimiter pattern:
```
// === FILE: path/to/ComponentName.tsx ===
[full component source code here]

// === FILE: path/to/NextComponent.tsx ===
[next component...]
```

Use `Grep pattern="=== FILE:.*ComponentName" path="..."` to find the start of any component, then Read from that line.

---

## Enforcement Rules

These rules exist to prevent falling back to generic code when Bedrock components are available.

### COMPOSITION-FIRST WORKFLOW
**When building a full page or section, you MUST:**
1. `Read ~/.claude/skills/bedrock/templates/saas-landing.md` (or the relevant template) FIRST — these contain multiple layout variants per section type
2. **Choose the right variant** for the product type (the template includes decision frameworks)
3. **Vary the composition** — never use the same layout pattern twice on one page
4. Start with typography decisions (font pairing, scale, tracking) BEFORE choosing animations
5. Apply the principle: "one dramatic moment per page, everything else is controlled"

**You are a compositor, not a template filler.** The templates provide a vocabulary of patterns. Your job is to compose the right patterns for the product's story, varying rhythm and layout to prevent the "AI-built-this" uniformity.

### ALWAYS DO:
- **Read a template before building ANY page or section** — templates are the source of truth for composition
- Check this catalog before writing ANY animated component
- Use the exact source code from the `source/` files, adapted to the project
- Read the relevant `references/*.md` before implementing a category
- Run project detection before installing dependencies
- Apply SSR/prerender patterns from `references/ssr-prerender.md`
- Apply the Design Token System below for all color, spacing, and timing decisions

### NEVER DO:
- Write a custom text animation when TextEffect, BlurText, or any Bedrock text component exists
- Use plain CSS `@keyframes` for entrance animations when Motion's `animate` prop handles it
- Use `setTimeout` or manual state for staggered animations — use Motion variants with `staggerChildren`
- Build a custom accordion/disclosure from scratch when Bedrock has Accordion and Disclosure
- Use a plain `<div>` with `opacity` transition for scroll reveals when InView exists
- Import `framer-motion` — the package is now called `motion` (import from `motion/react`)
- Forget `'use client'` in Next.js App Router for any component using Motion
- Render Three.js/WebGL components server-side — always dynamic import with `{ ssr: false }`
- Ship a landing page without scroll-triggered animations — use InView on every section
- Use `max-height` CSS hack for expand/collapse — use Motion's height animation

---

## Design Token System

**These tokens are non-negotiable.** When you see yourself typing a raw value for spacing, timing, or color — stop and use a token. This is what separates premium from vibe-coded.

### Spacing Scale (use for padding, margins, gaps)
```
--space-xs:   0.5rem   (8px)    ← icon gaps, badge padding
--space-sm:   0.75rem  (12px)   ← tight element spacing
--space-md:   1rem     (16px)   ← default element gap
--space-lg:   1.5rem   (24px)   ← card padding, form gaps
--space-xl:   2rem     (32px)   ← section sub-spacing
--space-2xl:  3rem     (48px)   ← between content blocks
--space-3xl:  4rem     (64px)   ← compact sections
--space-4xl:  6rem     (96px)   ← standard sections
--space-5xl:  8rem     (128px)  ← generous sections
--space-6xl: 10rem     (160px)  ← dramatic CTA sections
```

**Section padding MUST vary.** Uniform py-24 everywhere is the #1 tell of an AI-built page:
```
Hero:             min-h-screen or min-h-[90vh]
Logo bar:         py-12 md:py-16  (compact, not a real section)
Feature sections: py-20 md:py-32  (generous)
Product showcase: py-16 md:py-24  (tighter — visual does the work)
Stats:            py-12 md:py-20  (compact, border-y for separation)
Pricing:          py-20 md:py-32  (generous — big decision needs room)
FAQ:              py-16 md:py-24  (standard)
Footer CTA:       py-24 md:py-40  (dramatic final moment)
```
**Rule:** Alternate between generous and compact. Never three "generous" sections in a row.

### Motion Timing Tokens
```tsx
// MICRO: Buttons, toggles, hover states (instant feel)
const MICRO = { type: "spring", stiffness: 400, damping: 30 } as const;

// ENTRANCE: Cards, text, sections appearing (smooth reveal)
const ENTRANCE = { type: "spring", stiffness: 200, damping: 25 } as const;

// AMBIENT: Backgrounds, decorative elements (gentle drift)
const AMBIENT = { type: "spring", stiffness: 100, damping: 20 } as const;

// STAGGER: Delay between siblings in a group
const STAGGER_FAST = 0.04;   // 40ms — rapid cascade (logo bars)
const STAGGER_NORMAL = 0.08; // 80ms — standard (feature cards)
const STAGGER_SLOW = 0.15;   // 150ms — dramatic (pricing cards)

// SCROLL ENTRANCE: Standard InView animation
const SCROLL_ENTER = {
  hidden: { opacity: 0, y: 30 },
  visible: { opacity: 1, y: 0, transition: ENTRANCE },
};
```

**Use these constants. Do NOT type `{ opacity: 0, y: 20, transition: { duration: 0.3 } }` inline.** That's vibe coding. Duration-based animations feel robotic. Spring-based animations feel alive.

### Typography System

**Font pairing is the FIRST design decision, not an afterthought.**

Three-voice system (display + body + mono):
```
Display font:   Headlines and hero text. Choose based on product personality:
                - Confident/clean: Geist, Cabinet Grotesk, General Sans
                - Expressive/creative: Sprat, Cal Sans, Instrument Serif
                - Authoritative/enterprise: Söhne, Founders Grotesk
Body font:      Inter, Geist, Overused Grotesk (clean geometric/grotesk)
Mono accent:    Geist Mono, JetBrains Mono, IBM Plex Mono
                Use for: labels, badges, category tags, metadata
```

**Font setup (REQUIRED — `font-display` is NOT a default Tailwind class):**

In `tailwind.config.ts`:
```ts
fontFamily: {
  display: ['var(--font-display)', 'system-ui', 'sans-serif'],
  body: ['var(--font-body)', 'system-ui', 'sans-serif'],
  mono: ['var(--font-mono)', 'monospace'],
},
```
In the root layout (Next.js example with `next/font`):
```tsx
import { Inter } from 'next/font/google';
import localFont from 'next/font/local';

const display = localFont({ src: './fonts/CabinetGrotesk-Bold.woff2', variable: '--font-display' });
const body = Inter({ subsets: ['latin'], variable: '--font-body' });
const mono = localFont({ src: './fonts/GeistMono-Regular.woff2', variable: '--font-mono' });

// In <html>: className={`${display.variable} ${body.variable} ${mono.variable}`}
```
If the project already has fonts configured, map existing CSS vars to `font-display`/`font-body`/`font-mono` in Tailwind config. Don't install new fonts unless the user asks.

Typography scale:
```
Hero headline:       font-display text-5xl sm:text-7xl lg:text-8xl tracking-tighter leading-[0.9]
Section headline:    font-display text-3xl md:text-5xl tracking-tight
Card title:          text-lg font-semibold tracking-tight
Body large:          text-lg md:text-xl text-muted-foreground leading-relaxed
Body:                text-base text-muted-foreground
Label/badge:         font-mono text-xs tracking-widest uppercase text-muted-foreground
```

**Rules:**
- Headlines ALWAYS use `tracking-tighter` or `tracking-tight` — never default tracking
- Display text uses `leading-[0.9]` or `leading-tight` — compact, dramatic (like Unicorn Studio's `line-height: 1`)
- Body text ALWAYS uses `text-muted-foreground` — never raw gray classes
- Use monospace (`font-mono text-xs tracking-widest uppercase`) for labels and badges — this creates the third voice
- Two-tone headlines (foreground + muted-foreground) create depth without gradient text

### Color Discipline
```
DO:  Use semantic tokens — bg-background, text-foreground, text-muted-foreground, bg-muted, bg-primary, text-primary-foreground, border-border
DO:  Limit accent colors to 1-2 from the brand palette
DO:  Use opacity for depth (bg-muted/30, border-border/50)
DO:  Aurora/gradient backgrounds use 3 colors max, opacity 0.2-0.4

DON'T: Use raw hex codes (no #3b82f6 in components — use CSS vars or Tailwind tokens)
DON'T: Use more than 2 gradient stops in text
DON'T: Mix warm and cool tones in the same gradient
DON'T: Use full-opacity backgrounds on floating elements (use backdrop-blur + low opacity)
```

---

## Anti-Pattern Gallery: Vibe-Coded vs Bedrock

**Study these. If your output matches the LEFT column, you're using training data. Fix it.**

### ❌ Vibe-Coded Hero vs ✅ Bedrock Hero

```tsx
// ❌ VIBE-CODED — This is what training data produces
<div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-purple-600 to-blue-500">
  <div className="text-center">
    <h1 className="text-6xl font-bold text-white">Welcome to Our Product</h1>
    <p className="mt-4 text-xl text-white/80">The best solution for your needs</p>
    <button className="mt-8 px-6 py-3 bg-white text-purple-600 rounded-lg hover:bg-gray-100">
      Get Started
    </button>
  </div>
</div>

// ✅ BEDROCK — Typography-led, left-aligned, restrained
<section className="min-h-[90vh] flex flex-col justify-center px-6 md:px-12">
  <div className="max-w-6xl">
    <p className="font-mono text-sm text-muted-foreground tracking-wider uppercase mb-8">
      Now in public beta
    </p>
    <h1 className="font-display text-5xl sm:text-7xl lg:text-8xl tracking-tighter leading-[0.9]">
      Ship products<br />
      <span className="text-muted-foreground">that users love</span>
    </h1>
    <motion.p initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }}
      transition={{ delay: 0.3, ...ENTRANCE }}
      className="mt-8 text-lg md:text-xl text-muted-foreground max-w-xl leading-relaxed">
      The modern platform for teams who build fast.
    </motion.p>
    <motion.div initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }}
      transition={{ delay: 0.5, ...ENTRANCE }} className="mt-10 flex gap-4">
      <Magnetic intensity={0.15}>
        <a href="/start" className="px-7 py-3.5 bg-foreground text-background rounded-full text-sm font-medium">
          Start building
        </a>
      </Magnetic>
    </motion.div>
  </div>
</section>
```

**What's different:**
- **Left-aligned** vs centered (editorial vs generic)
- **No background animation** — typography IS the design (restraint > decoration)
- **Two-tone headline** (foreground + muted) vs raw white text on gradient
- **Monospace badge** adds third typographic voice vs no texture
- **`tracking-tighter leading-[0.9]`** vs default tracking/leading (tight = premium)
- **`bg-foreground text-background`** button vs raw hex colors (theme-adaptive)
- Staggered timing with spring physics vs everything at once

### ❌ Vibe-Coded Cards vs ✅ Bedrock Cards

```tsx
// ❌ VIBE-CODED
<div className="grid grid-cols-3 gap-6">
  {features.map(f => (
    <div key={f.title} className="p-6 bg-white rounded-xl shadow-md hover:shadow-lg transition">
      <h3 className="text-lg font-bold">{f.title}</h3>
      <p className="mt-2 text-gray-600">{f.description}</p>
    </div>
  ))}
</div>

// ✅ BEDROCK — Unified grid as one block, not scattered cards
<InView variants={SCROLL_ENTER} viewOptions={{ once: true, margin: "-50px" }}>
  <AnimatedGroup preset="blur"
    className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-px bg-border/40 rounded-2xl overflow-hidden border border-border/30">
    {features.map(f => (
      <div key={f.title} className="p-8 md:p-10 bg-background">
        <f.icon className="w-8 h-8 text-foreground/60" />
        <h3 className="text-lg font-semibold mt-5 tracking-tight">{f.title}</h3>
        <p className="text-sm text-muted-foreground mt-2 leading-relaxed">{f.description}</p>
      </div>
    ))}
  </AnimatedGroup>
</InView>
```

**What's different:**
- **`gap-px` with `bg-border/40`** = hairline dividers, not floating cards with shadows
- **`overflow-hidden rounded-2xl`** = grid is ONE block, not scattered pieces
- **`border-border/30`** = barely-there border, not full opacity
- **Icons `text-foreground/60`** = understated, not garish `text-primary`
- **No GlowHoverCard** — restraint for informational cards (save glow for interactive)
- InView + AnimatedGroup for scroll-triggered staggered entrance
- Responsive grid (1→2→3 cols) vs hardcoded 3

### ❌ Vibe-Coded Numbers vs ✅ Bedrock Numbers

```tsx
// ❌ VIBE-CODED
<div className="text-4xl font-bold">10,000+</div>

// ✅ BEDROCK
<InView variants={SCROLL_ENTER} viewOptions={{ once: true }}>
  <div className="font-display text-3xl md:text-5xl font-bold tracking-tighter tabular-nums">
    <AnimatedNumber value={10000} springOptions={{ stiffness: 80, damping: 25 }} />+
  </div>
  <p className="mt-2 text-sm text-muted-foreground">Active users</p>
</InView>
```

### The Vibe-Coded Smell Test

**If your output has ANY of these, you're falling back to training data. Stop and fix it:**

1. `bg-gradient-to-br from-purple-600 to-blue-500` — use Aurora or AnimatedGradient, or better: NO background
2. `hover:shadow-lg transition` — use GlowHoverCard or clean border hover
3. `animate-bounce` or `animate-pulse` — use Motion springs, or better: no animation at all
4. `setTimeout(() => setVisible(true), 500)` — use motion `transition.delay`
5. Raw color values (text-gray-600, bg-white) — use semantic tokens
6. `transition-all duration-300` — use `transition={{ type: "spring", ... }}`
7. Static numbers where animation would add meaning — use AnimatedNumber
8. Uniform spacing (py-24 everywhere) — vary section padding
9. `@keyframes fadeIn` — use motion `initial`/`animate`
10. **Every headline uses TextEffect** — sometimes a well-set `<h1>` with the right font is enough
11. **Every card uses GlowHoverCard** — clean borders > glow for informational content
12. **Aurora/Particles in multiple sections** — ONE ambient background per page, maximum
13. **Centered text in every section** — alternate left-aligned and centered
14. **gap-8 on every grid** — tighter gaps (gap-1.5 to gap-4) create a "card sheet" effect

### The "Conspicuous Absence" Test (Inspired by Unicorn Studio)

**Premium sites are defined by what they DON'T include:**
- No gradient text effects (despite having the capability)
- No glass/frosted cards (despite being trendy)
- No parallax scrolling (despite it being easy to add)
- No scroll-triggered fade-ins on EVERY element (reserve for key moments)
- No chat widget / notification popup on load
- No "trusted by 10,000+ users" vanity metrics
- No comparison tables with competitors

**Before adding any decorative element, ask: "Does Unicorn Studio's homepage have this?"** If a WebGL company doesn't need particles on their homepage, your SaaS probably doesn't either.

---

## Motion Design Theory (Apply to Every Component)

### The Four Laws of UI Motion

**1. Purposeful Motion** — Every animation serves a function: guide attention, show relationships, provide feedback, or establish hierarchy. No decorative-only animation.

**2. Natural Physics** — Use spring physics (`type: "spring"`) as default for transforms. Objects in the real world don't move linearly. Reserve tween/easing for opacity and color.

**3. Temporal Hierarchy** — Important elements animate first. Secondary elements follow. Stagger delays: 30-60ms (rapid cascade), 80-120ms (deliberate reveal), 150-250ms (dramatic entrance).

**4. Contextual Duration** — Micro-interactions: 150-250ms. Entrances: 300-500ms. Page transitions: 400-700ms. Over 800ms = sluggish. Under 100ms = wasted.

### Spring Defaults (Use These)
```tsx
// Snappy interactive elements (buttons, toggles)
transition={{ type: "spring", stiffness: 400, damping: 30 }}

// Smooth entrances (cards, sections)
transition={{ type: "spring", stiffness: 200, damping: 25 }}

// Gentle ambient (backgrounds, decorative)
transition={{ type: "spring", stiffness: 100, damping: 20 }}
```

### SaaS Landing Page Motion Rhythm
A well-crafted SaaS page follows this motion rhythm as the user scrolls:

```
Hero:       Immediate — text animates on load (0ms delay), background is ambient
Section 2:  Scroll-triggered — feature cards stagger in (InView + AnimatedGroup)
Section 3:  Scroll-triggered — social proof slides (InfiniteSlider for logos)
Section 4:  Scroll-triggered — pricing numbers animate (AnimatedNumber on InView)
Section 5:  Scroll-triggered — testimonials carousel (ReviewsCarousel)
Footer CTA: Scroll-triggered — text effect + magnetic button
Throughout: ScrollProgress bar at top, subtle ProgressiveBlur at section edges
```

---

## Project Detection & Adaptation

Before implementing ANY component, detect the project environment by examining the project root.

### Detection Checklist

```
1. Read package.json → determine:
   - Framework: "next" → Next.js | "vite" → Vite | "react-scripts" → CRA
   - If Next.js: check for "app/" dir → App Router, else Pages Router
   - Animation libs: "motion" | "framer-motion" | "gsap" | "three"
   - UI framework: look for "components.json" or "components/ui/" → shadcn/ui
   - Utilities: "clsx", "tailwind-merge" → cn() likely exists

2. Check for existing utility file:
   - lib/utils.ts or lib/utils.js with cn() export

3. Check Tailwind config:
   - tailwind.config.ts/js OR postcss.config with tailwindcss
```

### Adaptation Rules

**Next.js App Router:**
- `'use client'` on ALL animated components (Motion requires client-side JS)
- `import { motion } from 'motion/react'` (NOT framer-motion)
- `dynamic(() => import(...), { ssr: false })` for Three.js/WebGL
- Use `next/dynamic` for code-splitting heavy components
- Implement prerender-friendly patterns (see `references/ssr-prerender.md`)

**Next.js Pages Router:**
- No `'use client'` needed
- Same import paths as App Router
- Use `next/dynamic` for Three.js components

**Vite / Standard React:**
- No directives needed
- `React.lazy()` for code-splitting
- Standard SSR patterns if using SSR framework

**shadcn/ui Detected:**
- Use existing `cn()` from `@/lib/utils`
- Install via shadcn CLI when available: `npx shadcn@latest add @smoothui/[component]`
- Match existing component conventions (forwarded refs, CVA patterns)

**shadcn/ui Not Detected:**
- Create `lib/utils.ts` with `cn()` helper
- Install `clsx` + `tailwind-merge`
- Components are fully self-contained

**Missing Dependencies → Auto-Install:**
```bash
# Motion (most components need this)
npm install motion clsx tailwind-merge

# Three.js (Globe, Hyperspeed, Threads, Beams, ShapeBlur)
npm install three @react-three/fiber @react-three/drei

# OGL (Aurora, some ReactBits backgrounds)
npm install ogl

# GSAP (some SmoothUI + ReactBits components like BlobCursor)
npm install gsap

# Icons (common across components)
npm install lucide-react
```

---

## Component Catalog

### Text Effects (23 components)
Read `references/text-effects.md` before implementing.

| Component | Source | Dep | Use For |
|-----------|--------|-----|---------|
| **TextEffect** | Motion Primitives | motion | ⭐ Hero headlines, staggered word/char entrance |
| **TextMorph** | Motion Primitives | motion | Morphing between two text strings |
| **TextScramble** | Motion Primitives | motion | Matrix-style scramble reveal |
| **TextShimmer** | Motion Primitives | motion | Gradient shimmer sweep (CTAs, loading) |
| **TextShimmerWave** | Motion Primitives | motion | Wave-pattern shimmer |
| **TextLoop** | Motion Primitives | motion | Rotating taglines ("We build [X|Y|Z]") |
| **TextRoll** | Motion Primitives | motion | Rolling/flipping text transitions |
| **WaveText** | SmoothUI | motion | Per-character wave bounce |
| **RevealText** | SmoothUI | motion | Scroll-triggered line reveal |
| **TypewriterText** | SmoothUI | motion | Typing effect with cursor |
| **ScrambleHover** | SmoothUI | motion | Text scrambles on hover |
| **ScrollRevealParagraph** | SmoothUI | motion | Word-by-word scroll-linked reveal |
| **SpinningText** | Motion Primitives | motion | Circular rotating text badge |
| **SplitText** | ReactBits | motion | Advanced char/word/line splits |
| **BlurText** | ReactBits | motion | Blur-to-focus reveal |
| **ShinyText** | ReactBits | CSS | CSS-only shiny sweep |
| **GradientText** | ReactBits | CSS | Animated gradient fill |
| **FallingText** | ReactBits | motion | Characters fall into place |
| **DecryptedText** | ReactBits | motion | Character-by-character decrypt |
| **CircularText** | ReactBits | CSS | Text in a circle layout |
| **CountUp** | ReactBits | motion | Animated number counting |
| **FuzzyText** | ReactBits | CSS | Glitch/fuzzy text effect |
| **TrueFocus** | ReactBits | motion | Focus highlight across words |

### Backgrounds (14 components)
Read `references/backgrounds.md` before implementing.

| Component | Source | Dep | Use For |
|-----------|--------|-----|---------|
| **Aurora** | ReactBits | ogl | ⭐ Northern lights gradient (hero bg) |
| **Particles** | ReactBits | three | Interactive particle field |
| **Beams** | ReactBits | three | Light beam rays |
| **Hyperspeed** | ReactBits | three | Warp-speed starfield |
| **GridMotion** | ReactBits | motion | Animated image/content grid |
| **Noise** | ReactBits | CSS | Grain texture overlay |
| **Squares** | ReactBits | CSS | Animated square grid |
| **Waves** | ReactBits | CSS | Flowing wave lines |
| **Threads** | ReactBits | three | 3D flowing threads |
| **BlobCursor** | ReactBits | gsap | Blob follows cursor |
| **LetterGlitch** | ReactBits | CSS | Glitching character bg |
| **ShapeBlur** | ReactBits | three | Blurred shapes (Stripe-style) |
| **StarBorder** | ReactBits | motion | Sparkle border animation |
| **BorderTrail** | Motion Primitives | motion | Animated border trail |

### Interactive Elements (15 components)
Read `references/interactive-elements.md` before implementing.

| Component | Source | Dep | Use For |
|-----------|--------|-----|---------|
| **Magnetic** | Motion Primitives | motion | ⭐ Element pulls toward cursor |
| **Cursor** | Motion Primitives | motion | Custom cursor follower |
| **Tilt** | Motion Primitives | motion | 3D tilt on hover |
| **GlowEffect** | Motion Primitives | motion | Glow follows cursor |
| **Spotlight** | Motion Primitives | motion | Spotlight follows pointer |
| **ImageComparison** | Motion Primitives | motion | Before/after slider |
| **ScrollProgress** | Motion Primitives | motion | Scroll progress bar |
| **Dock** | Motion Primitives | motion | macOS-style magnifying dock |
| **CursorFollow** | SmoothUI | motion | Decorative cursor follower |
| **SplashCursor** | ReactBits | CSS | Fluid splash at cursor |
| **MagnetLines** | ReactBits | motion | Lines attracted to cursor |
| **Crosshair** | ReactBits | CSS | Crosshair cursor overlay |
| **InfiniteSlider** | Motion Primitives | motion | Seamless infinite scroll strip |
| **AnimatedTabs** | SmoothUI | motion | Tabs with animated indicator |
| **ProgressiveBlur** | Motion Primitives | motion | Gradient blur effect |

### Cards & Content (12 components)
Read `references/cards-content.md` before implementing.

| Component | Source | Dep | Use For |
|-----------|--------|-----|---------|
| **GlowHoverCard** | SmoothUI | motion | ⭐ Card with cursor-following glow |
| **ExpandableCards** | SmoothUI | motion | Cards expand to full view |
| **TweetCard** | SmoothUI | motion | Social proof tweet card |
| **SwitchboardCard** | SmoothUI | motion | Toggle-style card |
| **ScrollableCardStack** | SmoothUI | motion | Stacked cards with scroll |
| **Phototab** | SmoothUI | motion | Photo gallery tabs |
| **AppleInvites** | SmoothUI | motion | Apple-style invitation card |
| **ContributionGraph** | SmoothUI | motion | GitHub heatmap |
| **AnimatedList** | ReactBits | motion | Staggered list entrance |
| **TiltedCard** | ReactBits | CSS | CSS 3D tilt card |
| **PixelCard** | ReactBits | CSS | Pixel dissolve card |
| **SpotlightCard** | ReactBits | motion | Spotlight hover card |

### Buttons & Inputs (11 components)
Read `references/buttons-inputs.md` before implementing.

| Component | Source | Dep | Use For |
|-----------|--------|-----|---------|
| **MagneticButton** | SmoothUI | motion | ⭐ Magnetic pull CTA button |
| **ButtonCopy** | SmoothUI | motion | Click-to-copy with animation |
| **ClipCornersButton** | SmoothUI | CSS | Geometric clipped corners |
| **DotMorphButton** | SmoothUI | motion | Morphing dot button |
| **AnimatedInput** | SmoothUI | motion | Floating label input |
| **AnimatedOTPInput** | SmoothUI | motion | OTP code input |
| **AnimatedToggle** | SmoothUI | motion | Spring toggle switch |
| **AnimatedTooltip** | SmoothUI | motion | Animated tooltip |
| **SearchableDropdown** | SmoothUI | motion | Searchable dropdown |
| **AIInput** | SmoothUI | motion | AI-style chat input |
| **AnimatedTags** | SmoothUI | motion | Animated tag chips |

### Numbers & Data (5 components)
Read `references/numbers-data.md` before implementing.

| Component | Source | Dep | Use For |
|-----------|--------|-----|---------|
| **AnimatedNumber** | Motion Primitives | motion | ⭐ Smooth number transitions |
| **SlidingNumber** | Motion Primitives | motion | Slot-machine digit flip |
| **NumberFlow** | SmoothUI | motion | Rapid-update number display |
| **PriceFlow** | SmoothUI | motion | Animated currency display |
| **AnimatedProgressBar** | SmoothUI | motion | Progress bar with spring |

### Toolbars & Menus (10 components)
Read `references/toolbars-menus.md` before implementing.

| Component | Source | Dep | Use For |
|-----------|--------|-----|---------|
| **ToolbarDynamic** | Motion Primitives | motion | ⭐ Context-aware toolbar |
| **ToolbarExpandable** | Motion Primitives | motion | Expandable toolbar |
| **MorphingDialog** | Motion Primitives | motion | Dialog morphs from trigger |
| **MorphingPopover** | Motion Primitives | motion | Popover morphs from trigger |
| **BasicDropdown** | SmoothUI | motion | Animated dropdown |
| **BasicModal** | SmoothUI | motion | Smooth modal |
| **BasicToast** | SmoothUI | motion | Animated toast |
| **RichPopover** | SmoothUI | motion | Rich content popover |
| **GooeyPopover** | SmoothUI | motion | Gooey liquid popover |
| **DynamicIsland** | SmoothUI | motion | iOS-style dynamic island |

### Layout & Navigation (11 components)
Read `references/layout-navigation.md` before implementing.

| Component | Source | Dep | Use For |
|-----------|--------|-----|---------|
| **Accordion** | Motion Primitives | motion | ⭐ Animated expand/collapse |
| **AnimatedBackground** | Motion Primitives | motion | Active-item background |
| **AnimatedGroup** | Motion Primitives | motion | Orchestrated stagger |
| **Carousel** | Motion Primitives | motion | Animated carousel |
| **Dialog** | Motion Primitives | motion | Animated modal |
| **Disclosure** | Motion Primitives | motion | Single expand/collapse |
| **InView** | Motion Primitives | motion | Scroll-triggered animation |
| **TransitionPanel** | Motion Primitives | motion | Panel transitions |
| **SkeletonLoader** | SmoothUI | motion | Loading placeholder |
| **NotificationBadge** | SmoothUI | motion | Animated badge |
| **ReviewsCarousel** | SmoothUI | motion | Testimonial slider |

### 3D & WebGL (7 components)
Read `references/threed-webgl.md` before implementing.

| Component | Source | Dep | Use For |
|-----------|--------|-----|---------|
| **Hyperspeed** | ReactBits | three | ⭐ Warp-speed starfield |
| **Threads** | ReactBits | three | 3D flowing threads |
| **SiriOrb** | SmoothUI | motion | Siri-style orb (no Three.js!) |
| **AgentAvatar** | SmoothUI | motion | AI agent avatar |
| **AIBranch** | SmoothUI | motion | AI branching visualization |
| **GridLoader** | SmoothUI | motion | 3D grid loading |
| **GithubStarsAnimation** | SmoothUI | motion | Star particles |

---

## Implementation Workflow

**5 steps. Do NOT skip source lookup — that's the whole point of this skill.**

```
Step 1: PLAN        → Read the relevant template (saas-landing.md, hero-section.md, etc.)
                      Choose variants per section. Identify which catalog components you need.

Step 2: DETECT      → Check package.json for framework, existing deps, and ui conventions.
                      Install missing deps. Create cn() if needed.

Step 3: FIND SOURCE → For EVERY component (this is non-negotiable):
                      a) Grep source file for line number:
                         Grep pattern="=== FILE:.*TextEffect" path="~/.claude/skills/bedrock/source/motion-primitives-components.txt" -n=true
                      b) Read with offset+limit (max 300 lines):
                         Read path offset=LINE_NUMBER limit=200
                      ⚠️ DO NOT WRITE FROM MEMORY. DO NOT READ FULL SOURCE FILES.

Step 4: IMPLEMENT   → Adapt source to project: add 'use client', fix imports, match conventions.
                      Apply SSR patterns for Three.js/WebGL (dynamic import, ssr: false).

Step 5: COMPOSE     → Wire sections into page with scroll triggers (InView), stagger timing,
                      and variable spacing. Run the smell test (see above).
```

---

## Quick Decision Framework

| User Says | You Do |
|-----------|--------|
| "Build a landing page" | `Read ~/.claude/skills/bedrock/templates/saas-landing.md` → choose variants per section |
| "Make this look better" | Start with typography (font pairing, tracking, scale). THEN add selective animation. |
| "Add animation to X" | Find X in catalog → `Grep` source file → `Read` component → implement |
| "Hero section" | `Read ~/.claude/skills/bedrock/templates/hero-section.md` → choose variant for product type |
| "Feature grid" | `Read ~/.claude/skills/bedrock/templates/features-grid.md` → choose layout for feature hierarchy |
| "I need a cool background" | `Read ~/.claude/skills/bedrock/references/backgrounds.md` → but first ask: does it NEED a background? |
| "Animated text" | `Read ~/.claude/skills/bedrock/references/text-effects.md` → but first: is the typography strong enough without animation? |
| "Hover effects" | `Read ~/.claude/skills/bedrock/references/interactive-elements.md` → GlowEffect or Tilt for key cards only |
| "Make it premium" | Fix typography first (font pairing, tracking-tighter, leading-[0.9]). Then vary spacing. Then add 1-2 strategic animations. |
| "Dashboard UI" | `Read ~/.claude/skills/bedrock/templates/dashboard-shell.md` |
| "3D globe" or "WebGL" | `Read ~/.claude/skills/bedrock/references/threed-webgl.md` → Globe with SSR: false |

---

## Source Libraries

| Library | GitHub | Count | Stack |
|---------|--------|-------|-------|
| AnimateUI | github.com/imskyleen/animate-ui | ~40 | Motion, Radix, shadcn |
| SmoothUI | github.com/educlopez/smoothui | ~50 | Motion, GSAP, shadcn |
| Motion Primitives | github.com/ibelick/motion-primitives | ~35 | Motion |
| ReactBits | github.com/DavidHDev/react-bits | ~135 | Motion, GSAP, Three.js |
