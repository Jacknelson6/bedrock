# Layout & Navigation — Bedrock Reference

| Need | Component |
|------|-----------|
| Expand/collapse FAQ | **Accordion** ⭐ (Motion Primitives) — proper height anim |
| Active nav indicator | **AnimatedBackground** (Motion Primitives) — sliding bg |
| Staggered group entrance | **AnimatedGroup** (Motion Primitives) — orchestrated |
| Carousel/slider | **Carousel** (Motion Primitives) — swipe + spring |
| Animated modal | **Dialog** (Motion Primitives) |
| Single disclosure | **Disclosure** (Motion Primitives) |
| Scroll-triggered anim | **InView** ⭐ (Motion Primitives) — Intersection Observer |
| Panel transitions | **TransitionPanel** (Motion Primitives) — AnimatePresence |
| Loading skeleton | **SkeletonLoader** (SmoothUI) — shimmer placeholder |
| Notification count | **NotificationBadge** (SmoothUI) — spring badge |
| Testimonial slider | **ReviewsCarousel** (SmoothUI) |

**InView is the most important layout component.** Wrap EVERY section in a SaaS landing page with InView for scroll-triggered entrances. Use `viewOptions={{ once: true, margin: "-100px" }}` for responsive triggering.

**Accordion for FAQ:** Content stays in the DOM when collapsed — search engines index it. Add FAQPage JSON-LD structured data.
