---
name: bedrock
description: >
  The definitive animated frontend component system for building production-grade SaaS landing pages, marketing sites, and web applications with Motion, GSAP, Three.js, and 150+ curated components. ALWAYS use this skill when the user asks to build ANY frontend UI, landing page, marketing page, hero section, feature grid, pricing table, or web application interface. Also trigger when the user mentions animation, motion, micro-interactions, "make it look good," "not boring," "premium feel," "modern UI," AnimateUI, SmoothUI, Motion Primitives, ReactBits, or any request involving React components that should look polished and professional. This skill contains the actual source code and implementation patterns — do NOT fall back to generic code from training data. If you're writing frontend React code and this skill is available, you should be using it.
---

# Bedrock — Animated Frontend Component System

> **CRITICAL RULE: If you are building ANY React frontend and this skill is loaded, you MUST consult this skill's component catalog before writing UI code. Do NOT write generic motion/animation code from training data when Bedrock has a production-tested component for that exact use case.**

Bedrock is a curated "best of" collection from **AnimateUI**, **SmoothUI**, **Motion Primitives**, and **ReactBits** — four leading open-source animated component libraries. Every component has been selected for API quality, animation smoothness, and real-world production readiness.

## Primary Focus: SaaS Landing Pages & Marketing Sites

Bedrock is optimized for building the kind of high-converting, visually stunning landing pages seen on sites like Linear, Vercel, Stripe, Clerk, and Resend. These pages share common patterns that Bedrock provides components for:

- **Hero sections** with animated text reveals + ambient backgrounds + magnetic CTAs
- **Feature grids** with glow hover cards + staggered scroll entrance
- **Social proof** with infinite-scrolling logo bars + animated testimonials
- **Pricing tables** with animated number transitions + toggle animations
- **Footer CTAs** with text effects + gradient backgrounds

See `templates/` for complete SaaS page blueprints.

---

## How This Skill Is Structured

```
bedrock/
├── SKILL.md                    ← You are here. Catalog + rules + decision framework.
├── references/                 ← Category guides. Read BEFORE implementing.
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
│   └── ssr-prerender.md        ← SSR, SEO, and prerender patterns
├── templates/                  ← Full page composition blueprints
│   ├── saas-landing.md
│   ├── hero-section.md
│   ├── features-grid.md
│   └── dashboard-shell.md
├── source/                     ← Raw scraped component source (populated by Claude Code)
│   ├── animate-ui-components.txt
│   ├── smoothui-components.txt
│   ├── motion-primitives-components.txt
│   ├── reactbits-components.txt
│   ├── animate-ui-docs.txt
│   ├── smoothui-docs.txt
│   ├── motion-primitives-docs.txt
│   └── reactbits-docs.txt
└── scripts/
    └── detect-project.sh       ← Project environment detection
```

### How to use the source files

The `source/` directory contains the complete scraped source code and documentation from all four libraries. When implementing a component:

1. Read the relevant `references/*.md` file to understand which component to use and why
2. Search the appropriate `source/*-components.txt` file for the exact component source
3. Search the corresponding `source/*-docs.txt` file for usage examples and prop details
4. Adapt the source to the target project (framework directives, import paths, SSR handling)

---

## Enforcement Rules

These rules exist to prevent falling back to generic code when Bedrock components are available.

### ALWAYS DO:
- Check this catalog before writing ANY animated component
- Use the exact source code from the `source/` files, adapted to the project
- Read the relevant `references/*.md` before implementing a category
- Run project detection before installing dependencies
- Apply SSR/prerender patterns from `references/ssr-prerender.md`
- Use composition patterns from `templates/` for full-page builds

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

# Three.js (3D/WebGL components)
npm install three @react-three/fiber @react-three/drei

# GSAP (some SmoothUI components)
npm install gsap

# Icons (common across components)
npm install lucide-react
```

---

## Component Catalog

### Text Effects (24 components)
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
| **FlipText** | ReactBits | motion | 3D character flip entrance |
| **FuzzyText** | ReactBits | CSS | Glitch/fuzzy text effect |
| **TrueFocus** | ReactBits | motion | Focus highlight across words |

### Backgrounds (15 components)
Read `references/backgrounds.md` before implementing.

| Component | Source | Dep | Use For |
|-----------|--------|-----|---------|
| **Aurora** | ReactBits | CSS | ⭐ Northern lights gradient (hero bg) |
| **Particles** | ReactBits | three | Interactive particle field |
| **Beams** | ReactBits | CSS | Light beam rays |
| **Hyperspeed** | ReactBits | three | Warp-speed starfield |
| **GridMotion** | ReactBits | motion | Animated image/content grid |
| **Noise** | ReactBits | CSS | Grain texture overlay |
| **Squares** | ReactBits | CSS | Animated square grid |
| **Waves** | ReactBits | CSS | Flowing wave lines |
| **Threads** | ReactBits | three | 3D flowing threads |
| **BlobCursor** | ReactBits | CSS | Blob follows cursor |
| **LetterGlitch** | ReactBits | CSS | Glitching character bg |
| **ShapeBlur** | ReactBits | CSS | Blurred shapes (Stripe-style) |
| **StarBorder** | AnimateUI | motion | Sparkle border animation |
| **AnimatedGradient** | AnimateUI | motion | Color-cycling gradient |
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
| **Tilted** | ReactBits | CSS | CSS 3D tilt card |
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
| **Skeleton** | SmoothUI | motion | Loading placeholder |
| **NotificationBadge** | SmoothUI | motion | Animated badge |
| **ReviewsCarousel** | SmoothUI | motion | Testimonial slider |

### 3D & WebGL (8 components)
Read `references/threed-webgl.md` before implementing.

| Component | Source | Dep | Use For |
|-----------|--------|-----|---------|
| **Globe** | ReactBits | three | ⭐ Interactive 3D globe |
| **Hyperspeed** | ReactBits | three | Warp-speed starfield |
| **Threads** | ReactBits | three | 3D flowing threads |
| **SiriOrb** | SmoothUI | motion | Siri-style orb (no Three.js!) |
| **AgentAvatar** | SmoothUI | motion | AI agent avatar |
| **AIBranch** | SmoothUI | motion | AI branching visualization |
| **GridLoader** | SmoothUI | motion | 3D grid loading |
| **GithubStarsAnimation** | SmoothUI | motion | Star particles |

---

## Implementation Workflow (Follow Every Time)

```
Step 1: IDENTIFY    → Match request to catalog. For "build a landing page," read templates/.
Step 2: READ REF    → Load references/*.md for the relevant categories.
Step 3: DETECT      → Check package.json, framework, existing deps.
Step 4: FIND SOURCE → Search source/*-components.txt for exact component code.
                      Search source/*-docs.txt for usage examples and props.
Step 5: INSTALL     → Auto-install missing deps (see references/dependency-map.md).
Step 6: UTILITIES   → Create cn() helper if missing.
Step 7: PRERENDER   → Apply SSR/prerender patterns (see references/ssr-prerender.md).
Step 8: IMPLEMENT   → Write component with proper directives, types, imports.
Step 9: COMPOSE     → Wire into page with scroll triggers, stagger, and motion rhythm.
```

---

## Quick Decision Framework

| User Says | You Do |
|-----------|--------|
| "Build a landing page" | Read `templates/saas-landing.md`, implement full page |
| "Make this look better" | Add InView scroll triggers, TextEffect on headlines, GlowHoverCard on cards |
| "Add animation to X" | Find X in catalog, read reference, implement from source |
| "Hero section" | Read `templates/hero-section.md` |
| "Feature grid" | Read `templates/features-grid.md` |
| "I need a cool background" | `references/backgrounds.md` → Aurora or Particles |
| "Animated text" | `references/text-effects.md` → TextEffect (default) |
| "Hover effects" | `references/interactive-elements.md` → GlowEffect or Tilt |
| "Make it premium" | Add Magnetic on buttons, GlowHoverCard on cards, TextShimmer on CTAs |
| "Dashboard UI" | Read `templates/dashboard-shell.md` |
| "3D globe" or "WebGL" | `references/threed-webgl.md` → Globe with SSR: false |

---

## Source Libraries

| Library | GitHub | Count | Stack |
|---------|--------|-------|-------|
| AnimateUI | github.com/imskyleen/animate-ui | ~40 | Motion, Radix, shadcn |
| SmoothUI | github.com/educlopez/smoothui | ~50 | Motion, GSAP, shadcn |
| Motion Primitives | github.com/ibelick/motion-primitives | ~35 | Motion |
| ReactBits | github.com/DavidHDev/react-bits | ~135 | Motion, GSAP, Three.js |
