# SaaS Landing Page — Bedrock Template

This is the primary composition template. It defines a complete, high-converting SaaS landing page using Bedrock components. Follow this structure when asked to build a landing page, marketing page, or product page.

## Page Architecture

```
┌─────────────────────────────────────────────┐
│  NAVBAR (sticky, blur backdrop)             │
│  Logo · Nav Links · CTA Button              │
├─────────────────────────────────────────────┤
│  HERO SECTION                               │
│  Background: Aurora or Particles            │
│  Headline: TextEffect (per word, blur)      │
│  Subheadline: motion.p (fade up, delayed)   │
│  CTA: Magnetic + MagneticButton             │
│  Social proof: InfiniteSlider (logos)        │
├─────────────────────────────────────────────┤
│  FEATURES GRID (scroll-triggered)           │
│  Section title: TextEffect                  │
│  Cards: AnimatedGroup + GlowHoverCard       │
│  Each card enters with InView               │
├─────────────────────────────────────────────┤
│  PRODUCT SHOWCASE (scroll-triggered)        │
│  Split layout: image + text                 │
│  Image: Tilt wrapper                        │
│  Text: RevealText or BlurText               │
│  Details: Disclosure or Accordion            │
├─────────────────────────────────────────────┤
│  SOCIAL PROOF (scroll-triggered)            │
│  Logos: InfiniteSlider (duplicate row)      │
│  Testimonials: ReviewsCarousel              │
│  Stats: AnimatedNumber + InView trigger     │
├─────────────────────────────────────────────┤
│  PRICING (scroll-triggered)                 │
│  Toggle: AnimatedToggle (monthly/annual)    │
│  Prices: PriceFlow or AnimatedNumber        │
│  Cards: GlowHoverCard                      │
│  CTA: MagneticButton per card               │
├─────────────────────────────────────────────┤
│  FAQ (scroll-triggered)                     │
│  Accordion component                        │
│  Content-rich for SEO/AEO                   │
├─────────────────────────────────────────────┤
│  FOOTER CTA                                 │
│  Background: AnimatedGradient               │
│  Headline: TextShimmer or TextEffect        │
│  CTA: MagneticButton                        │
├─────────────────────────────────────────────┤
│  FOOTER                                     │
│  Standard footer (no animation needed)      │
└─────────────────────────────────────────────┘

PERSISTENT:
  ScrollProgress bar (fixed top, full width)
  Noise overlay (opacity: 0.03, full page)
```

## File Structure (Next.js App Router)

```
app/
├── page.tsx                    ← Server Component: metadata, content props, JSON-LD
├── layout.tsx                  ← Root layout: fonts, global styles
└── (marketing)/
    └── components/
        ├── navbar.tsx          ← 'use client': AnimatedBackground for nav indicator
        ├── hero.tsx            ← 'use client': TextEffect, Aurora, Magnetic
        ├── features.tsx        ← 'use client': InView, AnimatedGroup, GlowHoverCard
        ├── product-showcase.tsx← 'use client': Tilt, RevealText
        ├── social-proof.tsx    ← 'use client': InfiniteSlider, AnimatedNumber
        ├── pricing.tsx         ← 'use client': AnimatedToggle, PriceFlow
        ├── faq.tsx             ← 'use client': Accordion
        ├── footer-cta.tsx      ← 'use client': TextShimmer, MagneticButton
        └── scroll-progress.tsx ← 'use client': ScrollProgress
components/
└── ui/                         ← Bedrock components (from source/)
    ├── text-effect.tsx
    ├── aurora.tsx
    ├── magnetic.tsx
    ├── glow-hover-card.tsx
    ├── in-view.tsx
    ├── animated-group.tsx
    ├── infinite-slider.tsx
    ├── animated-number.tsx
    ├── accordion.tsx
    └── ...
lib/
└── utils.ts                    ← cn() helper
```

## Implementation: Section by Section

### 1. Navbar

```tsx
'use client';
import { motion, useScroll, useTransform } from 'motion/react';
import { AnimatedBackground } from '@/components/ui/animated-background';

export function Navbar() {
  const { scrollY } = useScroll();
  const backdropBlur = useTransform(scrollY, [0, 100], [0, 12]);
  const bgOpacity = useTransform(scrollY, [0, 100], [0, 0.8]);

  return (
    <motion.nav
      className="fixed top-0 left-0 right-0 z-50 px-6 py-4"
      style={{
        backdropFilter: useTransform(backdropBlur, v => `blur(${v}px)`),
        backgroundColor: useTransform(bgOpacity, v => `rgba(0,0,0,${v})`),
      }}
    >
      <div className="max-w-7xl mx-auto flex items-center justify-between">
        <Logo />
        <AnimatedBackground
          defaultValue="features"
          className="rounded-full bg-muted/50"
          enableHover
        >
          {navLinks.map(link => (
            <a key={link.id} data-id={link.id} href={link.href}
               className="px-4 py-2 text-sm">
              {link.label}
            </a>
          ))}
        </AnimatedBackground>
        <MagneticButton className="px-6 py-2 bg-primary text-sm rounded-full">
          Get Started
        </MagneticButton>
      </div>
    </motion.nav>
  );
}
```

### 2. Hero Section

```tsx
'use client';
import { TextEffect } from '@/components/ui/text-effect';
import { Magnetic } from '@/components/ui/magnetic';
import { InfiniteSlider } from '@/components/ui/infinite-slider';
import { Aurora } from '@/components/ui/aurora';
import { motion } from 'motion/react';

interface HeroProps {
  headline: string;
  subheadline: string;
  ctaText: string;
  ctaHref: string;
  logos: { name: string; src: string }[];
}

export function Hero({ headline, subheadline, ctaText, ctaHref, logos }: HeroProps) {
  return (
    <section className="relative min-h-screen flex flex-col items-center justify-center overflow-hidden">
      {/* Ambient background */}
      <div className="absolute inset-0 -z-10">
        <Aurora colorStops={["#3b82f6", "#8b5cf6", "#06b6d4"]} speed={0.5} opacity={0.3} />
      </div>

      {/* Content */}
      <div className="text-center max-w-5xl mx-auto px-4 pt-24">
        <TextEffect
          as="h1"
          per="word"
          preset="blur"
          className="text-5xl md:text-7xl font-bold tracking-tight"
        >
          {headline}
        </TextEffect>

        <motion.p
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.4, duration: 0.6 }}
          className="mt-6 text-xl md:text-2xl text-muted-foreground max-w-2xl mx-auto"
        >
          {subheadline}
        </motion.p>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.7, duration: 0.5 }}
          className="mt-10 flex gap-4 justify-center"
        >
          <Magnetic intensity={0.2}>
            <a href={ctaHref}
               className="px-8 py-4 bg-primary text-primary-foreground rounded-full text-lg font-medium
                          hover:scale-105 transition-transform">
              {ctaText}
            </a>
          </Magnetic>
          <Magnetic intensity={0.15}>
            <a href="/demo"
               className="px-8 py-4 border border-border rounded-full text-lg font-medium
                          hover:bg-muted transition-colors">
              See Demo
            </a>
          </Magnetic>
        </motion.div>
      </div>

      {/* Logo bar */}
      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 1.2, duration: 0.8 }}
        className="mt-20 w-full"
      >
        <p className="text-center text-sm text-muted-foreground mb-6">
          Trusted by teams at
        </p>
        <InfiniteSlider speed={30} gap={48}>
          {logos.map(logo => (
            <img key={logo.name} src={logo.src} alt={logo.name}
                 className="h-8 opacity-50 grayscale hover:opacity-100 hover:grayscale-0 transition" />
          ))}
        </InfiniteSlider>
      </motion.div>
    </section>
  );
}
```

### 3. Features Grid

```tsx
'use client';
import { InView } from '@/components/ui/in-view';
import { AnimatedGroup } from '@/components/ui/animated-group';
import { GlowHoverCard } from '@/components/ui/glow-hover-card';
import { TextEffect } from '@/components/ui/text-effect';

interface Feature {
  icon: React.ElementType;
  title: string;
  description: string;
}

export function Features({ features }: { features: Feature[] }) {
  return (
    <section className="py-24 px-4">
      <div className="max-w-7xl mx-auto">
        <InView
          variants={{ hidden: { opacity: 0, y: 30 }, visible: { opacity: 1, y: 0 } }}
          viewOptions={{ once: true, margin: "-100px" }}
        >
          <div className="text-center mb-16">
            <TextEffect as="h2" per="word" preset="fade" className="text-4xl font-bold">
              Everything you need to ship faster
            </TextEffect>
            <p className="mt-4 text-lg text-muted-foreground max-w-2xl mx-auto">
              Description text for SEO and user context.
            </p>
          </div>
        </InView>

        <InView
          variants={{ hidden: { opacity: 0 }, visible: { opacity: 1 } }}
          viewOptions={{ once: true, margin: "-50px" }}
        >
          <AnimatedGroup
            preset="blur"
            className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8"
          >
            {features.map((feature) => (
              <GlowHoverCard key={feature.title} className="p-8">
                <feature.icon className="w-10 h-10 text-primary mb-4" />
                <h3 className="text-xl font-semibold mb-2">{feature.title}</h3>
                <p className="text-muted-foreground">{feature.description}</p>
              </GlowHoverCard>
            ))}
          </AnimatedGroup>
        </InView>
      </div>
    </section>
  );
}
```

### 4. Social Proof with Stats

```tsx
'use client';
import { InView } from '@/components/ui/in-view';
import { AnimatedNumber } from '@/components/ui/animated-number';
import { InfiniteSlider } from '@/components/ui/infinite-slider';
import { ReviewsCarousel } from '@/components/ui/reviews-carousel';
import { useState, useEffect } from 'react';

export function SocialProof({ stats, reviews, logos }) {
  return (
    <section className="py-24 px-4 bg-muted/30">
      <div className="max-w-7xl mx-auto">
        {/* Stats row */}
        <InView
          variants={{ hidden: { opacity: 0, y: 30 }, visible: { opacity: 1, y: 0 } }}
          viewOptions={{ once: true }}
        >
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8 mb-20">
            {stats.map((stat) => (
              <StatCard key={stat.label} {...stat} />
            ))}
          </div>
        </InView>

        {/* Testimonials */}
        <ReviewsCarousel reviews={reviews} autoPlayInterval={5000} />
      </div>
    </section>
  );
}

function StatCard({ value, suffix, label }) {
  const [inView, setInView] = useState(false);

  return (
    <InView
      variants={{ hidden: {}, visible: {} }}
      viewOptions={{ once: true }}
    >
      <div className="text-center">
        <div className="text-4xl md:text-5xl font-bold tabular-nums">
          <AnimatedNumber
            value={inView ? value : 0}
            springOptions={{ stiffness: 100, damping: 30 }}
          />
          {suffix && <span>{suffix}</span>}
        </div>
        <p className="mt-2 text-muted-foreground">{label}</p>
      </div>
    </InView>
  );
}
```

### 5. Pricing Section

```tsx
'use client';
import { InView } from '@/components/ui/in-view';
import { AnimatedToggle } from '@/components/ui/animated-toggle';
import { PriceFlow } from '@/components/ui/price-flow';
import { GlowHoverCard } from '@/components/ui/glow-hover-card';
import { Magnetic } from '@/components/ui/magnetic';
import { useState } from 'react';

export function Pricing({ plans }) {
  const [annual, setAnnual] = useState(false);

  return (
    <section className="py-24 px-4">
      <div className="max-w-7xl mx-auto">
        <InView
          variants={{ hidden: { opacity: 0, y: 30 }, visible: { opacity: 1, y: 0 } }}
          viewOptions={{ once: true }}
        >
          <div className="text-center mb-12">
            <h2 className="text-4xl font-bold">Simple, transparent pricing</h2>
            <div className="mt-6 flex items-center justify-center gap-3">
              <span className={annual ? "text-muted-foreground" : ""}>Monthly</span>
              <AnimatedToggle checked={annual} onChange={setAnnual} />
              <span className={!annual ? "text-muted-foreground" : ""}>
                Annual <span className="text-primary text-sm">(save 20%)</span>
              </span>
            </div>
          </div>
        </InView>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {plans.map((plan) => (
            <InView
              key={plan.name}
              variants={{ hidden: { opacity: 0, y: 40 }, visible: { opacity: 1, y: 0 } }}
              viewOptions={{ once: true }}
            >
              <GlowHoverCard className={`p-8 ${plan.featured ? 'ring-2 ring-primary' : ''}`}>
                <h3 className="text-2xl font-bold">{plan.name}</h3>
                <div className="mt-4 flex items-baseline gap-1">
                  <span className="text-4xl font-bold tabular-nums">
                    $<PriceFlow value={annual ? plan.annualPrice : plan.monthlyPrice} />
                  </span>
                  <span className="text-muted-foreground">/mo</span>
                </div>
                <p className="mt-2 text-muted-foreground">{plan.description}</p>
                <ul className="mt-6 space-y-3">
                  {plan.features.map(f => (
                    <li key={f} className="flex items-center gap-2">
                      <CheckIcon className="w-4 h-4 text-primary" />
                      <span>{f}</span>
                    </li>
                  ))}
                </ul>
                <Magnetic intensity={0.15}>
                  <a href={plan.href}
                     className={`block mt-8 text-center py-3 rounded-full font-medium
                       ${plan.featured
                         ? 'bg-primary text-primary-foreground'
                         : 'border border-border hover:bg-muted'}`}>
                    {plan.cta}
                  </a>
                </Magnetic>
              </GlowHoverCard>
            </InView>
          ))}
        </div>
      </div>
    </section>
  );
}
```

### 6. FAQ (SEO-Critical)

```tsx
'use client';
import { InView } from '@/components/ui/in-view';
import { Accordion } from '@/components/ui/accordion';

export function FAQ({ items }) {
  return (
    <section className="py-24 px-4">
      <div className="max-w-3xl mx-auto">
        <InView
          variants={{ hidden: { opacity: 0, y: 30 }, visible: { opacity: 1, y: 0 } }}
          viewOptions={{ once: true }}
        >
          <h2 className="text-4xl font-bold text-center mb-12">
            Frequently asked questions
          </h2>
          <Accordion type="single" defaultValue="faq-0">
            {items.map((item, i) => (
              <AccordionItem key={i} value={`faq-${i}`}>
                <AccordionTrigger>{item.question}</AccordionTrigger>
                <AccordionContent>
                  <p>{item.answer}</p>
                </AccordionContent>
              </AccordionItem>
            ))}
          </Accordion>
        </InView>
      </div>
    </section>
  );
}
```

**SEO Note:** Accordion content is always in the DOM (just collapsed). Search engines index it. For AEO, also add FAQPage JSON-LD structured data in the page's Server Component:

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

## Motion Timing Map (Complete Page)

```
0ms      Hero headline (TextEffect) begins
200ms    Hero subheadline fades in
500ms    Hero CTA buttons fade in
1000ms   Logo bar fades in
---scroll---
+0ms     Features section title enters (InView triggers)
+100ms   Feature cards stagger in (AnimatedGroup, 80ms stagger)
---scroll---
+0ms     Stats numbers begin counting (AnimatedNumber)
+200ms   Testimonials carousel visible
---scroll---
+0ms     Pricing section enters
+0ms     Price numbers animate when toggle switches
---scroll---
+0ms     FAQ section enters
---scroll---
+0ms     Footer CTA enters with TextShimmer
```

## Global Elements

### ScrollProgress (Fixed Top)
```tsx
// components/scroll-progress.tsx
'use client';
import { ScrollProgress } from '@/components/ui/scroll-progress';

export function GlobalScrollProgress() {
  return <ScrollProgress className="fixed top-0 left-0 right-0 h-0.5 bg-primary z-[100]" />;
}
```

### Noise Overlay (Full Page)
```tsx
// In layout.tsx or page.tsx
<div className="pointer-events-none fixed inset-0 z-[60]">
  <Noise opacity={0.03} />
</div>
```

---

## Responsive Breakpoints

All templates follow mobile-first responsive patterns:
- `sm` (640px): Adjust text sizes, stack layouts
- `md` (768px): Two-column grids, larger text
- `lg` (1024px): Three-column grids, full layout
- `xl` (1280px): Max-width containers, premium spacing

Heavy animations (Particles, Globe, SplashCursor) should be disabled or simplified on mobile:
```tsx
const isMobile = typeof window !== 'undefined' && window.innerWidth < 768;
// Use lighter background on mobile
{isMobile ? <div className="bg-gradient-to-b from-background to-muted" /> : <Aurora />}
```
