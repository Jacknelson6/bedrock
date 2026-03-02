# Numbers & Data — Bedrock Reference

| Need | Component |
|------|-----------|
| One-time count up | **CountUp** ⭐ (ReactBits) — count from start to end value |
| Interactive counter | **Counter** (ReactBits) — increment/decrement control |

**For bidirectional animated numbers** (values that go up AND down), use motion/react's `useSpring` + `useTransform`:

```tsx
'use client';
import { motion, useSpring, useTransform } from 'motion/react';
import { useEffect } from 'react';

function AnimatedValue({ value }: { value: number }) {
  const spring = useSpring(0, { stiffness: 80, damping: 25 });
  const display = useTransform(spring, (v) => Math.round(v).toLocaleString());

  useEffect(() => { spring.set(value); }, [value, spring]);

  return <motion.span>{display}</motion.span>;
}
```

**Always use `tabular-nums`** font variant on number displays to prevent layout shift.
