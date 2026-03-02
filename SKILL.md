---
name: bedrock
description: >
  The definitive animated frontend component system for building production-grade SaaS landing pages, marketing sites, and web applications with Motion, GSAP, Three.js, and 120+ curated ReactBits components. ALWAYS use this skill when the user asks to build ANY frontend UI, landing page, marketing page, hero section, feature grid, pricing table, or web application interface. Also trigger when the user mentions animation, motion, micro-interactions, "make it look good," "not boring," "premium feel," "modern UI," ReactBits, or any request involving React components that should look polished and professional. This skill contains the actual source code and implementation patterns — do NOT fall back to generic code from training data. If you're writing frontend React code and this skill is available, you should be using it.
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

2. **Restraint signals confidence.** NOT every headline needs SplitText. NOT every card needs SpotlightCard. The best sites are defined by what they DON'T animate.

3. **Spacing creates rhythm.** Variable section heights create breathing. Uniform `py-24` everywhere is the #1 tell of an AI-built page (see `design-tokens.md`).

4. **Composition beats components.** What makes a site premium is HOW sections are composed: tight grid gaps, asymmetric layouts, left-aligned headlines, and visual variety.

---

## How to Access Bedrock's Files

All Bedrock files live at `~/.claude/skills/bedrock/`. Only this SKILL.md is auto-loaded.

### Source File → Library Mapping

| When catalog says... | Search this source file | Check this docs file |
|---------------------|------------------------|---------------------|
| **ReactBits** | `source/reactbits-components.txt` | `source/reactbits-docs.txt` |

### Finding Component Source (every time, non-negotiable)

⚠️ **NEVER `Read source/reactbits-components.txt` without offset+limit. These files are 40K-70K lines.**

1. **Grep** the source file for the line number:
   ```
   Grep pattern="=== FILE:.*SplitText" path="~/.claude/skills/bedrock/source/reactbits-components.txt" -n=true
   ```
2. **Read** only that component (50-200 lines):
   ```
   Read path offset=4521 limit=200
   ```
3. **Grep docs** for props:
   ```
   Grep pattern="## SplitText" path="~/.claude/skills/bedrock/source/reactbits-docs.txt" -A=50
   ```

Source files use `// === FILE: path/to/Component.tsx ===` delimiters. ReactBits uses PascalCase.

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
2. `hover:shadow-lg transition` — use SpotlightCard or clean border hover
3. `animate-bounce` or `animate-pulse` — use Motion springs
4. Raw color values (`text-gray-600`, `bg-white`) — use semantic tokens
5. `transition-all duration-300` — use spring physics
6. Every headline uses SplitText — sometimes a well-set `<h1>` is enough
7. Every card uses SpotlightCard — clean borders > glow for informational content
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
| Component | Use For |
|-----------|---------|
| **SplitText** | ⭐ Hero headlines, staggered word/char entrance |
| **BlurText** | Blur-to-focus cinematic reveal |
| **ShinyText** | CSS-only shiny sweep |
| **GradientText** | Animated gradient fill |
| **DecryptedText** | Matrix-style character decrypt |
| **CircularText** | Text in a circle |
| **TextPressure** | Pressure-responsive text |
| **FuzzyText** | Glitch/fuzzy effect |
| **TrueFocus** | Focus highlight across words |
| **FallingText** | Characters fall into place |
| **TextCursor** | Blinking cursor effect |
| **ScrollFloat** | Float on scroll |
| **ScrollReveal** | Scroll-triggered reveal |
| **ASCIIText** | ASCII art text rendering |
| **ScrambledText** | Scramble/decode text |
| **RotatingText** | Rotating text cycle |
| **GlitchText** | Glitch distortion |
| **ScrollVelocity** | Speed-based scroll text |
| **VariableProximity** | Cursor proximity variable font |
| **CountUp** | Animated number counting |
| **CurvedLoop** | Curved looping text |
| **TextType** | Typewriter effect |
| **Shuffle** | Shuffle text characters |

### Backgrounds (36) — `references/backgrounds.md`
| Component | Dep | Use For |
|-----------|-----|---------|
| **Aurora** | ogl | ⭐ Northern lights gradient |
| **Silk** | three | Flowing silk fabric |
| **Particles** | three | Interactive particle field |
| **Beams** | three | Light beam rays |
| **Hyperspeed** | three | Warp-speed starfield |
| **Squares** | CSS | Animated square grid |
| **Waves** | CSS | Flowing wave lines |
| **Noise** | CSS | Grain texture overlay |
| **Iridescence** | CSS | Rainbow shimmer |
| **LiquidChrome** | CSS | Chrome liquid effect |
| **Ballpit** | three | 3D ball pit |
| **GridMotion** | motion | Animated image grid |
| **GridDistortion** | three | Grid warp effect |
| **LetterGlitch** | CSS | Glitching character bg |
| **Orb** | CSS | Floating orb |
| **Balatro** | CSS | Psychedelic pattern |
| **Threads** | three | 3D flowing threads |
| **Dither** | CSS | Dithered gradient |
| **Lightning** | CSS | Lightning bolts |
| **DotGrid** | CSS | Animated dot grid |
| **RippleGrid** | CSS | Ripple grid effect |
| **DarkVeil** | CSS | Dark overlay veil |
| **Galaxy** | three | Galaxy starfield |
| **LightRays** | CSS | Volumetric light rays |
| **FaultyTerminal** | CSS | CRT/terminal effect |
| **Plasma** | CSS | Plasma flow |
| **Prism** | CSS | Prismatic refraction |
| **GradientBlinds** | CSS | Venetian blind gradient |
| **Grainient** | CSS | Grainy gradient |
| **PrismaticBurst** | CSS | Color burst |
| **PixelBlast** | CSS | Pixel explosion |
| **LiquidEther** | CSS | Ethereal liquid |
| **ColorBends** | CSS | Color bending |
| **GridScan** | CSS | Scanning grid |
| **FloatingLines** | CSS | Floating line patterns |
| **LightPillar** | CSS | Light pillar effect |
| **PixelSnow** | CSS | Pixel snow particles |

### Animations (28) — `references/interactive-elements.md`
| Component | Use For |
|-----------|---------|
| **AnimatedContent** | ⭐ Scroll/mount entrance wrapper (gsap) |
| **FadeContent** | Simple directional fade entrance |
| **Magnet** | Element pulls toward cursor |
| **ElectricBorder** | Animated electric border |
| **ClickSpark** | Spark effect on click |
| **StarBorder** | Sparkle border effect |
| **PixelTransition** | Pixel dissolve transition |
| **GlareHover** | Glare effect on hover |
| **Ribbons** | Flowing ribbon animation |
| **SplashCursor** | Fluid splash at cursor |
| **BlobCursor** | Blob follows cursor (gsap) |
| **ImageTrail** | Images trail cursor |
| **PixelTrail** | Pixel trail cursor |
| **MetaBalls** | Metaball physics |
| **MetallicPaint** | Metallic paint effect |
| **GradualBlur** | Gradual blur effect |
| **Crosshair** | Crosshair cursor overlay |
| **ShapeBlur** | Blurred shapes (Stripe-style) |
| **MagnetLines** | Lines attracted to cursor |
| **Cubes** | 3D cube animation |
| **TargetCursor** | Target cursor effect |
| **StickerPeel** | Sticker peel effect |
| **GhostCursor** | Ghost trail cursor |
| **LaserFlow** | Laser beam flow |
| **Antigravity** | Antigravity particle field |
| **OrbitImages** | Orbiting images |
| **LogoLoop** | Infinite logo scroll |

### Components (35) — `references/cards-content.md`
| Component | Use For |
|-----------|---------|
| **Stack** | Stacked card layout |
| **Dock** | macOS-style dock |
| **SpotlightCard** | ⭐ Spotlight hover card |
| **ElasticSlider** | Elastic range slider |
| **Carousel** | Touch carousel with spring |
| **TiltedCard** | CSS 3D tilt card |
| **AnimatedList** | Staggered list entrance |
| **Masonry** | Masonry grid layout |
| **Folder** | Folder open/close |
| **Counter** | Counter component |
| **Stepper** | Step indicator |
| **PixelCard** | Pixel dissolve card |
| **DecayCard** | Decay/erode card |
| **BounceCards** | Bouncing card stack |
| **InfiniteMenu** | Infinite scroll menu |
| **FlyingPosters** | Flying poster gallery |
| **FlowingMenu** | Flowing nav menu |
| **CircularGallery** | Circular image gallery |
| **Lanyard** | Lanyard/badge component |
| **GlassIcons** | Frosted glass icons |
| **GooeyNav** | Gooey navigation |
| **ChromaGrid** | Chromatic grid |
| **ProfileCard** | Profile card |
| **CardSwap** | Card swap animation |
| **ModelViewer** | 3D model viewer |
| **FluidGlass** | Fluid glass effect |
| **MagicBento** | Magic bento grid |
| **ScrollStack** | Scroll-stacking cards |
| **GlassSurface** | Glass morphism surface |
| **PillNav** | Pill navigation |
| **CardNav** | Card-based navigation |
| **BubbleMenu** | Bubble menu |
| **DomeGallery** | Dome gallery |
| **StaggeredMenu** | Staggered menu animation |
| **ReflectiveCard** | Reflective card |

### Numbers & Data (2) — `references/numbers-data.md`
| Component | Use For |
|-----------|---------|
| **CountUp** | ⭐ Animated number counting (one-directional) |
| **Counter** | Interactive counter component |

### 3D & WebGL (8) — `references/threed-webgl.md`
| Component | Dep | Use For |
|-----------|-----|---------|
| **Hyperspeed** | three | ⭐ Warp-speed starfield |
| **Threads** | three | 3D flowing threads |
| **Beams** | three | Light beam rays |
| **ShapeBlur** | three | Blurred shapes |
| **Particles** | three | Interactive particles |
| **Galaxy** | three | Galaxy starfield |
| **Ballpit** | three | 3D ball pit |
| **ModelViewer** | three | 3D model viewer |

---

## Implementation Workflow

```
Step 1: STYLE     → Read references/style-profiles.md, pick a profile
Step 2: PLAN      → Read the relevant template (saas-landing.md, hero-section.md, etc.)
Step 3: DETECT    → Check package.json for framework, deps, UI conventions
Step 4: FIND SRC  → Grep source file → Read with offset+limit (NEVER from memory)
Step 5: IMPLEMENT → Adapt source: 'use client', fix imports, match conventions
Step 6: COMPOSE   → Wire sections with AnimatedContent/FadeContent, stagger timing, variable spacing
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

## Source Library

| Library | Count | Stack |
|---------|-------|-------|
| ReactBits | ~122 | Motion, GSAP, Three.js, OGL |
