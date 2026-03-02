# Typography Recipes

> Concrete font-mixing patterns with copy-paste code. These are the difference between "AI-built" and "designed."

---

## Google Font Pairings

| # | Display (Serif) | Display (Sans) | Body | Mono | Vibe |
|---|----------------|----------------|------|------|------|
| 1 | Instrument Serif | Inter | Inter | JetBrains Mono | Modern editorial |
| 2 | Playfair Display | — | Inter | Geist Mono | Luxury/premium |
| 3 | — | DM Sans | DM Sans | IBM Plex Mono | Clean data-forward |
| 4 | Crimson Pro | Geist | Geist | Geist Mono | Sophisticated tech |
| 5 | Libre Baskerville | Inter | Inter | Fira Code | Enterprise editorial |
| 6 | — | Cabinet Grotesk | Inter | JetBrains Mono | Bold startup |
| 7 | Instrument Serif | Space Grotesk | Space Grotesk | Space Mono | Creative/studio |
| 8 | Playfair Display | DM Sans | DM Sans | IBM Plex Mono | Fintech/luxury |
| 9 | Lora | Inter | Inter | JetBrains Mono | Warm premium |
| 10 | — | Spline Sans | Spline Sans | Space Mono | Playful modern |

---

## Recipe 1: Serif Emphasis

**Effect:** Sans-serif headline with ONE italic serif word for emphasis. Like Monarch Money's "Call it what it *actually* is."

**Font setup in `layout.tsx`:**
```tsx
import { Inter, Instrument_Serif } from 'next/font/google';

const inter = Inter({ subsets: ['latin'], variable: '--font-sans' });
const instrumentSerif = Instrument_Serif({
  subsets: ['latin'], weight: '400', style: ['italic'], variable: '--font-serif'
});

// In <html>: className={`${inter.variable} ${instrumentSerif.variable}`}
```

**Tailwind config addition:**
```ts
fontFamily: {
  sans: ['var(--font-sans)', 'system-ui', 'sans-serif'],
  serif: ['var(--font-serif)', 'Georgia', 'serif'],
},
```

**JSX:**
```tsx
<h1 className="font-sans text-5xl sm:text-7xl lg:text-8xl font-semibold tracking-tighter leading-[0.9]">
  Call it what it{' '}
  <span className="font-serif italic font-normal">actually</span>
  {' '}is.
</h1>
```

**Key details:**
- The serif word should be `font-normal` (not bold) — the italic + serif contrast is enough
- Works best with 1 word, max 2 — overuse kills it
- The emphasis word should carry emotional weight ("actually", "everything", "beautiful", "magic")

---

## Recipe 2: Weight Contrast

**Effect:** Bold first line, lighter second line in muted color. Like Viktor's "The first AI coworker. / He lives in Slack."

**JSX:**
```tsx
<h1 className="text-5xl sm:text-7xl lg:text-8xl tracking-tighter leading-[0.9]">
  <span className="font-bold text-foreground">
    The first AI coworker.
  </span>
  <br />
  <span className="font-normal text-muted-foreground">
    He lives in Slack.
  </span>
</h1>
```

**Variations:**
```tsx
{/* Smaller second line */}
<h1 className="tracking-tighter leading-[0.9]">
  <span className="text-7xl lg:text-8xl font-bold block">Ship faster.</span>
  <span className="text-4xl lg:text-5xl font-light text-muted-foreground block mt-2">
    Without the chaos.
  </span>
</h1>

{/* Third voice with mono */}
<div>
  <p className="font-mono text-xs tracking-widest uppercase text-muted-foreground mb-4">
    Introducing v2.0
  </p>
  <h1 className="text-7xl font-bold tracking-tighter leading-[0.9]">
    Lightning fast.
  </h1>
  <p className="text-3xl font-light text-muted-foreground tracking-tight mt-2">
    Absurdly reliable.
  </p>
</div>
```

**Key details:**
- The bold line is the hook; the light line is the explanation
- Use `text-muted-foreground` (not a lighter gray class) for theme compatibility
- Second line can be smaller (`text-5xl` vs `text-7xl`) for added hierarchy

---

## Recipe 3: Mono Label + Display Headline

**Effect:** Small uppercase mono category above large display headline. The "third voice" that separates good from great.

**JSX:**
```tsx
<div>
  <p className="font-mono text-xs tracking-[0.2em] uppercase text-muted-foreground mb-6">
    Analytics Platform
  </p>
  <h2 className="font-sans text-4xl md:text-6xl font-semibold tracking-tighter leading-[0.9]">
    See everything.<br />
    <span className="text-muted-foreground">Miss nothing.</span>
  </h2>
</div>
```

**Variations for section headers:**
```tsx
{/* With decorative line */}
<div className="flex items-center gap-4 mb-6">
  <div className="h-px w-8 bg-muted-foreground/30" />
  <p className="font-mono text-[10px] tracking-[0.25em] uppercase text-muted-foreground">
    Features
  </p>
</div>

{/* With number */}
<div className="flex items-baseline gap-3 mb-6">
  <span className="font-mono text-xs text-muted-foreground/50">01</span>
  <span className="font-mono text-xs tracking-[0.2em] uppercase text-muted-foreground">
    Real-time sync
  </span>
</div>
```

**Key details:**
- `tracking-[0.2em]` or `tracking-widest` is essential — default tracking looks wrong on uppercase mono
- Keep at `text-xs` or `text-[10px]` — mono labels should be small
- `mb-6` or `mb-8` gap between label and headline — needs breathing room

---

## Recipe 4: Mixed Expression

**Effect:** Alternating fonts line-by-line for dramatic, artistic impact. Each line uses a different typographic voice.

**Font setup in `layout.tsx`:**
```tsx
import { Inter, Instrument_Serif, Space_Mono } from 'next/font/google';

const inter = Inter({ subsets: ['latin'], variable: '--font-sans' });
const instrumentSerif = Instrument_Serif({ subsets: ['latin'], weight: '400', style: ['italic'], variable: '--font-serif' });
const spaceMono = Space_Mono({ subsets: ['latin'], weight: '400', variable: '--font-mono' });
```

**JSX:**
```tsx
<h1 className="text-5xl sm:text-7xl lg:text-8xl leading-[0.9] tracking-tighter">
  <span className="font-sans font-bold block">We design.</span>
  <span className="font-serif italic font-normal block text-muted-foreground">We build.</span>
  <span className="font-sans font-bold block">We ship.</span>
</h1>
```

**More complex variation:**
```tsx
<h1 className="text-6xl sm:text-8xl leading-[0.85]">
  <span className="font-sans font-black tracking-tighter block uppercase">Create</span>
  <span className="font-serif italic font-normal tracking-tight block text-accent">without</span>
  <span className="font-sans font-black tracking-tighter block uppercase">limits</span>
</h1>
```

**Key details:**
- Works best with 3 lines (rhythm of three)
- Alternate bold sans ↔ italic serif for maximum contrast
- Keep each line to 1-2 words — this is a display pattern, not body copy
- Use sparingly — one per page maximum, typically hero only

---

## Recipe 5: Inline Brand Serif

**Effect:** The product/brand name uses serif while everything else is sans. Subtle, premium, distinctive.

**JSX:**
```tsx
<p className="font-sans text-lg text-muted-foreground leading-relaxed">
  Built by the team at{' '}
  <span className="font-serif italic text-foreground">Meridian</span>,
  the platform trusted by over 10,000 teams worldwide.
</p>

{/* In navigation */}
<nav className="flex items-center justify-between px-6 py-4">
  <a href="/" className="font-serif italic text-xl text-foreground">
    Meridian
  </a>
  <div className="flex gap-8 font-sans text-sm text-muted-foreground">
    <a href="/features">Features</a>
    <a href="/pricing">Pricing</a>
    <a href="/docs">Docs</a>
  </div>
</nav>

{/* In hero */}
<h1 className="font-sans text-5xl sm:text-7xl font-semibold tracking-tighter leading-[0.9]">
  <span className="font-serif italic font-normal">Meridian</span> makes
  <br />data feel simple.
</h1>
```

**Key details:**
- Brand name in serif should be `italic font-normal` — the font itself provides enough contrast
- Use consistently everywhere the brand appears (nav, hero, footer, CTAs)
- This pattern makes even a generic product name feel premium
- Works best with elegant serifs: Instrument Serif, Crimson Pro, Lora
