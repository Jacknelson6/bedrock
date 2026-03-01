# Text Effects — Bedrock Reference

Text animations are the highest-impact, lowest-effort way to make a page feel alive. They draw the eye immediately and set the tone.

## When to Use What

| Need | Component | Why |
|------|-----------|-----|
| Hero headlines | **TextEffect** ⭐ | Staggered word/char entrance, most versatile |
| Rotating taglines | **TextLoop** | Cycle phrases: "We build [X\|Y\|Z]" |
| Value morphing | **TextMorph** | Smooth transition between strings |
| Dramatic reveal | **DecryptedText** or **TextScramble** | Matrix-style decrypt |
| Hover interaction | **ScrambleHover** | Nav links, buttons |
| Scroll experience | **ScrollRevealParagraph** | Word-by-word scroll |
| Loading/status | **TextShimmer** | Gradient sweep |
| Subtle CSS-only | **ShinyText** or **GradientText** | Zero JS |
| Counting numbers | **CountUp** | Count from 0 to N |
| Cinematic entrance | **BlurText** | Blur-to-focus |
| Playful energy | **WaveText** or **FallingText** | Bouncy/gravity |

## Component Details

### TextEffect (Motion Primitives) ⭐ PRIMARY
**Why:** Most versatile. Splits text by word or char, applies staggered Motion variants. Clean API with `per` prop and built-in presets.

**Props:** `children: string`, `per: "word" | "char"`, `preset: "blur" | "fade" | "slide" | "scale"`, `variants: { container, item }`, `as: ElementType`

```tsx
<TextEffect as="h1" per="word" preset="blur" className="text-6xl font-bold">
  Build something extraordinary
</TextEffect>
```

### TextMorph (Motion Primitives)
Morphs between two text strings character by character. Use for toggling labels ("Sign In" ↔ "Sign Up").

### TextScramble (Motion Primitives)
Scrambles through random characters before settling. Controlled via `trigger` prop.

### TextShimmer (Motion Primitives)
Gradient shimmer sweep. Props: `duration` (cycle time), `spread` (width).

### TextShimmerWave (Motion Primitives)
Wave-pattern shimmer through individual characters. More organic than TextShimmer.

### TextLoop (Motion Primitives)
Cycles through children with AnimatePresence. Props: `children: ReactNode[]`, `interval: number`.

### TextRoll (Motion Primitives)
Rolling/flipping text. More dramatic than TextLoop.

### WaveText (SmoothUI)
Per-character wave bounce. Playful, energetic.

### RevealText (SmoothUI)
Scroll-triggered slide-up reveal with mask. Editorial feel.

### TypewriterText (SmoothUI)
Typing effect with blinking cursor. AI/terminal aesthetic.

### ScrambleHover (SmoothUI)
Text scrambles on hover. Perfect for nav links, interactive text.

### ScrollRevealParagraph (SmoothUI)
Word-by-word reveal linked to scroll position. Dim→bright per word.

### SpinningText (Motion Primitives)
Text in a rotating circle. Decorative badge element.

### SplitText (ReactBits)
Advanced split by char/word/line with custom animation per type. More control than TextEffect for complex cases.

### BlurText (ReactBits)
Blur-to-focus entrance. Cinematic, dreamy.

### ShinyText (ReactBits)
CSS-only shimmer sweep. Zero JS — lightest weight option.

### GradientText (ReactBits)
Animated gradient flowing through text color. CSS-only.

### FallingText (ReactBits)
Characters fall from above with physics. Playful entrance.

### DecryptedText (ReactBits)
Matrix-style character-by-character decrypt. More dramatic than TextScramble.

### CircularText (ReactBits)
Static text in circle layout. CSS-only.

### CountUp (ReactBits)
Count from start to end value. One-directional count animation.

### FuzzyText (ReactBits)
Fuzzy/glitch rendering. CSS-only. Edgy aesthetic.

### TrueFocus (ReactBits)
Focus highlight moves across words on hover/read. Unique interaction.

## SSR Notes
All text components render final text into the DOM — crawlers see the content. Exception: TextScramble/DecryptedText show random chars during animation — wrap with `aria-label`.
