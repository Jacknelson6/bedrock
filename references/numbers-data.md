# Numbers & Data — Bedrock Reference

| Need | Component |
|------|-----------|
| Smooth value transition | **AnimatedNumber** ⭐ (Motion Primitives) — spring interpolation |
| Slot machine digits | **SlidingNumber** (Motion Primitives) — per-digit slide |
| Rapid updates | **NumberFlow** (SmoothUI) — handles frequent changes |
| Currency display | **PriceFlow** (SmoothUI) — formatted + animated |
| Progress bar | **AnimatedProgressBar** (SmoothUI) — spring fill |

**Always use `tabular-nums`** font variant on number displays to prevent layout shift.
**AnimatedNumber vs CountUp:** AnimatedNumber handles bidirectional (up+down), CountUp is one-time upward only.
