# Layout & Navigation — Bedrock Reference

| Need | Component |
|------|-----------|
| Scroll/mount entrance | **AnimatedContent** ⭐ (ReactBits, gsap) — configurable entrance wrapper |
| Simple fade entrance | **FadeContent** (ReactBits) — lightweight directional fade |
| Carousel/slider | **Carousel** (ReactBits) — touch gestures + spring |
| Masonry grid | **Masonry** (ReactBits) — responsive masonry layout |
| Scroll stacking | **ScrollStack** (ReactBits) — cards stack on scroll |
| Circular gallery | **CircularGallery** (ReactBits) — circular image gallery |
| Dome gallery | **DomeGallery** (ReactBits) — dome image gallery |
| Flying posters | **FlyingPosters** (ReactBits) — floating poster gallery |
| Lanyard badge | **Lanyard** (ReactBits) — draggable lanyard |
| Logo loop | **LogoLoop** (ReactBits) — infinite logo scroll |
| Chroma grid | **ChromaGrid** (ReactBits) — chromatic grid layout |
| Magic bento | **MagicBento** (ReactBits) — bento grid layout |

**AnimatedContent is the key layout component.** Wrap sections for scroll-triggered entrances. For lightweight cases, use FadeContent (no gsap dependency).

**For accordion/expand-collapse**, use motion/react's `AnimatePresence` + height animation:

```tsx
'use client';
import { motion, AnimatePresence } from 'motion/react';

function Accordion({ open, children }: { open: boolean; children: React.ReactNode }) {
  return (
    <AnimatePresence>
      {open && (
        <motion.div
          initial={{ height: 0, opacity: 0 }}
          animate={{ height: 'auto', opacity: 1 }}
          exit={{ height: 0, opacity: 0 }}
          transition={{ type: 'spring', stiffness: 200, damping: 25 }}
          className="overflow-hidden"
        >
          {children}
        </motion.div>
      )}
    </AnimatePresence>
  );
}
```
