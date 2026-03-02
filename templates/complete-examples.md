# Complete Page Examples

> Copy-paste-able full pages. Each includes layout.tsx font setup, hero, features, social proof, and CTA.

---

## Example 1: Dark SaaS AI Tool (Dark Premium Profile)

### `app/layout.tsx`
```tsx
import type { Metadata } from 'next';
import { Inter, Playfair_Display, JetBrains_Mono } from 'next/font/google';
import './globals.css';

const inter = Inter({ subsets: ['latin'], variable: '--font-sans' });
const playfair = Playfair_Display({ subsets: ['latin'], style: ['italic'], variable: '--font-serif' });
const jetbrains = JetBrains_Mono({ subsets: ['latin'], variable: '--font-mono' });

export const metadata: Metadata = { title: 'Nexus AI', description: 'AI infrastructure platform' };

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={`dark ${inter.variable} ${playfair.variable} ${jetbrains.variable}`}>
      <body className="bg-[#09090b] text-[#fafafa] font-sans antialiased">{children}</body>
    </html>
  );
}
```

### `app/page.tsx`
```tsx
'use client';
import { motion } from 'motion/react';
import { SplitText } from '@/components/ui/split-text';
import { Aurora } from '@/components/ui/aurora';
import { FadeContent } from '@/components/ui/fade-content';
import { CountUp } from '@/components/ui/count-up';
import { Magnet } from '@/components/ui/magnet';
import { LogoLoop } from '@/components/ui/logo-loop';

const ENTRANCE = { type: "spring" as const, stiffness: 200, damping: 25 };

const features = [
  { icon: '⚡', title: 'Sub-100ms inference', description: 'Deploy models at the edge with automatic optimization and zero cold starts.' },
  { icon: '🔗', title: 'Universal connectors', description: 'Plug into any data source. PostgreSQL, S3, Snowflake — we handle the plumbing.' },
  { icon: '📊', title: 'Real-time monitoring', description: 'Track latency, throughput, and drift across every model in production.' },
  { icon: '🛡️', title: 'Enterprise guardrails', description: 'Content filtering, PII detection, and audit logs built into every request.' },
  { icon: '🔄', title: 'Auto-scaling', description: 'From zero to millions of requests. Scale down to save, scale up instantly.' },
  { icon: '🧪', title: 'A/B testing', description: 'Route traffic between model versions. Measure impact before you commit.' },
];

const logos = ['OpenAI', 'Anthropic', 'Vercel', 'Stripe', 'Linear', 'Notion', 'Figma', 'Datadog'];

export default function Home() {
  return (
    <main>
      {/* ── Hero ── */}
      <section className="relative min-h-screen flex flex-col justify-center overflow-hidden">
        <div className="absolute inset-0 -z-10">
          <Aurora colorStops={["#7c3aed", "#4c1d95", "#a78bfa"]} blend={0.3} amplitude={1.2} speed={0.3} />
        </div>
        <div className="absolute inset-0 -z-10 bg-gradient-to-t from-[#09090b] via-transparent to-[#09090b]/80" />

        <div className="max-w-5xl mx-auto px-6 md:px-12">
          <motion.p initial={{ opacity: 0 }} animate={{ opacity: 1 }} transition={{ delay: 0.1, ...ENTRANCE }}
            className="font-mono text-xs tracking-widest uppercase text-violet-400 mb-8">
            Now in public beta
          </motion.p>

          <h1 className="text-5xl sm:text-7xl lg:text-8xl tracking-tighter leading-[0.9] font-semibold">
            <SplitText text="AI infrastructure" delay={30} className="inline" />
            <br />
            <span className="text-muted-foreground">that{' '}</span>
            <span className="font-serif italic font-normal text-violet-400">
              <SplitText text="just works." delay={30} className="inline" />
            </span>
          </h1>

          <motion.p initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.9, ...ENTRANCE }}
            className="mt-8 text-lg md:text-xl text-zinc-400 max-w-xl leading-relaxed">
            Deploy, monitor, and scale AI models with one platform. No MLOps team required.
          </motion.p>

          <motion.div initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 1.1, ...ENTRANCE }}
            className="mt-10 flex gap-4">
            <Magnet>
              <a href="/start" className="px-7 py-3.5 bg-violet-600 hover:bg-violet-500 text-white rounded-full text-sm font-medium transition-colors">
                Start building
              </a>
            </Magnet>
            <a href="/docs" className="px-7 py-3.5 border border-white/10 text-white/70 hover:text-white rounded-full text-sm font-medium transition-colors">
              Documentation
            </a>
          </motion.div>
        </div>
      </section>

      {/* ── Features ── */}
      <section className="py-20 md:py-32 px-6 md:px-12">
        <div className="max-w-6xl mx-auto">
          <FadeContent blur direction="up">
            <div className="max-w-xl mb-16">
              <p className="font-mono text-xs tracking-widest uppercase text-violet-400 mb-4">Platform</p>
              <h2 className="text-3xl md:text-5xl font-semibold tracking-tighter">
                Everything you need.<br />
                <span className="text-zinc-500">Nothing you don't.</span>
              </h2>
            </div>
          </FadeContent>

          <FadeContent blur direction="up">
            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-px bg-white/5 rounded-2xl overflow-hidden border border-white/5">
              {features.map((f, i) => (
                <motion.div
                  key={f.title}
                  initial={{ opacity: 0, y: 20 }}
                  whileInView={{ opacity: 1, y: 0 }}
                  viewport={{ once: true }}
                  transition={{ delay: i * 0.1, ...ENTRANCE }}
                  className="p-8 md:p-10 bg-[#09090b]"
                >
                  <span className="text-2xl">{f.icon}</span>
                  <h3 className="text-lg font-semibold mt-5 tracking-tight">{f.title}</h3>
                  <p className="text-sm text-zinc-500 mt-2 leading-relaxed">{f.description}</p>
                </motion.div>
              ))}
            </div>
          </FadeContent>
        </div>
      </section>

      {/* ── Social Proof ── */}
      <section className="py-12 md:py-16 border-y border-white/5">
        <div className="max-w-6xl mx-auto px-6 md:px-12">
          <FadeContent blur direction="up">
            <p className="font-mono text-xs tracking-widest uppercase text-zinc-600 text-center mb-10">
              Trusted by engineering teams at
            </p>
            <div className="flex gap-16 items-center justify-center opacity-40 overflow-hidden">
              {logos.map((logo) => (
                <span key={logo} className="text-lg font-semibold text-zinc-400 whitespace-nowrap">{logo}</span>
              ))}
            </div>
          </FadeContent>
        </div>
      </section>

      {/* ── CTA ── */}
      <section className="py-24 md:py-40 px-6 md:px-12">
        <div className="max-w-3xl mx-auto text-center">
          <FadeContent blur direction="up">
            <h2 className="text-4xl md:text-6xl font-semibold tracking-tighter leading-[0.9]">
              Ready to ship{' '}
              <span className="font-serif italic font-normal text-violet-400">faster</span>?
            </h2>
            <p className="mt-6 text-lg text-zinc-500 max-w-md mx-auto leading-relaxed">
              Join 2,000+ teams already building with Nexus. Free tier, no credit card.
            </p>
            <div className="mt-10">
              <Magnet>
                <a href="/start" className="inline-flex px-8 py-4 bg-violet-600 hover:bg-violet-500 text-white rounded-full text-sm font-medium transition-colors">
                  Get started free
                </a>
              </Magnet>
            </div>
          </FadeContent>
        </div>
      </section>
    </main>
  );
}
```

---

## Example 2: Developer Platform (Editorial Minimal Profile)

### `app/layout.tsx`
```tsx
import type { Metadata } from 'next';
import { Inter, JetBrains_Mono } from 'next/font/google';
import './globals.css';

const inter = Inter({ subsets: ['latin'], variable: '--font-sans' });
const jetbrains = JetBrains_Mono({ subsets: ['latin'], variable: '--font-mono' });

export const metadata: Metadata = { title: 'Forge', description: 'The developer platform' };

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={`${inter.variable} ${jetbrains.variable}`}>
      <body className="bg-[#fafafa] text-[#09090b] font-sans antialiased">{children}</body>
    </html>
  );
}
```

### `app/page.tsx`
```tsx
'use client';
import { motion } from 'motion/react';
import { FadeContent } from '@/components/ui/fade-content';
import { CountUp } from '@/components/ui/count-up';

const ENTRANCE = { type: "spring" as const, stiffness: 200, damping: 25 };

const features = [
  { title: 'Deploy in seconds', description: 'Push to git, we handle the rest. Zero-config builds for every framework.' },
  { title: 'Edge-first runtime', description: 'Your code runs in 300+ locations. Sub-50ms response times, globally.' },
  { title: 'Observability built in', description: 'Logs, traces, and metrics without instrumenting a single line.' },
];

const stats = [
  { value: 300, suffix: '+', label: 'Edge locations' },
  { value: 99.99, suffix: '%', label: 'Uptime SLA' },
  { value: 2, suffix: 'M+', label: 'Deployments/mo' },
];

export default function Home() {
  return (
    <main>
      {/* ── Hero ── */}
      <section className="min-h-[90vh] flex flex-col justify-center px-6 md:px-12 lg:px-20">
        <div className="max-w-4xl">
          <p className="font-mono text-xs tracking-widest uppercase text-zinc-400 mb-10">Developer Platform</p>

          <h1 className="text-5xl sm:text-7xl lg:text-[5.5rem] font-semibold tracking-tighter leading-[0.9]">
            Build faster.<br />
            <span className="text-zinc-400">Ship with confidence.</span>
          </h1>

          <motion.p initial={{ opacity: 0, y: 12 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.3, ...ENTRANCE }}
            className="mt-8 text-lg md:text-xl text-zinc-500 max-w-lg leading-relaxed">
            The complete platform for modern applications. From prototype to planet-scale.
          </motion.p>

          <motion.div initial={{ opacity: 0, y: 12 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.5, ...ENTRANCE }}
            className="mt-10 flex items-center gap-6">
            <a href="/start" className="px-6 py-3 bg-[#09090b] text-white rounded-lg text-sm font-medium hover:bg-zinc-800 transition-colors">
              Get started
            </a>
            <a href="/docs" className="text-sm font-medium text-zinc-500 hover:text-zinc-900 transition-colors flex items-center gap-1.5">
              Read the docs <span aria-hidden>→</span>
            </a>
          </motion.div>

          <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} transition={{ delay: 0.8, ...ENTRANCE }}
            className="mt-16 flex items-center gap-3 text-sm text-zinc-500">
            <code className="font-mono text-xs bg-zinc-100 border border-zinc-200 px-2.5 py-1 rounded">npx create-forge-app</code>
            <span>·</span>
            <span>Free tier available</span>
          </motion.div>
        </div>
      </section>

      {/* ── Features ── */}
      <section className="py-16 md:py-24 px-6 md:px-12 lg:px-20 border-t border-zinc-200">
        <div className="max-w-6xl">
          <FadeContent blur direction="up">
            <div className="grid grid-cols-1 md:grid-cols-3 gap-12 md:gap-16">
              {features.map((f, i) => (
                <div key={f.title}>
                  <div className="flex items-baseline gap-3 mb-4">
                    <span className="font-mono text-xs text-zinc-300">{String(i + 1).padStart(2, '0')}</span>
                    <div className="h-px flex-1 bg-zinc-200" />
                  </div>
                  <h3 className="text-lg font-semibold tracking-tight">{f.title}</h3>
                  <p className="text-sm text-zinc-500 mt-2 leading-relaxed">{f.description}</p>
                </div>
              ))}
            </div>
          </FadeContent>
        </div>
      </section>

      {/* ── Stats (Social Proof) ── */}
      <section className="py-12 md:py-20 px-6 md:px-12 lg:px-20 border-y border-zinc-200">
        <FadeContent blur direction="up">
          <div className="max-w-6xl flex flex-col md:flex-row md:items-end gap-12 md:gap-24">
            <div className="max-w-xs">
              <p className="font-mono text-xs tracking-widest uppercase text-zinc-400 mb-3">By the numbers</p>
              <p className="text-sm text-zinc-500 leading-relaxed">
                Trusted by developers at startups and enterprises building the next generation of web applications.
              </p>
            </div>
            <div className="flex gap-16">
              {stats.map((stat) => (
                <div key={stat.label}>
                  <div className="text-4xl md:text-5xl font-bold tracking-tighter tabular-nums">
                    <CountUp from={0} to={stat.value} duration={1.5} />{stat.suffix}
                  </div>
                  <p className="mt-1 text-xs text-zinc-400 font-mono tracking-wider uppercase">{stat.label}</p>
                </div>
              ))}
            </div>
          </div>
        </FadeContent>
      </section>

      {/* ── CTA ── */}
      <section className="py-24 md:py-40 px-6 md:px-12 lg:px-20">
        <div className="max-w-2xl">
          <FadeContent blur direction="up">
            <h2 className="text-4xl md:text-6xl font-semibold tracking-tighter leading-[0.9]">
              Start building<br />
              <span className="text-zinc-400">in 30 seconds.</span>
            </h2>
            <p className="mt-6 text-lg text-zinc-500 max-w-md leading-relaxed">
              No credit card required. Deploy your first app today.
            </p>
            <div className="mt-10">
              <a href="/start" className="inline-flex px-6 py-3 bg-[#09090b] text-white rounded-lg text-sm font-medium hover:bg-zinc-800 transition-colors">
                Get started free
              </a>
            </div>
          </FadeContent>
        </div>
      </section>
    </main>
  );
}
```

---

## Example 3: Data Analytics SaaS (Bold Expressive Profile)

### `app/layout.tsx`
```tsx
import type { Metadata } from 'next';
import { DM_Sans, Instrument_Serif, IBM_Plex_Mono } from 'next/font/google';
import './globals.css';

const dmSans = DM_Sans({ subsets: ['latin'], variable: '--font-sans' });
const instrumentSerif = Instrument_Serif({ subsets: ['latin'], weight: '400', style: ['italic'], variable: '--font-serif' });
const ibmPlexMono = IBM_Plex_Mono({ subsets: ['latin'], weight: '400', variable: '--font-mono' });

export const metadata: Metadata = { title: 'Prism Analytics', description: 'See everything. Miss nothing.' };

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className={`dark ${dmSans.variable} ${instrumentSerif.variable} ${ibmPlexMono.variable}`}>
      <body className="bg-[#0a0a0a] text-[#f5f5f5] font-sans antialiased">{children}</body>
    </html>
  );
}
```

### `app/page.tsx`
```tsx
'use client';
import { motion } from 'motion/react';
import { FadeContent } from '@/components/ui/fade-content';
import { CountUp } from '@/components/ui/count-up';
import { Magnet } from '@/components/ui/magnet';

const ENTRANCE = { type: "spring" as const, stiffness: 200, damping: 25 };

const features = [
  { title: 'Real-time pipelines', description: 'Stream millions of events per second with sub-millisecond latency.', stat: '2.4M', statLabel: 'events/sec' },
  { title: 'Smart alerting', description: 'ML-powered anomaly detection. Get notified before your users notice.', stat: '< 3s', statLabel: 'detection' },
  { title: 'Visual query builder', description: 'SQL power without the syntax. Drag, drop, analyze.', stat: '10x', statLabel: 'faster insights' },
];

const testimonials = [
  { quote: 'Prism replaced our entire observability stack. The real-time dashboards are unreal.', name: 'Sarah Chen', role: 'CTO, Meridian' },
  { quote: 'We went from 6 monitoring tools to 1. The team actually enjoys looking at metrics now.', name: 'Marcus Webb', role: 'VP Eng, Catalyst' },
  { quote: 'The anomaly detection caught a billing issue before it cost us $200K.', name: 'Aisha Patel', role: 'Head of Data, Flux' },
];

export default function Home() {
  return (
    <main>
      {/* ── Hero ── */}
      <section className="relative min-h-screen flex flex-col justify-center px-6 md:px-12">
        <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[800px] h-[600px] bg-cyan-500/8 rounded-full blur-[120px] -z-10" />

        <div className="max-w-6xl mx-auto w-full">
          <motion.div initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }} transition={{ ...ENTRANCE }}
            className="flex items-center gap-3 mb-8">
            <span className="inline-flex items-center gap-1.5 px-3 py-1 rounded-full bg-cyan-500/10 border border-cyan-500/20 text-cyan-400 text-xs font-mono tracking-wider uppercase">
              <span className="w-1.5 h-1.5 rounded-full bg-cyan-400 animate-pulse" />
              Live
            </span>
          </motion.div>

          <h1 className="text-5xl sm:text-7xl lg:text-8xl tracking-tighter leading-[0.9] font-bold">
            See{' '}
            <span className="font-serif italic font-normal text-cyan-400">everything.</span>
            <br />
            <span className="text-neutral-500 font-medium">Miss nothing.</span>
          </h1>

          <motion.p initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.4, ...ENTRANCE }}
            className="mt-8 text-lg text-neutral-500 max-w-lg leading-relaxed">
            Real-time analytics that turn raw data into decisions. Built for teams that move fast.
          </motion.p>

          <motion.div initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.6, ...ENTRANCE }}
            className="mt-12 flex gap-12">
            {[
              { value: 2400000, label: 'Events/sec' },
              { value: 99.99, label: 'Uptime %', suffix: '%' },
              { value: 47, label: 'Avg latency', suffix: 'ms' },
            ].map((s) => (
              <div key={s.label}>
                <div className="font-mono text-3xl md:text-4xl font-bold tracking-tight tabular-nums">
                  <CountUp from={0} to={s.value} duration={1.5} />{s.suffix || ''}
                </div>
                <p className="mt-1 text-xs text-neutral-600 font-mono tracking-wider uppercase">{s.label}</p>
              </div>
            ))}
          </motion.div>

          <motion.div initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.8, ...ENTRANCE }}
            className="mt-10 flex gap-4">
            <Magnet>
              <a href="/start" className="px-7 py-3.5 bg-cyan-500 hover:bg-cyan-400 text-black rounded-full text-sm font-semibold transition-colors">
                Start free trial
              </a>
            </Magnet>
            <a href="/demo" className="px-7 py-3.5 border border-white/10 text-white/70 hover:text-white rounded-full text-sm font-medium transition-colors">
              Book a demo
            </a>
          </motion.div>
        </div>
      </section>

      {/* ── Features with inline stats ── */}
      <section className="py-20 md:py-32 px-6 md:px-12">
        <div className="max-w-6xl mx-auto">
          <FadeContent blur direction="up">
            <p className="font-mono text-xs tracking-widest uppercase text-cyan-400 mb-4">Capabilities</p>
            <h2 className="text-3xl md:text-5xl font-bold tracking-tighter mb-16">
              Built for{' '}<span className="font-serif italic font-normal text-cyan-400">speed.</span>
            </h2>
          </FadeContent>

          <FadeContent blur direction="up">
            <div className="grid grid-cols-1 md:grid-cols-3 gap-px bg-white/5 rounded-2xl overflow-hidden border border-white/5">
              {features.map((f, i) => (
                <motion.div
                  key={f.title}
                  initial={{ opacity: 0, y: 20 }}
                  whileInView={{ opacity: 1, y: 0 }}
                  viewport={{ once: true }}
                  transition={{ delay: i * 0.1, ...ENTRANCE }}
                  className="p-8 md:p-10 bg-[#0a0a0a] flex flex-col"
                >
                  <div className="mb-6">
                    <span className="font-mono text-3xl font-bold text-cyan-400 tabular-nums">{f.stat}</span>
                    <span className="font-mono text-xs text-neutral-600 ml-2 tracking-wider uppercase">{f.statLabel}</span>
                  </div>
                  <h3 className="text-lg font-semibold tracking-tight">{f.title}</h3>
                  <p className="text-sm text-neutral-500 mt-2 leading-relaxed flex-1">{f.description}</p>
                </motion.div>
              ))}
            </div>
          </FadeContent>
        </div>
      </section>

      {/* ── Testimonials ── */}
      <section className="py-16 md:py-24 border-y border-white/5">
        <div className="max-w-6xl mx-auto px-6 md:px-12">
          <FadeContent blur direction="up">
            <p className="font-mono text-xs tracking-widest uppercase text-neutral-600 mb-12">What teams say</p>
            <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
              {testimonials.map((t, i) => (
                <motion.div
                  key={t.name}
                  initial={{ opacity: 0, y: 20 }}
                  whileInView={{ opacity: 1, y: 0 }}
                  viewport={{ once: true }}
                  transition={{ delay: i * 0.1, ...ENTRANCE }}
                  className="flex flex-col"
                >
                  <p className="text-sm text-neutral-300 leading-relaxed flex-1">&ldquo;{t.quote}&rdquo;</p>
                  <div className="mt-6 pt-4 border-t border-white/5">
                    <p className="text-sm font-medium">{t.name}</p>
                    <p className="text-xs text-neutral-600 mt-0.5">{t.role}</p>
                  </div>
                </motion.div>
              ))}
            </div>
          </FadeContent>
        </div>
      </section>

      {/* ── CTA ── */}
      <section className="py-24 md:py-40 px-6 md:px-12">
        <div className="max-w-3xl mx-auto text-center">
          <FadeContent blur direction="up">
            <h2 className="text-4xl md:text-6xl font-bold tracking-tighter leading-[0.9]">
              Your data is{' '}
              <span className="font-serif italic font-normal text-cyan-400">talking.</span>
              <br />
              <span className="text-neutral-500 font-medium">Are you listening?</span>
            </h2>
            <div className="mt-10">
              <Magnet>
                <a href="/start" className="inline-flex px-8 py-4 bg-cyan-500 hover:bg-cyan-400 text-black rounded-full text-sm font-semibold transition-colors">
                  Start free trial
                </a>
              </Magnet>
            </div>
          </FadeContent>
        </div>
      </section>
    </main>
  );
}
```
