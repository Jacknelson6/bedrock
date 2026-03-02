# Dependency Map — Bedrock Reference

## Core (needed by most components)
```bash
npm install motion clsx tailwind-merge
```

## cn() Utility (create if missing)
```tsx
// lib/utils.ts
import { clsx, type ClassValue } from "clsx";
import { twMerge } from "tailwind-merge";
export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}
```

## Dependency Groups

**Motion Only** (many components): `npm install motion clsx tailwind-merge`
**CSS Only** (ShinyText, GradientText, Noise, Squares, Waves, LetterGlitch, Iridescence, etc.): No animation deps needed
**OGL** (Aurora): `npm install ogl`
**Three.js** (Particles, Hyperspeed, Threads, Beams, ShapeBlur, Silk, Ballpit, Galaxy, GridDistortion): `npm install three @react-three/fiber @react-three/drei`
**GSAP** (BlobCursor, AnimatedContent): `npm install gsap`
**Icons** (optional UI): `npm install lucide-react`

## Version Pins
```json
{
  "motion": "^11.15.0",
  "clsx": "^2.1.1",
  "tailwind-merge": "^2.6.0",
  "ogl": "^1.0.0",
  "three": "^0.170.0",
  "@react-three/fiber": "^8.17.0",
  "@react-three/drei": "^9.114.0",
  "gsap": "^3.12.0",
  "lucide-react": "^0.460.0"
}
```

## Auto-Install Logic
1. Read target project's `package.json`
2. Check which deps from the component's group are installed
3. Install only missing ones
4. Create `lib/utils.ts` with `cn()` if it doesn't exist
5. Verify Tailwind is configured (check for `tailwind.config.*` or CSS-based Tailwind v4)
