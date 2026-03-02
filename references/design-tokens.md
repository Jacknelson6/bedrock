# Design Token System

**These tokens are non-negotiable.** When you see yourself typing a raw value for spacing, timing, or color — stop and use a token. This is what separates premium from vibe-coded.

## Spacing Scale (use for padding, margins, gaps)
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

## Motion Timing Tokens
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

// SCROLL ENTRANCE: Standard FadeContent/scroll entrance
const SCROLL_ENTER = {
  hidden: { opacity: 0, y: 30 },
  visible: { opacity: 1, y: 0, transition: ENTRANCE },
};
```

**Use these constants. Do NOT type `{ opacity: 0, y: 20, transition: { duration: 0.3 } }` inline.** Duration-based animations feel robotic. Spring-based animations feel alive.

## Typography System

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

**Font setup (REQUIRED):**

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
- Display text uses `leading-[0.9]` or `leading-tight` — compact, dramatic
- Body text ALWAYS uses `text-muted-foreground` — never raw gray classes
- Use monospace (`font-mono text-xs tracking-widest uppercase`) for labels and badges — third voice
- Two-tone headlines (foreground + muted-foreground) create depth without gradient text

## Color Discipline
```
DO:  Use semantic tokens — bg-background, text-foreground, text-muted-foreground, bg-muted, bg-primary, text-primary-foreground, border-border
DO:  Limit accent colors to 1-2 from the brand palette
DO:  Use opacity for depth (bg-muted/30, border-border/50)
DO:  Aurora/gradient backgrounds use 3 colors max, opacity 0.2-0.4

DON'T: Use raw hex codes in components — use CSS vars or Tailwind tokens (exception: WebGL/OGL props like Aurora's colorStops REQUIRE hex strings)
DON'T: Use more than 2 gradient stops in text
DON'T: Mix warm and cool tones in the same gradient
DON'T: Use full-opacity backgrounds on floating elements (use backdrop-blur + low opacity)
```
