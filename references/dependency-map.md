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

**Motion Only** (most components): `npm install motion clsx tailwind-merge`
**CSS Only** (ShinyText, GradientText, Aurora, Beams, Noise, Squares, Waves, etc.): No animation deps needed
**Three.js** (Globe, Particles, Hyperspeed, Threads): `npm install three @react-three/fiber @react-three/drei`
**GSAP** (some SmoothUI internals): `npm install gsap`
**Icons** (ButtonCopy, toolbars, etc.): `npm install lucide-react`

## Version Pins
```json
{
  "motion": "^11.15.0",
  "clsx": "^2.1.1",
  "tailwind-merge": "^2.6.0",
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
5. Verify Tailwind is configured (check for `tailwind.config.*`)
