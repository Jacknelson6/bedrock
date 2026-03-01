# Features Grid — Bedrock Template

The features section communicates product capabilities. It must be scannable (users skim), beautiful (establishes quality), and indexable (SEO value from feature descriptions).

## Standard 3-Column Grid

```
┌────────────────────────────────────────────┐
│    Section Title (TextEffect, h2)          │
│    Section Description (motion.p)          │
│                                            │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐   │
│  │ Icon     │ │ Icon     │ │ Icon     │   │
│  │ Title    │ │ Title    │ │ Title    │   │
│  │ Desc     │ │ Desc     │ │ Desc     │   │
│  └──────────┘ └──────────┘ └──────────┘   │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐   │
│  │ Icon     │ │ Icon     │ │ Icon     │   │
│  │ Title    │ │ Title    │ │ Title    │   │
│  │ Desc     │ │ Desc     │ │ Desc     │   │
│  └──────────┘ └──────────┘ └──────────┘   │
└────────────────────────────────────────────┘
```

**Components:** InView (section trigger), AnimatedGroup (staggered entrance), GlowHoverCard (each card)

### Implementation Pattern

```tsx
'use client';
import { InView } from '@/components/ui/in-view';
import { AnimatedGroup } from '@/components/ui/animated-group';
import { GlowHoverCard } from '@/components/ui/glow-hover-card';

export function Features({ title, description, features }) {
  return (
    <section className="py-24 px-4" id="features">
      <div className="max-w-7xl mx-auto">
        {/* Section header — scroll triggered */}
        <InView
          variants={{ hidden: { opacity: 0, y: 30 }, visible: { opacity: 1, y: 0 } }}
          transition={{ duration: 0.6 }}
          viewOptions={{ once: true, margin: "-100px" }}
        >
          <div className="text-center mb-16">
            <h2 className="text-4xl md:text-5xl font-bold">{title}</h2>
            <p className="mt-4 text-lg text-muted-foreground max-w-2xl mx-auto">
              {description}
            </p>
          </div>
        </InView>

        {/* Feature cards — staggered entrance */}
        <InView
          variants={{ hidden: { opacity: 0 }, visible: { opacity: 1 } }}
          viewOptions={{ once: true, margin: "-50px" }}
        >
          <AnimatedGroup
            preset="blur"
            className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6"
          >
            {features.map((feature) => (
              <GlowHoverCard key={feature.title} className="p-8 rounded-xl">
                <div className="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center mb-5">
                  <feature.icon className="w-6 h-6 text-primary" />
                </div>
                <h3 className="text-xl font-semibold mb-3">{feature.title}</h3>
                <p className="text-muted-foreground leading-relaxed">
                  {feature.description}
                </p>
              </GlowHoverCard>
            ))}
          </AnimatedGroup>
        </InView>
      </div>
    </section>
  );
}
```

## Variant: Bento Grid (Asymmetric)

For products with a hero feature + supporting features:

```
┌───────────────────────┬──────────┐
│                       │          │
│   HERO FEATURE        │ Feature  │
│   (large card, 2x2)   │ 2       │
│                       │          │
│                       ├──────────┤
│                       │          │
│                       │ Feature  │
│                       │ 3       │
├───────────┬───────────┴──────────┤
│ Feature 4 │ Feature 5            │
└───────────┴──────────────────────┘
```

```tsx
<AnimatedGroup preset="scale" className="grid grid-cols-1 md:grid-cols-3 gap-4">
  <GlowHoverCard className="md:col-span-2 md:row-span-2 p-10">
    {/* Hero feature with larger icon, more detail */}
  </GlowHoverCard>
  <GlowHoverCard className="p-6">{/* Feature 2 */}</GlowHoverCard>
  <GlowHoverCard className="p-6">{/* Feature 3 */}</GlowHoverCard>
  <GlowHoverCard className="p-6">{/* Feature 4 */}</GlowHoverCard>
  <GlowHoverCard className="md:col-span-2 p-6">{/* Feature 5 */}</GlowHoverCard>
</AnimatedGroup>
```

## Variant: Feature with Screenshot

For features that benefit from visual proof:

```tsx
<InView variants={{ hidden: { opacity: 0, y: 40 }, visible: { opacity: 1, y: 0 } }}
        viewOptions={{ once: true }}>
  <div className="grid md:grid-cols-2 gap-12 items-center">
    <div>
      <h3 className="text-3xl font-bold">{feature.title}</h3>
      <p className="mt-4 text-muted-foreground">{feature.description}</p>
      <ul className="mt-6 space-y-3">
        {feature.bullets.map(b => (
          <li key={b} className="flex items-center gap-3">
            <CheckCircle className="w-5 h-5 text-primary shrink-0" />
            <span>{b}</span>
          </li>
        ))}
      </ul>
    </div>
    <Tilt rotationFactor={6}>
      <Image src={feature.image} alt={feature.title}
             className="rounded-xl border shadow-lg" width={600} height={400} />
    </Tilt>
  </div>
</InView>
```

Alternate the image side (left/right) for each feature row to create visual rhythm.

---

## SEO Notes

- Each feature's `title` and `description` should contain relevant keywords
- Use proper heading hierarchy: `<h2>` for section, `<h3>` for each feature
- Feature descriptions should be substantive (2-3 sentences minimum) for indexable content
- The grid is fully server-rendered — all text is in the HTML
