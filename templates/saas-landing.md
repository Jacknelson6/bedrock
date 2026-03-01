# SaaS Landing Page — Bedrock Composition Guide

This is NOT a rigid blueprint. It's a **composition vocabulary** — a set of section patterns you mix, match, and adapt to the product. Premium sites don't follow a formula; they tell a story specific to the product. Your job is to choose the right patterns for the story.

## The Three Pillars (Non-Negotiable)

### 1. Typography Carries the Design
The font pairing decision matters more than any animation choice. A stunning headline in the right typeface with proper tracking needs ZERO animation to feel premium.

**Font Pairing Strategy:**
- **Display + Body:** Use a distinctive display face for headlines (Sprat, Cal Sans, Instrument Serif, Cabinet Grotesk) paired with a clean geometric/grotesk body (Inter, Geist, Overused Grotesk, General Sans)
- **Mono accent:** Add a monospace as a third voice for labels, badges, and meta (Geist Mono, JetBrains Mono, IBM Plex Mono)
- **Expressiveness spectrum:** Match font personality to product personality. A fintech product wants restrained authority (Söhne + Inter). A creative tool wants expressive energy (Sprat + Overused Grotesk).
- **Load exactly 2-3 weights per family.** More = slower page. Fewer = enough.

```tsx
// In layout.tsx — declare fonts with next/font
import { Inter } from 'next/font/google';
import localFont from 'next/font/local';

const display = localFont({
  src: '../public/fonts/CabinetGrotesk-Bold.woff2',
  variable: '--font-display',
  display: 'swap',
});
const body = Inter({ subsets: ['latin'], variable: '--font-body' });
const mono = localFont({
  src: '../public/fonts/GeistMono-Regular.woff2',
  variable: '--font-mono',
  display: 'swap',
});

// In global CSS
:root {
  --font-display: 'Cabinet Grotesk', sans-serif;
  --font-body: 'Inter', sans-serif;
  --font-mono: 'Geist Mono', monospace;
}
```

### 2. Restraint Signals Confidence
- **NOT every headline needs TextEffect.** A well-set `<h1>` with `tracking-tighter` and the right font is enough.
- **NOT every section needs a background.** White/dark space IS the design.
- **NOT every card needs GlowHoverCard.** A clean border with subtle hover is often better.
- **Ambient animation (Aurora, Particles) belongs in ONE section** — usually the hero. Using it in multiple sections creates visual noise.
- **Motion should reward scrolling, not punish it.** If everything animates, nothing stands out.

### 3. Spacing Creates Rhythm
**Variable section heights create breathing.** Uniform `py-24` everywhere is the #1 tell of an AI-built page.

```
Hero:             min-h-screen (or min-h-[80vh] for shorter heroes)
Features:         py-20 md:py-32  (generous but not heroic)
Product Showcase: py-16 md:py-24  (tighter — the visual does the work)
Social Proof:     py-12 md:py-20  (compact — logos don't need space)
Pricing:          py-20 md:py-32  (generous — big decision needs room)
FAQ:              py-16 md:py-24  (standard)
Footer CTA:       py-24 md:py-40  (dramatic — it's the final moment)
```

The pattern: **alternate between generous and compact.** Never three "generous" sections in a row.

---

## Section Patterns

### HERO — Choose ONE Variant

**Variant A: Typography-Led (Best for most SaaS)**
The headline IS the hero. No background animation. Just beautiful type at massive scale.

```tsx
<section className="min-h-screen flex flex-col justify-center px-6">
  <div className="max-w-6xl mx-auto">
    {/* Optional badge — monospace voice */}
    <motion.p
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      className="font-mono text-sm text-muted-foreground tracking-wider uppercase mb-8"
    >
      Now in public beta
    </motion.p>

    {/* Headline — display font, massive, tight tracking */}
    <h1 className="font-display text-5xl sm:text-7xl lg:text-8xl xl:text-9xl tracking-tighter leading-[0.9]">
      Ship products<br />
      <span className="text-muted-foreground">that users love</span>
    </h1>

    {/* Subheadline — body font, generous max-width */}
    <motion.p
      initial={{ opacity: 0, y: 16 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ delay: 0.3, type: "spring", stiffness: 200, damping: 25 }}
      className="mt-8 text-lg md:text-xl text-muted-foreground max-w-xl"
    >
      The modern platform for teams who build fast.
      From idea to production in minutes, not months.
    </motion.p>

    {/* CTAs — left-aligned, not centered */}
    <motion.div
      initial={{ opacity: 0, y: 16 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ delay: 0.5, type: "spring", stiffness: 200, damping: 25 }}
      className="mt-10 flex flex-wrap gap-4"
    >
      <Magnetic intensity={0.15}>
        <a href="/start" className="px-7 py-3.5 bg-foreground text-background rounded-full text-sm font-medium">
          Start building
        </a>
      </Magnetic>
      <a href="/demo" className="px-7 py-3.5 border border-border rounded-full text-sm font-medium hover:bg-muted transition-colors">
        Watch demo
      </a>
    </motion.div>
  </div>
</section>
```

**What makes this premium:** Left-aligned (not centered), massive type scale with tight leading, two-tone headline (foreground + muted), monospace badge as texture, NO background animation — the typography IS the design.

**Variant B: Ambient Background (Creative/visual products)**
Use when the product is visual or the brand energy is high.

```tsx
<section className="relative min-h-screen flex flex-col items-center justify-center overflow-hidden px-6">
  <div className="absolute inset-0 -z-10">
    {/* Choose ONE: Aurora for organic, Particles for tech, plain gradient for subtle */}
    <Aurora colorStops={["#3b82f6", "#8b5cf6", "#06b6d4"]} speed={0.4} opacity={0.25} />
  </div>

  <div className="text-center max-w-4xl">
    <TextEffect as="h1" per="word" preset="blur"
      className="font-display text-5xl md:text-7xl lg:text-8xl tracking-tighter leading-[0.9]">
      Create enchanting visual experiences
    </TextEffect>

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
      <Magnetic intensity={0.2}>
        <a href="/start" className="inline-flex px-8 py-4 bg-primary text-primary-foreground rounded-full text-base font-medium">
          Start creating — free
        </a>
      </Magnetic>
    </motion.div>
  </div>
</section>
```

**Variant C: Split Hero (Product with a visual UI to showcase)**

```tsx
<section className="min-h-screen grid lg:grid-cols-2 gap-12 lg:gap-0 items-center px-6 lg:px-12">
  {/* Left: text */}
  <div className="max-w-xl pt-24 lg:pt-0">
    <p className="font-mono text-xs tracking-widest uppercase text-muted-foreground mb-6">
      Developer Platform
    </p>
    <h1 className="font-display text-5xl lg:text-7xl tracking-tighter leading-[0.9]">
      The API for<br />modern finance
    </h1>
    <p className="mt-6 text-lg text-muted-foreground max-w-md">
      Accept payments, send payouts, and build financial products
      with our unified platform.
    </p>
    <div className="mt-8 flex gap-4">
      <Magnetic intensity={0.15}>
        <a href="/docs" className="px-7 py-3.5 bg-foreground text-background rounded-full text-sm font-medium">
          Read the docs
        </a>
      </Magnetic>
      <a href="/contact" className="px-7 py-3.5 text-sm font-medium text-muted-foreground hover:text-foreground transition-colors">
        Contact sales →
      </a>
    </div>
  </div>

  {/* Right: product visual */}
  <div className="relative">
    <Tilt rotationFactor={6}>
      <Image src="/product-hero.png" alt="Product interface" width={800} height={600}
             className="rounded-2xl border border-border/50 shadow-2xl" priority />
    </Tilt>
  </div>
</section>
```

---

### SOCIAL PROOF BAR — Goes Right After Hero

This is compact. Not a full section. 48-64px of breathing room, not 96px.

```tsx
<div className="py-12 md:py-16 border-t border-border/30">
  <p className="text-center font-mono text-xs tracking-widest uppercase text-muted-foreground mb-8">
    Trusted by teams at
  </p>
  <InfiniteSlider speed={25} gap={56}>
    {logos.map(logo => (
      <img key={logo.name} src={logo.src} alt={logo.name}
           className="h-6 md:h-7 opacity-40 grayscale hover:opacity-80 hover:grayscale-0 transition-[opacity,filter]" />
    ))}
  </InfiniteSlider>
</div>
```

**Key details:** Logos are SMALL (h-6 to h-7, not h-8 or h-10). Low opacity (0.4, not 0.5). The understatement says "we don't need to shout."

---

### FEATURES — Choose a Layout

**Don't default to 3-col grid.** Choose the layout that best tells the feature story.

**Layout A: Bento Grid (Asymmetric — shows hierarchy)**
When you have 1 hero feature + supporting features:

```tsx
<section className="py-20 md:py-32 px-6">
  <div className="max-w-7xl mx-auto">
    <InView variants={{ hidden: { opacity: 0, y: 24 }, visible: { opacity: 1, y: 0 } }}
            viewOptions={{ once: true, margin: "-80px" }}>
      <p className="font-mono text-xs tracking-widest uppercase text-muted-foreground mb-4">
        Capabilities
      </p>
      <h2 className="font-display text-3xl md:text-5xl tracking-tight max-w-xl">
        Everything you need, nothing you don't
      </h2>
    </InView>

    <div className="mt-16 grid grid-cols-1 md:grid-cols-3 gap-4">
      {/* Hero card — spans 2 cols, taller */}
      <InView variants={{ hidden: { opacity: 0, y: 32 }, visible: { opacity: 1, y: 0 } }}
              viewOptions={{ once: true }} transition={{ type: "spring", stiffness: 200, damping: 25 }}>
        <div className="md:col-span-2 md:row-span-2 p-8 md:p-12 rounded-2xl border border-border/50 bg-muted/30">
          <div className="flex flex-col justify-between h-full min-h-[320px]">
            <div>
              <p className="font-mono text-xs text-primary tracking-wider uppercase">Core</p>
              <h3 className="text-2xl md:text-3xl font-semibold mt-3 tracking-tight">{heroFeature.title}</h3>
              <p className="text-muted-foreground mt-3 max-w-md">{heroFeature.description}</p>
            </div>
            <Image src={heroFeature.image} alt="" className="mt-8 rounded-xl" width={600} height={300} />
          </div>
        </div>
      </InView>

      {/* Supporting cards */}
      {features.slice(1).map((feature, i) => (
        <InView key={feature.title}
                variants={{ hidden: { opacity: 0, y: 24 }, visible: { opacity: 1, y: 0 } }}
                viewOptions={{ once: true }}
                transition={{ delay: 0.1 * (i + 1), type: "spring", stiffness: 200, damping: 25 }}>
          <div className="p-6 md:p-8 rounded-2xl border border-border/50 bg-muted/30 h-full">
            <feature.icon className="w-8 h-8 text-primary/70" />
            <h3 className="text-lg font-semibold mt-4 tracking-tight">{feature.title}</h3>
            <p className="text-sm text-muted-foreground mt-2">{feature.description}</p>
          </div>
        </InView>
      ))}
    </div>
  </div>
</section>
```

**Layout B: Alternating Rows (Shows features with visuals)**
When each feature has a screenshot or illustration:

```tsx
<section className="py-20 md:py-32 px-6">
  <div className="max-w-7xl mx-auto space-y-24 md:space-y-32">
    {features.map((feature, i) => (
      <InView key={feature.title}
              variants={{ hidden: { opacity: 0, y: 40 }, visible: { opacity: 1, y: 0 } }}
              viewOptions={{ once: true, margin: "-100px" }}
              transition={{ type: "spring", stiffness: 200, damping: 25 }}>
        <div className={`grid lg:grid-cols-2 gap-12 lg:gap-20 items-center ${i % 2 === 1 ? 'lg:[direction:rtl]' : ''}`}>
          <div className={i % 2 === 1 ? 'lg:[direction:ltr]' : ''}>
            <p className="font-mono text-xs tracking-widest uppercase text-primary mb-4">
              {feature.label}
            </p>
            <h3 className="text-2xl md:text-4xl font-semibold tracking-tight">
              {feature.title}
            </h3>
            <p className="mt-4 text-muted-foreground text-lg leading-relaxed">
              {feature.description}
            </p>
          </div>
          <Tilt rotationFactor={4} className={i % 2 === 1 ? 'lg:[direction:ltr]' : ''}>
            <Image src={feature.image} alt={feature.title}
                   className="rounded-2xl border border-border/50 shadow-lg" width={600} height={400} />
          </Tilt>
        </div>
      </InView>
    ))}
  </div>
</section>
```

**Layout C: Simple Grid (Only when all features are equal weight)**
The classic grid — but done right:

```tsx
<section className="py-20 md:py-32 px-6">
  <div className="max-w-6xl mx-auto">
    <InView variants={{ hidden: { opacity: 0 }, visible: { opacity: 1 } }}
            viewOptions={{ once: true }}>
      <div className="max-w-2xl mb-16">
        <h2 className="font-display text-3xl md:text-5xl tracking-tight">Features</h2>
        <p className="mt-4 text-lg text-muted-foreground">
          Built for teams that ship fast.
        </p>
      </div>
    </InView>

    <AnimatedGroup preset="blur"
      className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-px bg-border/50 rounded-2xl overflow-hidden border border-border/50">
      {features.map(feature => (
        <div key={feature.title} className="p-8 md:p-10 bg-background">
          <feature.icon className="w-8 h-8 text-foreground/70" />
          <h3 className="text-lg font-semibold mt-5 tracking-tight">{feature.title}</h3>
          <p className="text-sm text-muted-foreground mt-2 leading-relaxed">
            {feature.description}
          </p>
        </div>
      ))}
    </AnimatedGroup>
  </div>
</section>
```

**What's different from vibe-coded:** `gap-px` with `bg-border/50` creates subtle divider lines between cards instead of floating cards with shadows. Section heading is left-aligned, not centered. Icons are `text-foreground/70` not garish `text-primary`. The grid has `overflow-hidden rounded-2xl` making it feel like a unified block, not scattered cards.

---

### PRODUCT SHOWCASE — The "Proof" Section

Shows the actual product interface. This is where Tilt and subtle glow earn their place.

```tsx
<section className="py-16 md:py-24 px-6">
  <div className="max-w-6xl mx-auto">
    <InView variants={{ hidden: { opacity: 0, y: 40, scale: 0.97 }, visible: { opacity: 1, y: 0, scale: 1 } }}
            viewOptions={{ once: true, margin: "-50px" }}
            transition={{ type: "spring", stiffness: 150, damping: 25 }}>
      <div className="relative rounded-2xl border border-border/50 overflow-hidden bg-muted/20 p-2 md:p-3">
        <Image src="/product-screenshot.png" alt="Product interface"
               className="rounded-xl" width={1200} height={750} />
        {/* Optional: subtle gradient overlay at bottom */}
        <div className="absolute inset-x-0 bottom-0 h-32 bg-gradient-to-t from-background/80 to-transparent pointer-events-none" />
      </div>
    </InView>
  </div>
</section>
```

**No Tilt at this scale.** Tilt works on cards (300-500px). On a full-width screenshot, it feels gimmicky. Just let the image breathe with a clean entrance animation.

---

### STATS / METRICS — Compact, Impactful

```tsx
<section className="py-12 md:py-20 px-6 border-y border-border/30">
  <div className="max-w-6xl mx-auto">
    <InView variants={{ hidden: { opacity: 0 }, visible: { opacity: 1 } }}
            viewOptions={{ once: true }}>
      <div className="grid grid-cols-2 md:grid-cols-4 gap-8 md:gap-12">
        {stats.map(stat => (
          <div key={stat.label}>
            <div className="font-display text-3xl md:text-5xl font-bold tracking-tighter tabular-nums">
              <AnimatedNumber value={stat.value}
                springOptions={{ stiffness: 80, damping: 25 }} />
              {stat.suffix}
            </div>
            <p className="mt-2 text-sm text-muted-foreground">{stat.label}</p>
          </div>
        ))}
      </div>
    </InView>
  </div>
</section>
```

**Key:** Display font for numbers, not body font. `tracking-tighter` on large numbers. Compact section (py-12 to py-20) — stats don't need a lot of vertical space.

---

### TESTIMONIALS — Choose a Pattern

**Pattern A: Featured Quote (1 large testimonial)**
```tsx
<section className="py-20 md:py-32 px-6">
  <div className="max-w-4xl mx-auto text-center">
    <InView variants={{ hidden: { opacity: 0, y: 24 }, visible: { opacity: 1, y: 0 } }}
            viewOptions={{ once: true }}>
      <blockquote>
        <p className="text-2xl md:text-4xl font-medium tracking-tight leading-snug">
          "{testimonial.quote}"
        </p>
        <footer className="mt-8 flex items-center justify-center gap-4">
          <img src={testimonial.avatar} alt="" className="w-12 h-12 rounded-full" />
          <div className="text-left">
            <p className="text-sm font-medium">{testimonial.name}</p>
            <p className="text-sm text-muted-foreground">{testimonial.role}, {testimonial.company}</p>
          </div>
        </footer>
      </blockquote>
    </InView>
  </div>
</section>
```

**Pattern B: Carousel (3+ testimonials)**
Use `ReviewsCarousel` — but cap at 5-7 testimonials. More feels desperate.

**Pattern C: Grid (Social proof wall)**
For B2B with many short quotes:
```tsx
<div className="columns-1 md:columns-2 lg:columns-3 gap-4 space-y-4">
  {testimonials.map(t => (
    <InView key={t.name} variants={{ hidden: { opacity: 0 }, visible: { opacity: 1 } }}
            viewOptions={{ once: true }}>
      <div className="break-inside-avoid p-6 rounded-xl border border-border/50 bg-muted/20">
        <p className="text-sm leading-relaxed">"{t.quote}"</p>
        <div className="mt-4 flex items-center gap-3">
          <img src={t.avatar} alt="" className="w-8 h-8 rounded-full" />
          <div>
            <p className="text-xs font-medium">{t.name}</p>
            <p className="text-xs text-muted-foreground">{t.company}</p>
          </div>
        </div>
      </div>
    </InView>
  ))}
</div>
```

---

### PRICING — Clean, Confident

```tsx
<section className="py-20 md:py-32 px-6" id="pricing">
  <div className="max-w-5xl mx-auto">
    <div className="text-center mb-16">
      <h2 className="font-display text-3xl md:text-5xl tracking-tight">
        Simple pricing
      </h2>
      <p className="mt-4 text-muted-foreground text-lg">No surprises. No hidden fees.</p>

      {hasBillingToggle && (
        <div className="mt-8 flex items-center justify-center gap-3">
          <span className={`text-sm ${!annual ? 'text-foreground' : 'text-muted-foreground'}`}>Monthly</span>
          <AnimatedToggle checked={annual} onChange={setAnnual} />
          <span className={`text-sm ${annual ? 'text-foreground' : 'text-muted-foreground'}`}>
            Annual <span className="font-mono text-xs text-primary ml-1">-20%</span>
          </span>
        </div>
      )}
    </div>

    <div className={`grid grid-cols-1 ${plans.length === 3 ? 'md:grid-cols-3' : 'md:grid-cols-2 max-w-3xl mx-auto'} gap-6`}>
      {plans.map((plan, i) => (
        <InView key={plan.name}
                variants={{ hidden: { opacity: 0, y: 24 }, visible: { opacity: 1, y: 0 } }}
                viewOptions={{ once: true }}
                transition={{ delay: i * 0.1, type: "spring", stiffness: 200, damping: 25 }}>
          <div className={`p-8 rounded-2xl border ${
            plan.featured
              ? 'border-foreground/20 bg-foreground/[0.03] ring-1 ring-foreground/10'
              : 'border-border/50'
          }`}>
            <p className="font-mono text-xs tracking-wider uppercase text-muted-foreground">
              {plan.name}
            </p>
            <div className="mt-4 flex items-baseline gap-1">
              <span className="font-display text-4xl md:text-5xl font-bold tracking-tighter tabular-nums">
                $<AnimatedNumber value={annual ? plan.annualPrice : plan.monthlyPrice}
                                 springOptions={{ stiffness: 150, damping: 25 }} />
              </span>
              <span className="text-muted-foreground text-sm">/mo</span>
            </div>
            <p className="mt-3 text-sm text-muted-foreground">{plan.description}</p>

            <ul className="mt-8 space-y-3">
              {plan.features.map(f => (
                <li key={f} className="flex items-start gap-3 text-sm">
                  <CheckIcon className="w-4 h-4 text-foreground/50 mt-0.5 shrink-0" />
                  <span>{f}</span>
                </li>
              ))}
            </ul>

            <Magnetic intensity={0.12}>
              <a href={plan.href} className={`block mt-8 text-center py-3 rounded-full text-sm font-medium transition-colors ${
                plan.featured
                  ? 'bg-foreground text-background hover:bg-foreground/90'
                  : 'border border-border hover:bg-muted'
              }`}>
                {plan.cta}
              </a>
            </Magnetic>
          </div>
        </InView>
      ))}
    </div>
  </div>
</section>
```

**Premium details:** Monospace plan name. Display font for price. `tracking-tighter` on numbers. Featured plan uses `foreground/[0.03]` bg — barely visible, not garish `ring-2 ring-primary`. Check icon is `foreground/50`, not `text-primary` — restraint.

---

### FAQ — SEO-Critical

```tsx
<section className="py-16 md:py-24 px-6" id="faq">
  <div className="max-w-2xl mx-auto">
    <h2 className="font-display text-3xl md:text-4xl tracking-tight mb-12">
      Questions & answers
    </h2>

    {/* Uses Motion Primitives Accordion — NOT shadcn/Radix API */}
    <Accordion expandedValue={expanded} onValueChange={setExpanded}
      className="space-y-0">
      {items.map((item, i) => (
        <AccordionItem key={i} value={`faq-${i}`} className="border-b border-border/50">
          <AccordionTrigger className="text-left text-base font-medium py-5">
            {item.question}
          </AccordionTrigger>
          <AccordionContent className="text-muted-foreground leading-relaxed pb-5">
            {item.answer}
          </AccordionContent>
        </AccordionItem>
      ))}
    </Accordion>
  </div>
</section>
```

**No InView here.** FAQ doesn't need scroll animation — it's a utility section. Let content speak.

Also add FAQPage JSON-LD in the Server Component:
```tsx
const faqJsonLd = {
  '@context': 'https://schema.org',
  '@type': 'FAQPage',
  mainEntity: items.map(item => ({
    '@type': 'Question',
    name: item.question,
    acceptedAnswer: { '@type': 'Answer', text: item.answer },
  })),
};
```

---

### FOOTER CTA — The Final Moment

This is where ONE dramatic animation earns its place. After a page of restraint, a bold closer feels earned.

```tsx
<section className="py-24 md:py-40 px-6 relative overflow-hidden">
  {/* Ambient background — ONLY here, not in other sections. Use a CSS gradient for performance. */}
  <div className="absolute inset-0 -z-10 bg-gradient-to-br from-primary/20 via-purple-500/10 to-background" />

  <div className="max-w-3xl mx-auto text-center relative">
    <InView variants={{ hidden: { opacity: 0, y: 32 }, visible: { opacity: 1, y: 0 } }}
            viewOptions={{ once: true }}
            transition={{ type: "spring", stiffness: 150, damping: 25 }}>
      <h2 className="font-display text-4xl md:text-6xl tracking-tighter">
        Ready to start building?
      </h2>
      <p className="mt-6 text-lg text-muted-foreground max-w-lg mx-auto">
        Join thousands of teams shipping faster with our platform.
      </p>
      <div className="mt-10">
        <Magnetic intensity={0.2}>
          <a href="/start" className="inline-flex px-8 py-4 bg-foreground text-background rounded-full text-base font-medium">
            Get started — free
          </a>
        </Magnetic>
      </div>
    </InView>
  </div>
</section>
```

---

## Navbar (Sticky, Minimal)

```tsx
'use client';
import { motion, useScroll, useTransform } from 'motion/react';

export function Navbar() {
  const { scrollY } = useScroll();
  const bgOpacity = useTransform(scrollY, [0, 100], [0, 0.85]);
  const borderOpacity = useTransform(scrollY, [0, 100], [0, 0.1]);

  return (
    <motion.nav
      className="fixed top-0 inset-x-0 z-50 px-6 py-4"
      style={{
        backgroundColor: useTransform(bgOpacity, v => `hsl(var(--background) / ${v})`),
        borderBottom: useTransform(borderOpacity, v => `1px solid hsl(var(--border) / ${v})`),
        backdropFilter: useTransform(scrollY, [0, 100], ['blur(0px)', 'blur(12px)']),
      }}
    >
      <div className="max-w-7xl mx-auto flex items-center justify-between">
        <a href="/" className="font-display text-lg font-bold tracking-tight">
          ProductName
        </a>

        <div className="hidden md:flex items-center gap-8">
          {navLinks.map(link => (
            <a key={link.href} href={link.href}
               className="text-sm text-muted-foreground hover:text-foreground transition-colors">
              {link.label}
            </a>
          ))}
        </div>

        <a href="/start" className="hidden md:inline-flex px-5 py-2 bg-foreground text-background rounded-full text-sm font-medium">
          Get started
        </a>

        {/* Mobile hamburger */}
        <button onClick={() => setOpen(!open)} className="md:hidden p-2" aria-label="Menu">
          <div className="space-y-1.5">
            <span className={`block w-5 h-px bg-foreground transition-transform ${open ? 'rotate-45 translate-y-[7px]' : ''}`} />
            <span className={`block w-5 h-px bg-foreground transition-opacity ${open ? 'opacity-0' : ''}`} />
            <span className={`block w-5 h-px bg-foreground transition-transform ${open ? '-rotate-45 -translate-y-[7px]' : ''}`} />
          </div>
        </button>
      </div>

      {/* Mobile menu */}
      {open && (
        <motion.div initial={{ opacity: 0, y: -8 }} animate={{ opacity: 1, y: 0 }}
          className="md:hidden px-6 pb-6 pt-2 space-y-4">
          {navLinks.map(link => (
            <a key={link.href} href={link.href} className="block text-sm text-muted-foreground">
              {link.label}
            </a>
          ))}
          <a href="/start" className="block text-center py-3 bg-foreground text-background rounded-full text-sm font-medium">
            Get started
          </a>
        </motion.div>
      )}
    </motion.nav>
  );
}
```

**No AnimatedBackground on nav links** unless the site has 5+ nav items that need active state indication. For 3-4 links, simple text color change is cleaner.

---

### FOOTER — Minimal, Clean

```tsx
<footer className="border-t border-border/30 py-12 md:py-16 px-6">
  <div className="max-w-7xl mx-auto">
    <div className="grid grid-cols-2 md:grid-cols-4 gap-8 md:gap-12">
      <div className="col-span-2 md:col-span-1">
        <a href="/" className="font-display text-lg font-bold tracking-tight">ProductName</a>
        <p className="mt-3 text-sm text-muted-foreground max-w-xs">
          Brief one-line description of the product.
        </p>
      </div>
      {footerLinks.map(group => (
        <div key={group.title}>
          <p className="font-mono text-xs tracking-widest uppercase text-muted-foreground mb-4">
            {group.title}
          </p>
          <ul className="space-y-3">
            {group.links.map(link => (
              <li key={link.href}>
                <a href={link.href} className="text-sm text-muted-foreground hover:text-foreground transition-colors">
                  {link.label}
                </a>
              </li>
            ))}
          </ul>
        </div>
      ))}
    </div>
    <div className="mt-12 pt-8 border-t border-border/20 flex flex-col md:flex-row justify-between items-center gap-4">
      <p className="text-xs text-muted-foreground">© {new Date().getFullYear()} ProductName. All rights reserved.</p>
      <div className="flex gap-6">
        <a href="/privacy" className="text-xs text-muted-foreground hover:text-foreground transition-colors">Privacy</a>
        <a href="/terms" className="text-xs text-muted-foreground hover:text-foreground transition-colors">Terms</a>
      </div>
    </div>
  </div>
</footer>
```

**Key:** Monospace category labels (third voice). Compact padding. No animation — the footer is utility, not spectacle.

---

## Global Elements

**ScrollProgress** — Optional. Only use on long-form content pages (blog, docs). On landing pages it's unnecessary.

**Noise overlay** — Subtle grain adds texture. Keep at opacity 0.02-0.03:
```tsx
<div className="pointer-events-none fixed inset-0 z-[60]">
  <Noise opacity={0.025} />
</div>
```

---

## File Structure (Next.js App Router)

```
app/
├── page.tsx                    ← Server Component: metadata, JSON-LD, content props
├── layout.tsx                  ← Root layout: fonts (display + body + mono), globals
└── (marketing)/
    └── components/
        ├── navbar.tsx          ← 'use client'
        ├── hero.tsx            ← 'use client' — choose a variant
        ├── logo-bar.tsx        ← 'use client' — InfiniteSlider
        ├── features.tsx        ← 'use client' — choose a layout
        ├── showcase.tsx        ← 'use client' — product screenshot
        ├── stats.tsx           ← 'use client' — AnimatedNumber
        ├── testimonials.tsx    ← 'use client' — choose a pattern
        ├── pricing.tsx         ← 'use client' — AnimatedNumber, AnimatedToggle
        ├── faq.tsx             ← 'use client' — Accordion
        ├── footer-cta.tsx      ← 'use client' — Magnetic
        └── footer.tsx          ← Server Component (no animation needed)
```

---

## Composition Principles (Read This Before Building)

1. **Don't animate everything.** Pick 3-4 sections for motion. Let the rest be still. The motion STANDS OUT because of the stillness around it.

2. **Typography does 60% of the work.** If you nail the font pairing, tracking, and scale — the page looks premium before any animation runs.

3. **Left-align more than you center.** Centered hero text is the default AI output. Left-aligned with generous max-width feels intentional and editorial.

4. **Monospace as texture.** Use `font-mono text-xs tracking-widest uppercase` for labels, badges, and category tags. This three-voice system (display + body + mono) creates typographic richness.

5. **Border subtlety.** `border-border/50` not `border-border`. `ring-1 ring-foreground/10` not `ring-2 ring-primary`. Premium = barely there.

6. **Foreground-based CTAs > Primary-colored CTAs.** `bg-foreground text-background` adapts to any theme and feels confident. `bg-primary` is safe but generic.

7. **Vary section backgrounds.** Not every section needs a bg. Alternate: transparent → muted/20 → transparent → border-y. The variation creates visual chapters.

8. **One dramatic moment per page.** Usually the footer CTA. Everything else is controlled.
