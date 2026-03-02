# Motion Design Theory

Apply these principles to every component.

## The Four Laws of UI Motion

**1. Purposeful Motion** — Every animation serves a function: guide attention, show relationships, provide feedback, or establish hierarchy. No decorative-only animation.

**2. Natural Physics** — Use spring physics (`type: "spring"`) as default for transforms. Objects in the real world don't move linearly. Reserve tween/easing for opacity and color.

**3. Temporal Hierarchy** — Important elements animate first. Secondary elements follow. Stagger delays: 30-60ms (rapid cascade), 80-120ms (deliberate reveal), 150-250ms (dramatic entrance).

**4. Contextual Duration** — Micro-interactions: 150-250ms. Entrances: 300-500ms. Page transitions: 400-700ms. Over 800ms = sluggish. Under 100ms = wasted.

## Spring Defaults
```tsx
// Snappy interactive elements (buttons, toggles)
transition={{ type: "spring", stiffness: 400, damping: 30 }}

// Smooth entrances (cards, sections)
transition={{ type: "spring", stiffness: 200, damping: 25 }}

// Gentle ambient (backgrounds, decorative)
transition={{ type: "spring", stiffness: 100, damping: 20 }}
```

## SaaS Landing Page Motion Rhythm
```
Hero:       Immediate — text animates on load (0ms delay), background is ambient
Section 2:  Scroll-triggered — feature cards stagger in (InView + AnimatedGroup)
Section 3:  Scroll-triggered — social proof slides (InfiniteSlider for logos)
Section 4:  Scroll-triggered — pricing numbers animate (AnimatedNumber on InView)
Section 5:  Scroll-triggered — testimonials carousel (ReviewsCarousel)
Footer CTA: Scroll-triggered — text effect + magnetic button
Optional: ScrollProgress bar at top (for content-heavy pages only)
```
