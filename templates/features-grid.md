# Features Section — Bedrock Composition Guide

The features section communicates product capabilities. It must be scannable (users skim), visually varied (not a wall of identical cards), and indexable (SEO value from descriptions).

> **Insight from Unicorn Studio:** Their features use a 2x2 grid with `gap: 0.5rem` — cards nearly touch, creating a "card sheet" effect. Each card has DIFFERENT content types (static image, WebGL embed, video, illustration). Variety within a grid > identical cards with identical layouts.

## Decision Framework: Which Layout?

| Scenario | Layout | Why |
|----------|--------|-----|
| 1 hero feature + supporting | **Bento Grid (A)** | Visual hierarchy — the big card draws the eye first |
| Each feature has a screenshot/visual | **Alternating Rows (B)** | Full-width visuals get space to breathe |
| All features are equal weight | **Unified Grid (C)** | Clean, democratic, scannable |
| 4 compact features | **Feature Strip (D)** | Tight, icon-led, doesn't need a full section |
| 1 feature to spotlight | **Feature Showcase (E)** | Full-width, immersive, like a mini-hero |

---

## Layout A: Bento Grid (Asymmetric)

The hero card draws the eye. Supporting cards fill the remaining space. **This is NOT a uniform grid.**

```tsx
'use client';
import { FadeContent } from '@/components/ui/fade-content';
import Image from 'next/image';

const ENTRANCE = { type: "spring" as const, stiffness: 200, damping: 25 };

export function Features({ heroFeature, features }) {
  return (
    <section className="py-20 md:py-32 px-6">
      <div className="max-w-7xl mx-auto">
        {/* Section header — left-aligned, not centered */}
        <FadeContent blur direction="up"
          variants={{ hidden: { opacity: 0, y: 24 }, visible: { opacity: 1, y: 0 } }}
          viewOptions={{ once: true, margin: "-80px" }}
          transition={ENTRANCE}
        >
          <p className="font-mono text-xs tracking-widest uppercase text-muted-foreground mb-4">
            Capabilities
          </p>
          <h2 className="font-display text-3xl md:text-5xl tracking-tight max-w-xl">
            Everything you need, nothing you don't
          </h2>
        </FadeContent>

        {/* Bento grid — tight gaps like Unicorn Studio */}
        <div className="mt-16 grid grid-cols-1 md:grid-cols-3 gap-1.5">
          {/* Hero card — 2 cols, 2 rows */}
          <FadeContent blur direction="up"
            variants={{ hidden: { opacity: 0, y: 32 }, visible: { opacity: 1, y: 0 } }}
            viewOptions={{ once: true }}
            transition={ENTRANCE}
          >
            <div className="md:col-span-2 md:row-span-2 rounded-2xl border border-border/30 bg-muted/20 overflow-hidden">
              <div className="p-8 md:p-12">
                <p className="font-mono text-xs text-primary/70 tracking-wider uppercase">Core</p>
                <h3 className="text-2xl md:text-3xl font-semibold mt-3 tracking-tight">
                  {heroFeature.title}
                </h3>
                <p className="text-muted-foreground mt-3 max-w-md leading-relaxed">
                  {heroFeature.description}
                </p>
              </div>
              {heroFeature.image && (
                <Image src={heroFeature.image} alt="" className="w-full"
                       width={700} height={350} />
              )}
            </div>
          </FadeContent>

          {/* Supporting cards */}
          {features.map((feature, i) => (
            <FadeContent blur direction="up"
              key={feature.title}
              variants={{ hidden: { opacity: 0, y: 24 }, visible: { opacity: 1, y: 0 } }}
              viewOptions={{ once: true }}
              transition={{ ...ENTRANCE, delay: 0.08 * (i + 1) }}
            >
              <div className="p-6 md:p-8 rounded-2xl border border-border/30 bg-muted/20 h-full flex flex-col">
                <feature.icon className="w-8 h-8 text-foreground/60" />
                <h3 className="text-lg font-semibold mt-5 tracking-tight">{feature.title}</h3>
                <p className="text-sm text-muted-foreground mt-2 leading-relaxed">{feature.description}</p>
              </div>
            </FadeContent>
          ))}
        </div>
      </div>
    </section>
  );
}
```

**Key details:**
- `gap-1.5` (6px) — tight gaps create a "card sheet" effect (inspired by Unicorn Studio's 0.5rem/8px gaps)
- `border-border/30` — barely-there borders, not full opacity
- Icons are `text-foreground/60` not garish `text-primary`
- Hero card has NO icon — the visual or image does the work
- Category label uses monospace for texture

---

## Layout B: Alternating Rows

Each feature gets a full row with text on one side and a visual on the other. Sides alternate.

```tsx
'use client';
import { FadeContent } from '@/components/ui/fade-content';
import { TiltedCard } from '@/components/ui/tilted-card';
import Image from 'next/image';

const ENTRANCE = { type: "spring" as const, stiffness: 200, damping: 25 };

export function Features({ features }) {
  return (
    <section className="py-20 md:py-32 px-6">
      <div className="max-w-7xl mx-auto space-y-24 md:space-y-32">
        {features.map((feature, i) => {
          const reversed = i % 2 === 1;
          return (
            <FadeContent blur direction="up"
              key={feature.title}
              variants={{ hidden: { opacity: 0, y: 40 }, visible: { opacity: 1, y: 0 } }}
              viewOptions={{ once: true, margin: "-100px" }}
              transition={ENTRANCE}
            >
              <div className={`grid lg:grid-cols-2 gap-12 lg:gap-20 items-center ${reversed ? 'lg:[direction:rtl]' : ''}`}>
                <div className={reversed ? 'lg:[direction:ltr]' : ''}>
                  <p className="font-mono text-xs tracking-widest uppercase text-primary/70 mb-4">
                    {feature.label}
                  </p>
                  <h3 className="text-2xl md:text-4xl font-semibold tracking-tight">
                    {feature.title}
                  </h3>
                  <p className="mt-4 text-muted-foreground text-lg leading-relaxed max-w-lg">
                    {feature.description}
                  </p>
                  {feature.bullets && (
                    <ul className="mt-6 space-y-3">
                      {feature.bullets.map(b => (
                        <li key={b} className="flex items-start gap-3 text-sm">
                          <span className="w-1.5 h-1.5 rounded-full bg-primary/50 mt-2 shrink-0" />
                          <span className="text-muted-foreground">{b}</span>
                        </li>
                      ))}
                    </ul>
                  )}
                </div>
                <div className={reversed ? 'lg:[direction:ltr]' : ''}>
                  <TiltedCard>
                    <Image
                      src={feature.image}
                      alt={feature.title}
                      className="rounded-2xl border border-border/30 shadow-lg"
                      width={600}
                      height={400}
                    />
                  </TiltedCard>
                </div>
              </div>
            </FadeContent>
          );
        })}
      </div>
    </section>
  );
}
```

**Key details:**
- `[direction:rtl]` trick for alternating sides without duplicate markup
- Bullets use a tiny dot (`w-1.5 h-1.5 bg-primary/50`) not a CheckCircle icon — subtlety
- `space-y-24 md:space-y-32` — generous space between rows
- `Tilt rotationFactor={4}` — gentle, not dramatic (4 < default 8)

---

## Layout C: Unified Grid (Cards as a Sheet)

When all features are equal weight. **The key insight: make the grid feel like ONE unit, not scattered cards.**

```tsx
'use client';
import { FadeContent } from '@/components/ui/fade-content';
// Use motion stagger for group animations

export function Features({ features }) {
  return (
    <section className="py-20 md:py-32 px-6">
      <div className="max-w-6xl mx-auto">
        {/* Left-aligned header */}
        <FadeContent blur direction="up"
          variants={{ hidden: { opacity: 0 }, visible: { opacity: 1 } }}
          viewOptions={{ once: true }}
        >
          <div className="max-w-2xl mb-16">
            <h2 className="font-display text-3xl md:text-5xl tracking-tight">Features</h2>
            <p className="mt-4 text-lg text-muted-foreground">
              Built for teams that ship fast.
            </p>
          </div>
        </FadeContent>

        {/* Grid as unified block — gap-px creates hairline dividers */}
        <motion stagger
          preset="blur"
          className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-px bg-border/40 rounded-2xl overflow-hidden border border-border/30"
        >
          {features.map(feature => (
            <div key={feature.title} className="p-8 md:p-10 bg-background">
              <feature.icon className="w-8 h-8 text-foreground/60" />
              <h3 className="text-lg font-semibold mt-5 tracking-tight">{feature.title}</h3>
              <p className="text-sm text-muted-foreground mt-2 leading-relaxed">
                {feature.description}
              </p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
```

**What makes this different from vibe-coded:**
- `gap-px` with `bg-border/40` — hairline dividers between cells instead of floating cards with shadows
- `overflow-hidden rounded-2xl` — the grid is ONE block, not scattered cards
- `border border-border/30` — barely visible outer border
- Each cell is `bg-background` — clean, no card elevation
- Icons are `text-foreground/60` — understated
- NO SpotlightCard — restraint. Not every grid needs glow effects.

**When to add SpotlightCard:** Only when the feature cards are interactive (link somewhere, have expandable content, or the product is specifically visual/creative). For informational feature lists, clean dividers > glow.

---

## Layout D: Feature Strip (Compact)

4 quick features in a tight horizontal strip. Good between larger sections.

```tsx
<section className="py-12 md:py-16 px-6 border-y border-border/20">
  <div className="max-w-6xl mx-auto">
    <div className="grid grid-cols-2 md:grid-cols-4 gap-8 md:gap-12">
      {features.map(feature => (
        <div key={feature.title} className="text-center">
          <div className="w-12 h-12 mx-auto rounded-xl border border-border/30 bg-muted/20 flex items-center justify-center mb-4">
            <feature.icon className="w-5 h-5 text-foreground/60" />
          </div>
          <h4 className="text-sm font-semibold tracking-tight">{feature.title}</h4>
          <p className="text-xs text-muted-foreground mt-1">{feature.description}</p>
        </div>
      ))}
    </div>
  </div>
</section>
```

**Key details:**
- Compact section padding (`py-12 md:py-16`) — this isn't a major section
- `border-y border-border/20` — subtle section separation
- Small text sizes (`text-sm`, `text-xs`) — these are supporting features, not headline features
- Icon containers with `border-border/30` and `bg-muted/20` — echoes Unicorn Studio's icon treatment

---

## Layout E: Feature Showcase (Spotlight)

One feature gets a full-width immersive treatment. Usually for the #1 capability.

```tsx
<section className="py-20 md:py-32 px-6">
  <div className="max-w-7xl mx-auto">
    <FadeContent blur direction="up"
      variants={{ hidden: { opacity: 0, y: 40 }, visible: { opacity: 1, y: 0 } }}
      viewOptions={{ once: true, margin: "-50px" }}
      transition={{ type: "spring", stiffness: 150, damping: 25 }}
    >
      <div className="rounded-3xl border border-border/30 bg-muted/10 overflow-hidden">
        <div className="p-8 md:p-16">
          <p className="font-mono text-xs tracking-widest uppercase text-primary/70 mb-4">
            {feature.label}
          </p>
          <h2 className="font-display text-3xl md:text-5xl tracking-tight max-w-2xl">
            {feature.title}
          </h2>
          <p className="mt-4 text-lg text-muted-foreground max-w-xl leading-relaxed">
            {feature.description}
          </p>
        </div>
        <div className="px-4 md:px-8 pb-4 md:pb-8">
          <Image
            src={feature.image}
            alt={feature.title}
            className="rounded-xl w-full"
            width={1200}
            height={600}
          />
        </div>
      </div>
    </FadeContent>
  </div>
</section>
```

---

## Mixing Layouts on One Page

Premium pages use multiple feature patterns to create visual variety:

```
Section 3: Feature Showcase (E) — spotlight the #1 feature
Section 4: Feature Strip (D) — 4 compact secondary features
Section 5: Alternating Rows (B) — 2-3 features with visuals
```

Or:

```
Section 3: Bento Grid (A) — hero feature + 3-4 supporting
Section 5: Feature Showcase (E) — deep dive on one feature
```

**Never use the same layout twice on one page.** The variation creates visual chapters and prevents the "wall of cards" feel.

---

## Common Anti-Patterns

| Anti-Pattern | Why It's Wrong | What to Do |
|-------------|---------------|------------|
| 6 identical cards in a 3x2 grid | Monotonous, feels generated | Use Bento (hero card + small cards) |
| Every card has SpotlightCard | Overkill, draws attention everywhere | Clean borders for info cards, glow only for interactive |
| SplitText on section heading + card titles | Animation fatigue | SplitText on heading only, card titles are static |
| `gap-8` on everything | Loose, unfocused | Tighter gaps (`gap-1.5` to `gap-4`) for card grids |
| All cards have icons from the same icon set at the same size | Feels templated | Vary: some cards with icons, hero card with image, one with illustration |
| Centered section heading for every section | Repetitive, AI-default | Alternate: left-aligned vs centered |

---

## SEO Notes

- `<h2>` for section title, `<h3>` for each feature — proper heading hierarchy
- Feature descriptions should be 2-3 sentences minimum for indexable content
- Use meaningful icon `alt` text or `aria-label` for accessibility
- The grid is fully server-rendered — all text is in the HTML
- `FadeContent` and `motion stagger` render content immediately, animation is progressive enhancement
