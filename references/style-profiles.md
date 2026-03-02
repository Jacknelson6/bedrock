# Style Profiles

> Pick ONE profile per page. Each includes fonts, colors, background, animation level, and a complete hero example.

---

## 1. Dark Premium

**Vibe:** Deep blacks, accent glow, dramatic serif+sans headlines. Think luxury AI tool.

**Fonts (Google Fonts):**
- Display: `Playfair Display` (serif, for emphasis words) + `Inter` (sans, for main headlines)
- Body: `Inter`
- Mono: `JetBrains Mono`

**Color Palette:**
```css
:root {
  --color-bg: #09090b;
  --color-surface: #18181b;
  --color-foreground: #fafafa;
  --color-muted: #a1a1aa;
  --color-accent: #a78bfa;       /* violet glow */
  --color-accent-muted: #7c3aed;
}
```

**Background:** Aurora (violet/indigo, opacity 0.2–0.3)
**Animation:** Expressive — SplitText on hero, Aurora ambient, staggered entrances

**When to use:** AI tools, developer platforms with premium positioning, crypto/fintech dashboards

**Hero Example:**
```tsx
'use client';
import { motion } from 'motion/react';
import { SplitText } from '@/components/ui/split-text';
import { Aurora } from '@/components/ui/aurora';
import { Magnet } from '@/components/ui/magnet';
import { Playfair_Display, Inter } from 'next/font/google';

const playfair = Playfair_Display({ subsets: ['latin'], variable: '--font-serif', style: ['italic'] });
const inter = Inter({ subsets: ['latin'], variable: '--font-sans' });

const ENTRANCE = { type: "spring" as const, stiffness: 200, damping: 25 };

export default function Hero() {
  return (
    <section className="relative min-h-screen flex flex-col justify-center overflow-hidden">
      {/* Aurora background */}
      <div className="absolute inset-0 -z-10">
        <Aurora colorStops={["#7c3aed", "#4c1d95", "#a78bfa"]} blend={0.3} amplitude={1.2} speed={0.3} />
      </div>
      <div className="absolute inset-0 -z-10 bg-gradient-to-t from-[#09090b] via-transparent to-[#09090b]/80" />

      <div className="max-w-5xl mx-auto px-6 md:px-12">
        <motion.p
          initial={{ opacity: 0 }} animate={{ opacity: 1 }}
          transition={{ delay: 0.1, ...ENTRANCE }}
          className="font-mono text-xs tracking-widest uppercase text-violet-400 mb-8"
        >
          Now in private beta
        </motion.p>

        <h1 className="text-5xl sm:text-7xl lg:text-8xl tracking-tighter leading-[0.9] font-semibold">
          <SplitText text="Engineering Air" delay={30} className="inline" />
          <br />
          <span className={`${playfair.className} italic text-violet-400 font-normal`}>
            <SplitText text="Superiority" delay={30} className="inline" />
          </span>
        </h1>

        <motion.p
          initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.8, ...ENTRANCE }}
          className="mt-8 text-lg md:text-xl text-muted-foreground max-w-xl leading-relaxed"
        >
          The AI infrastructure platform that makes the impossible feel inevitable.
        </motion.p>

        <motion.div
          initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 1.0, ...ENTRANCE }}
          className="mt-10 flex gap-4"
        >
          <Magnet>
            <a href="/start" className="px-7 py-3.5 bg-violet-600 hover:bg-violet-500 text-white rounded-full text-sm font-medium transition-colors">
              Request access
            </a>
          </Magnet>
          <a href="/docs" className="px-7 py-3.5 border border-white/10 text-white/70 hover:text-white rounded-full text-sm font-medium transition-colors">
            Documentation
          </a>
        </motion.div>
      </div>
    </section>
  );
}
```

---

## 2. Editorial Minimal

**Vibe:** Like Stripe/Linear. Left-aligned, massive typography, almost no animation, B&W with one accent.

**Fonts (Google Fonts):**
- Display: `Inter` (weight 600-700)
- Body: `Inter` (weight 400)
- Mono: `Geist Mono` or `JetBrains Mono`

**Color Palette:**
```css
:root {
  --color-bg: #fafafa;
  --color-surface: #ffffff;
  --color-foreground: #09090b;
  --color-muted: #71717a;
  --color-accent: #2563eb;       /* single blue accent */
  --color-border: #e4e4e7;
}
```

**Background:** None. Clean white/off-white. Maybe a subtle `border-b` between sections.
**Animation:** Minimal — FadeContent fade-ups only, no text effects, no backgrounds

**When to use:** Developer tools, API platforms, infra products, anything where credibility > flash

**Hero Example:**
```tsx
'use client';
import { motion } from 'motion/react';

const ENTRANCE = { type: "spring" as const, stiffness: 200, damping: 25 };

export default function Hero() {
  return (
    <section className="min-h-[90vh] flex flex-col justify-center px-6 md:px-12 lg:px-20">
      <div className="max-w-4xl">
        <p className="font-mono text-xs tracking-widest uppercase text-muted-foreground mb-10">
          Developer Platform
        </p>

        <h1 className="text-5xl sm:text-7xl lg:text-[5.5rem] font-semibold tracking-tighter leading-[0.9] text-foreground">
          Build faster.<br />
          <span className="text-muted-foreground">Ship with confidence.</span>
        </h1>

        <motion.p
          initial={{ opacity: 0, y: 12 }} animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.3, ...ENTRANCE }}
          className="mt-8 text-lg md:text-xl text-muted-foreground max-w-lg leading-relaxed"
        >
          The complete platform for building, deploying, and scaling modern applications.
        </motion.p>

        <motion.div
          initial={{ opacity: 0, y: 12 }} animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.5, ...ENTRANCE }}
          className="mt-10 flex items-center gap-6"
        >
          <a href="/start" className="px-6 py-3 bg-foreground text-background rounded-lg text-sm font-medium hover:bg-foreground/90 transition-colors">
            Get started
          </a>
          <a href="/docs" className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors flex items-center gap-1.5">
            Read the docs <span aria-hidden>→</span>
          </a>
        </motion.div>

        <motion.div
          initial={{ opacity: 0 }} animate={{ opacity: 1 }}
          transition={{ delay: 0.8, ...ENTRANCE }}
          className="mt-16 flex items-center gap-3 text-sm text-muted-foreground"
        >
          <code className="font-mono text-xs bg-muted px-2.5 py-1 rounded">npm i @acme/sdk</code>
          <span>·</span>
          <span>Free tier available</span>
        </motion.div>
      </div>
    </section>
  );
}
```

---

## 3. Bold Expressive

**Vibe:** Dashboard previews, mixed font weights, data-forward, energetic but controlled.

**Fonts (Google Fonts):**
- Display: `Cabinet Grotesk` (or `DM Sans` weight 700) + `Instrument Serif` for emphasis
- Body: `DM Sans`
- Mono: `IBM Plex Mono`

**Color Palette:**
```css
:root {
  --color-bg: #0a0a0a;
  --color-surface: #141414;
  --color-foreground: #f5f5f5;
  --color-muted: #8b8b8b;
  --color-accent: #22d3ee;       /* cyan/teal for data viz feel */
  --color-accent-warm: #f59e0b;  /* amber secondary */
}
```

**Background:** Radial gradient (subtle, centered behind dashboard mockup)
**Animation:** Moderate — CountUp on stats, staggered card entrance, FadeContent reveals

**When to use:** Analytics products, dashboards, data-heavy SaaS, monitoring tools

**Hero Example:**
```tsx
'use client';
import { motion } from 'motion/react';
import { CountUp } from '@/components/ui/count-up';
import { Instrument_Serif, DM_Sans } from 'next/font/google';

const instrumentSerif = Instrument_Serif({ subsets: ['latin'], weight: '400', style: ['italic'], variable: '--font-serif' });
const dmSans = DM_Sans({ subsets: ['latin'], variable: '--font-sans' });

const ENTRANCE = { type: "spring" as const, stiffness: 200, damping: 25 };

export default function Hero() {
  return (
    <section className="relative min-h-screen flex flex-col justify-center px-6 md:px-12">
      {/* Radial glow behind content */}
      <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[800px] h-[600px] bg-cyan-500/10 rounded-full blur-[120px] -z-10" />

      <div className="max-w-6xl mx-auto w-full">
        <motion.div
          initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }}
          transition={{ ...ENTRANCE }}
          className="flex items-center gap-3 mb-8"
        >
          <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-cyan-500/10 border border-cyan-500/20 text-cyan-400 text-xs font-mono tracking-wider uppercase">
            <span className="w-1.5 h-1.5 rounded-full bg-cyan-400 animate-pulse" />
            Live
          </span>
        </motion.div>

        <h1 className="text-5xl sm:text-7xl lg:text-8xl tracking-tighter leading-[0.9] font-bold">
          See{' '}
          <span className={`${instrumentSerif.className} italic font-normal text-cyan-400`}>
            everything.
          </span>
          <br />
          <span className="text-muted-foreground font-medium">Miss nothing.</span>
        </h1>

        <motion.p
          initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.4, ...ENTRANCE }}
          className="mt-8 text-lg text-muted-foreground max-w-lg leading-relaxed"
        >
          Real-time analytics that turn raw data into decisions. Built for teams that move fast.
        </motion.p>

        {/* Stat bar */}
        <motion.div
          initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.6, ...ENTRANCE }}
          className="mt-12 flex gap-12"
        >
          {[
            { value: 2400000, label: 'Events/sec', suffix: '' },
            { value: 99.99, label: 'Uptime %', suffix: '%' },
            { value: 47, label: 'Avg latency', suffix: 'ms' },
          ].map((stat) => (
            <div key={stat.label}>
              <div className="font-mono text-3xl md:text-4xl font-bold tracking-tight tabular-nums text-foreground">
                <CountUp from={0} to={stat.value} duration={1.5} />{stat.suffix}
              </div>
              <p className="mt-1 text-xs text-muted-foreground font-mono tracking-wider uppercase">{stat.label}</p>
            </div>
          ))}
        </motion.div>
      </div>
    </section>
  );
}
```

---

## 4. Enterprise Clean

**Vibe:** Trust-building, authoritative. Particle/data viz backgrounds. Think Datadog, Snowflake.

**Fonts (Google Fonts):**
- Display: `Inter` (weight 700)
- Body: `Inter` (weight 400)
- Mono: `Fira Code`

**Color Palette:**
```css
:root {
  --color-bg: #0f172a;          /* slate-900 */
  --color-surface: #1e293b;     /* slate-800 */
  --color-foreground: #f1f5f9;  /* slate-100 */
  --color-muted: #94a3b8;       /* slate-400 */
  --color-accent: #3b82f6;      /* blue-500, enterprise trust blue */
  --color-border: #334155;      /* slate-700 */
}
```

**Background:** Particles (slow, blue-tinted, low density) or subtle dot grid
**Animation:** Moderate — FadeContent for sections, CountUp for metrics, Particles ambient

**When to use:** Enterprise SaaS, security tools, infrastructure, compliance products

**Hero Example:**
```tsx
'use client';
import { motion } from 'motion/react';
import { Particles } from '@/components/ui/particles';
import { Magnet } from '@/components/ui/magnet';

const ENTRANCE = { type: "spring" as const, stiffness: 200, damping: 25 };

export default function Hero() {
  return (
    <section className="relative min-h-screen flex flex-col justify-center overflow-hidden">
      {/* Particle background */}
      <div className="absolute inset-0 -z-10">
        <Particles quantity={60} size={0.6} color="#3b82f6" staticity={40} ease={50} />
      </div>
      <div className="absolute inset-0 -z-10 bg-gradient-to-b from-transparent via-[#0f172a]/50 to-[#0f172a]" />

      <div className="max-w-5xl mx-auto px-6 md:px-12 text-center">
        <motion.div
          initial={{ opacity: 0, y: 12 }} animate={{ opacity: 1, y: 0 }}
          transition={{ ...ENTRANCE }}
          className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full border border-blue-500/20 bg-blue-500/5 mb-10"
        >
          <span className="text-xs font-medium text-blue-400">SOC 2 Type II Certified</span>
          <span className="text-xs text-slate-500">·</span>
          <span className="text-xs text-slate-400">HIPAA Compliant</span>
        </motion.div>

        <h1 className="text-5xl sm:text-7xl lg:text-8xl font-bold tracking-tighter leading-[0.9]">
          <motion.span initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.1, ...ENTRANCE }}>
            Secure your
          </motion.span>
          <br />
          <motion.span initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.3, ...ENTRANCE }} className="text-blue-400">
            entire stack
          </motion.span>
        </h1>

        <motion.p
          initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.5, ...ENTRANCE }}
          className="mt-8 text-lg md:text-xl text-slate-400 max-w-2xl mx-auto leading-relaxed"
        >
          Enterprise-grade security monitoring that protects your infrastructure, APIs, and data — from code to cloud.
        </motion.p>

        <motion.div
          initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.7, ...ENTRANCE }}
          className="mt-10 flex items-center justify-center gap-4"
        >
          <Magnet>
            <a href="/demo" className="px-8 py-3.5 bg-blue-600 hover:bg-blue-500 text-white rounded-lg text-sm font-medium transition-colors">
              Schedule demo
            </a>
          </Magnet>
          <a href="/pricing" className="px-8 py-3.5 border border-slate-700 text-slate-300 hover:text-white hover:border-slate-600 rounded-lg text-sm font-medium transition-colors">
            View pricing
          </a>
        </motion.div>

        {/* Trust logos */}
        <motion.div
          initial={{ opacity: 0 }} animate={{ opacity: 1 }}
          transition={{ delay: 1.0, ...ENTRANCE }}
          className="mt-20 text-xs text-slate-500 uppercase tracking-widest font-mono"
        >
          Trusted by teams at
        </motion.div>
      </div>
    </section>
  );
}
```

---

## 5. Creative Studio

**Vibe:** Artistic, unconventional layouts, monolithic imagery, dramatic typography mixing.

**Fonts (Google Fonts):**
- Display: `Spline Sans` (sans) + `Instrument Serif` (serif accents)
- Body: `Spline Sans`
- Mono: `Space Mono`

**Color Palette:**
```css
:root {
  --color-bg: #faf9f6;          /* warm off-white */
  --color-surface: #ffffff;
  --color-foreground: #1a1a1a;
  --color-muted: #7a7a7a;
  --color-accent: #ff4d00;      /* bold orange-red */
  --color-border: #e8e6e1;
}
```

**Background:** None, or a single oversized image/video. Let content and whitespace do the work.
**Animation:** Expressive but sparse — one dramatic SplitText per page, Magnet on CTAs, large scale transitions

**When to use:** Design tools, creative agencies, portfolio-style products, anything where artistry matters

**Hero Example:**
```tsx
'use client';
import { motion } from 'motion/react';
import { SplitText } from '@/components/ui/split-text';
import { Magnet } from '@/components/ui/magnet';
import { Instrument_Serif, Spline_Sans } from 'next/font/google';

const instrumentSerif = Instrument_Serif({ subsets: ['latin'], weight: '400', style: ['italic'], variable: '--font-serif' });
const splineSans = Spline_Sans({ subsets: ['latin'], variable: '--font-sans' });

const ENTRANCE = { type: "spring" as const, stiffness: 200, damping: 25 };

export default function Hero() {
  return (
    <section className="min-h-screen flex flex-col justify-between px-6 md:px-12 py-12">
      {/* Top nav area */}
      <div className="flex justify-between items-center">
        <span className={`${instrumentSerif.className} italic text-2xl`}>Studio</span>
        <span className="font-mono text-xs tracking-widest uppercase text-muted-foreground">Est. 2024</span>
      </div>

      {/* Main headline — full width, oversized */}
      <div className="flex-1 flex items-center -mx-6 md:-mx-12">
        <h1 className="text-[clamp(3rem,12vw,12rem)] font-medium tracking-tighter leading-[0.85] w-full">
          <SplitText text="We make" delay={20} className="block" />
          <span className="flex items-baseline gap-[0.5em]">
            <span className={`${instrumentSerif.className} italic text-[#ff4d00] font-normal`}>
              <SplitText text="beautiful" delay={20} className="inline" />
            </span>
            <SplitText text="things" delay={20} className="inline" />
          </span>
        </h1>
      </div>

      {/* Bottom bar */}
      <motion.div
        initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 1.2, ...ENTRANCE }}
        className="flex justify-between items-end"
      >
        <p className="text-sm text-muted-foreground max-w-xs leading-relaxed">
          A design studio crafting digital experiences for brands that refuse to blend in.
        </p>
        <Magnet>
          <a href="/work" className="group flex items-center gap-2 text-sm font-medium">
            View our work
            <span className="group-hover:translate-x-1 transition-transform" aria-hidden>→</span>
          </a>
        </Magnet>
      </motion.div>
    </section>
  );
}
```
