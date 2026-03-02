---
name: bedrock
description: >
  The definitive animated frontend component system for building production-grade SaaS landing pages, marketing sites, and web applications with Motion, GSAP, Three.js, and 150+ curated components. ALWAYS use this skill when the user asks to build ANY frontend UI, landing page, marketing page, hero section, feature grid, pricing table, or web application interface. Also trigger when the user mentions animation, motion, micro-interactions, "make it look good," "not boring," "premium feel," "modern UI," AnimateUI, SmoothUI, Motion Primitives, ReactBits, or any request involving React components that should look polished and professional. This skill contains the actual source code and implementation patterns — do NOT fall back to generic code from training data. If you're writing frontend React code and this skill is available, you should be using it.
---

# Bedrock — Animated Frontend Component System

> **CRITICAL RULE: If you are building ANY React frontend and this skill is loaded, you MUST consult this skill's component catalog before writing UI code. Do NOT write generic motion/animation code from training data when Bedrock has a production-tested component for that exact use case.**

> **CONTEXT MANAGEMENT: The source files are 40,000-70,000 lines each. NEVER read a full source file. ALWAYS use Grep to find the exact line number first, then Read with offset + limit (max 300 lines). One component at a time.**

## 📐 Essential References — Read These FIRST

| When you need... | Read this file |
|-----------------|----------------|
| **Full page design** | `references/style-profiles.md` — 5 complete style profiles with hero examples, fonts, colors |
| **Font mixing** | `references/typography-recipes.md` — serif+sans mixing, weight contrast, mono labels |
| **Copy-paste pages** | `templates/complete-examples.md` — 3 full working page examples (~200 lines each) |
| **Spacing/timing/color tokens** | `references/design-tokens.md` — non-negotiable spacing, motion timing, typography scale |
| **Motion principles** | `references/motion-theory.md` — spring defaults, animation rhythm |

**Start every page build by reading `style-profiles.md` and picking a profile.** This prevents the generic "AI-built" look.

---

## Primary Design Principles

1. **Typography carries the design.** The right font pairing with proper tracking and scale does 60% of the work — before any animation runs. Mix serif + sans in headlines (see `typography-recipes.md`).

2. **Restraint signals confidence.** NOT every headline needs TextEffect. NOT every card needs GlowHoverCard. The best sites are defined by what they DON'T animate.

3. **Spacing creates rhythm.** Variable section heights create breathing. Uniform `py-24` everywhere is the #1 tell of an AI-built page (see `design-tokens.md`).

4. **Composition beats components.** What makes a site premium is HOW sections are composed: tight grid gaps, asymmetric layouts, left-aligned headlines, and visual variety.

---

## How to Access Bedrock's Files

All Bedrock files live at `~/.claude/skills/bedrock/`. Only this SKILL.md is auto-loaded.

### Source File → Library Mapping

| When catalog says... | Search this source file | Check this docs file |
|---------------------|------------------------|---------------------|
| **Motion Primitives** | `source/motion-primitives-components.txt` | `source/motion-primitives-docs.txt` |
| **SmoothUI** | `source/smoothui-components.txt` | `source/smoothui-docs.txt` |
| **ReactBits** | `source/reactbits-components.txt` | `source/reactbits-docs.txt` |
| **AnimateUI** | `source/animate-ui-components.txt` | `source/animate-ui-docs.txt` |

### Finding Component Source (every time, non-negotiable)

⚠️ **NEVER `Read source/xyz-components.txt` without offset+limit. These files are 40K-70K lines.**

1. **Grep** the source file for the line number:
   ```
   Grep pattern="=== FILE:.*text-effect" path="~/.claude/skills/bedrock/source/motion-primitives-components.txt" -n=true
   ```
2. **Read** only that component (50-200 lines):
   ```
   Read path offset=4521 limit=200
   ```
3. **Grep docs** for props:
   ```
   Grep pattern="## TextEffect" path="~/.claude/skills/bedrock/source/motion-primitives-docs.txt" -A=50
   ```

Source files use `// === FILE: path/to/Component.tsx ===` delimiters. Motion Primitives/SmoothUI use kebab-case, ReactBits uses PascalCase.

---

## Enforcement Rules

### COMPOSITION-FIRST WORKFLOW
**When building a full page or section, you MUST:**
1. Read `references/style-profiles.md` — pick a profile for fonts, colors, background
2. Read the relevant template (`templates/saas-landing.md`, `templates/hero-section.md`, etc.)
3. Start with typography decisions BEFORE choosing animations
4. Apply: "one dramatic moment per page, everything else is controlled"

### ALWAYS DO:
- Check this catalog before writing ANY animated component
- Use exact source code from `source/` files, adapted to the project
- Read relevant `references/*.md` before implementing a category
- Apply SSR/prerender patterns from `references/ssr-prerender.md`
- Apply design tokens from `references/design-tokens.md`
- Import from `motion/react` (NOT `framer-motion`)
- Add `'use client'` in Next.js App Router for any Motion component

### NEVER DO:
- Write custom animation when a Bedrock component exists for that use case
- Use `@keyframes` for entrances when Motion's `animate` handles it
- Use `setTimeout` for stagger — use Motion variants with `staggerChildren`
- Render Three.js/WebGL server-side — always `dynamic()` with `{ ssr: false }`
- Use `max-height` CSS hack for expand/collapse — use Motion height animation
- Use uniform spacing (`py-24` everywhere)
- Use raw hex/gray classes instead of semantic tokens

---

## Anti-Pattern Gallery

**If your output has ANY of these, you're using training data. Fix it:**

1. `bg-gradient-to-br from-purple-600 to-blue-500` — use Aurora, or better: NO background
2. `hover:shadow-lg transition` — use GlowHoverCard or clean border hover
3. `animate-bounce` or `animate-pulse` — use Motion springs
4. Raw color values (`text-gray-600`, `bg-white`) — use semantic tokens
5. `transition-all duration-300` — use spring physics
6. Every headline uses TextEffect — sometimes a well-set `<h1>` is enough
7. Every card uses GlowHoverCard — clean borders > glow for informational content
8. Aurora/Particles in multiple sections — ONE ambient background per page max
9. Centered text in every section — alternate left-aligned and centered
10. `gap-8` on every grid — tighter gaps (`gap-px` to `gap-4`) create "card sheet" effect

### The "Conspicuous Absence" Test
Premium sites are defined by what they DON'T include: no gradient text (despite capability), no glass cards (despite trend), no parallax, no scroll-fade on EVERY element. Before adding decoration, ask: "Does Stripe's homepage have this?"

---

## Project Detection

```
1. Read package.json → Framework (next/vite/CRA), animation libs, UI framework
2. Check for cn() in lib/utils.ts
3. Check Tailwind config

Next.js App Router: 'use client' on all animated components, dynamic import for Three.js
shadcn/ui detected: Use existing cn(), match conventions
Missing deps: npm install motion clsx tailwind-merge (+ three/ogl/gsap as needed)
```

---

## Component Catalog

### Text Effects (23 components) — `references/text-effects.md`
| Component | Source | Use For |
|-----------|--------|---------|
| **TextEffect** | Motion Primitives | ⭐ Hero headlines, staggered word/char entrance |
| **TextMorph** | Motion Primitives | Morphing between two strings |
| **TextScramble** | Motion Primitives | Matrix-style scramble reveal |
| **TextShimmer** | Motion Primitives | Gradient shimmer sweep |
| **TextShimmerWave** | Motion Primitives | Wave-pattern shimmer |
| **TextLoop** | Motion Primitives | Rotating taglines |
| **TextRoll** | Motion Primitives | Rolling/flipping transitions |
| **WaveText** | SmoothUI | Per-character wave bounce |
| **RevealText** | SmoothUI | Scroll-triggered line reveal |
| **TypewriterText** | SmoothUI | Typing effect with cursor |
| **ScrambleHover** | SmoothUI | Text scrambles on hover |
| **ScrollRevealParagraph** | SmoothUI | Word-by-word scroll reveal |
| **SpinningText** | Motion Primitives | Circular rotating text |
| **SplitText** | ReactBits | Advanced char/word/line splits |
| **BlurText** | ReactBits | Blur-to-focus reveal |
| **ShinyText** | ReactBits | CSS-only shiny sweep |
| **GradientText** | ReactBits | Animated gradient fill |
| **FallingText** | ReactBits | Characters fall into place |
| **DecryptedText** | ReactBits | Character-by-character decrypt |
| **CircularText** | ReactBits | Text in a circle |
| **CountUp** | ReactBits | Animated number counting |
| **FuzzyText** | ReactBits | Glitch/fuzzy effect |
| **TrueFocus** | ReactBits | Focus highlight across words |

### Backgrounds (14) — `references/backgrounds.md`
| Component | Source | Dep | Use For |
|-----------|--------|-----|---------|
| **Aurora** | ReactBits | ogl | ⭐ Northern lights gradient |
| **Particles** | ReactBits | three | Interactive particle field |
| **Beams** | ReactBits | three | Light beam rays |
| **Hyperspeed** | ReactBits | three | Warp-speed starfield |
| **GridMotion** | ReactBits | motion | Animated image grid |
| **Noise** | ReactBits | CSS | Grain texture overlay |
| **Squares** | ReactBits | CSS | Animated square grid |
| **Waves** | ReactBits | CSS | Flowing wave lines |
| **Threads** | ReactBits | three | 3D flowing threads |
| **BlobCursor** | ReactBits | gsap | Blob follows cursor |
| **LetterGlitch** | ReactBits | CSS | Glitching character bg |
| **ShapeBlur** | ReactBits | three | Blurred shapes (Stripe-style) |
| **StarBorder** | ReactBits | motion | Sparkle border |
| **BorderTrail** | Motion Primitives | motion | Animated border trail |

### Interactive Elements (15) — `references/interactive-elements.md`
| Component | Source | Use For |
|-----------|--------|---------|
| **Magnetic** | Motion Primitives | ⭐ Element pulls toward cursor |
| **Cursor** | Motion Primitives | Custom cursor follower |
| **Tilt** | Motion Primitives | 3D tilt on hover |
| **GlowEffect** | Motion Primitives | Glow follows cursor |
| **Spotlight** | Motion Primitives | Spotlight follows pointer |
| **ImageComparison** | Motion Primitives | Before/after slider |
| **ScrollProgress** | Motion Primitives | Scroll progress bar |
| **Dock** | Motion Primitives | macOS-style dock |
| **CursorFollow** | SmoothUI | Decorative cursor follower |
| **SplashCursor** | ReactBits | Fluid splash at cursor |
| **MagnetLines** | ReactBits | Lines attracted to cursor |
| **Crosshair** | ReactBits | Crosshair cursor overlay |
| **InfiniteSlider** | Motion Primitives | Seamless infinite scroll |
| **AnimatedTabs** | SmoothUI | Tabs with animated indicator |
| **ProgressiveBlur** | Motion Primitives | Gradient blur effect |

### Cards & Content (12) — `references/cards-content.md`
| Component | Source | Use For |
|-----------|--------|---------|
| **GlowHoverCard** | SmoothUI | ⭐ Card with cursor-following glow |
| **ExpandableCards** | SmoothUI | Cards expand to full view |
| **TweetCard** | SmoothUI | Social proof tweet card |
| **SwitchboardCard** | SmoothUI | Toggle-style card |
| **ScrollableCardStack** | SmoothUI | Stacked cards with scroll |
| **Phototab** | SmoothUI | Photo gallery tabs |
| **AppleInvites** | SmoothUI | Apple-style invitation card |
| **ContributionGraph** | SmoothUI | GitHub heatmap |
| **AnimatedList** | ReactBits | Staggered list entrance |
| **TiltedCard** | ReactBits | CSS 3D tilt card |
| **PixelCard** | ReactBits | Pixel dissolve card |
| **SpotlightCard** | ReactBits | Spotlight hover card |

### Buttons & Inputs (11) — `references/buttons-inputs.md`
| Component | Source | Use For |
|-----------|--------|---------|
| **MagneticButton** | SmoothUI | ⭐ Magnetic pull CTA |
| **ButtonCopy** | SmoothUI | Click-to-copy with animation |
| **ClipCornersButton** | SmoothUI | Geometric clipped corners |
| **DotMorphButton** | SmoothUI | Morphing dot button |
| **AnimatedInput** | SmoothUI | Floating label input |
| **AnimatedOTPInput** | SmoothUI | OTP code input |
| **AnimatedToggle** | SmoothUI | Spring toggle switch |
| **AnimatedTooltip** | SmoothUI | Animated tooltip |
| **SearchableDropdown** | SmoothUI | Searchable dropdown |
| **AIInput** | SmoothUI | AI-style chat input |
| **AnimatedTags** | SmoothUI | Animated tag chips |

### Numbers & Data (5) — `references/numbers-data.md`
| Component | Source | Use For |
|-----------|--------|---------|
| **AnimatedNumber** | Motion Primitives | ⭐ Smooth number transitions |
| **SlidingNumber** | Motion Primitives | Slot-machine digit flip |
| **NumberFlow** | SmoothUI | Rapid-update display |
| **PriceFlow** | SmoothUI | Animated currency |
| **AnimatedProgressBar** | SmoothUI | Progress bar with spring |

### Toolbars & Menus (10) — `references/toolbars-menus.md`
| Component | Source | Use For |
|-----------|--------|---------|
| **ToolbarDynamic** | Motion Primitives | ⭐ Context-aware toolbar |
| **ToolbarExpandable** | Motion Primitives | Expandable toolbar |
| **MorphingDialog** | Motion Primitives | Dialog morphs from trigger |
| **MorphingPopover** | Motion Primitives | Popover morphs from trigger |
| **BasicDropdown** | SmoothUI | Animated dropdown |
| **BasicModal** | SmoothUI | Smooth modal |
| **BasicToast** | SmoothUI | Animated toast |
| **RichPopover** | SmoothUI | Rich content popover |
| **GooeyPopover** | SmoothUI | Gooey liquid popover |
| **DynamicIsland** | SmoothUI | iOS-style dynamic island |

### Layout & Navigation (11) — `references/layout-navigation.md`
| Component | Source | Use For |
|-----------|--------|---------|
| **Accordion** | Motion Primitives | ⭐ Animated expand/collapse |
| **AnimatedBackground** | Motion Primitives | Active-item background |
| **AnimatedGroup** | Motion Primitives | Orchestrated stagger |
| **Carousel** | Motion Primitives | Animated carousel |
| **Dialog** | Motion Primitives | Animated modal |
| **Disclosure** | Motion Primitives | Single expand/collapse |
| **InView** | Motion Primitives | Scroll-triggered animation |
| **TransitionPanel** | Motion Primitives | Panel transitions |
| **SkeletonLoader** | SmoothUI | Loading placeholder |
| **NotificationBadge** | SmoothUI | Animated badge |
| **ReviewsCarousel** | SmoothUI | Testimonial slider |

### 3D & WebGL (7) — `references/threed-webgl.md`
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

```
Step 1: STYLE     → Read references/style-profiles.md, pick a profile
Step 2: PLAN      → Read the relevant template (saas-landing.md, hero-section.md, etc.)
Step 3: DETECT    → Check package.json for framework, deps, UI conventions
Step 4: FIND SRC  → Grep source file → Read with offset+limit (NEVER from memory)
Step 5: IMPLEMENT → Adapt source: 'use client', fix imports, match conventions
Step 6: COMPOSE   → Wire sections with InView, stagger timing, variable spacing
Step 7: VERIFY    → npm run build, dev server, screenshot hero + sections + mobile
```

## Quick Decision Framework

| User Says | You Do |
|-----------|--------|
| "Build a landing page" | Read `style-profiles.md` → pick profile → Read `templates/saas-landing.md` |
| "Make this look better" | Typography first (font pairing, tracking, scale). THEN selective animation. |
| "Hero section" | Read `style-profiles.md` for hero example → Read `templates/hero-section.md` |
| "Make it premium" | Fix typography first. Then vary spacing. Then 1-2 strategic animations. |
| "I need a cool background" | Read `references/backgrounds.md` — but first: does it NEED a background? |

---

## Source Libraries

| Library | Count | Stack |
|---------|-------|-------|
| AnimateUI | ~40 | Motion, Radix, shadcn |
| SmoothUI | ~50 | Motion, GSAP, shadcn |
| Motion Primitives | ~35 | Motion |
| ReactBits | ~135 | Motion, GSAP, Three.js |
