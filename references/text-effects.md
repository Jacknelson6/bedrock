# Text Effects — Bedrock Reference

Text animations are the highest-impact, lowest-effort way to make a page feel alive. They draw the eye immediately and set the tone.

## When to Use What

| Need | Component | Why |
|------|-----------|-----|
| Hero headlines | **SplitText** ⭐ | Advanced char/word/line splits with custom animation |
| Cinematic entrance | **BlurText** | Blur-to-focus reveal |
| Dramatic reveal | **DecryptedText** | Matrix-style character decrypt |
| Subtle CSS-only | **ShinyText** or **GradientText** | Zero JS |
| Counting numbers | **CountUp** | Count from 0 to N |
| Playful energy | **FallingText** | Characters fall with gravity |
| Rotating taglines | **RotatingText** | Cycle phrases: "We build [X\|Y\|Z]" |
| Hover interaction | **ScrambledText** | Text scrambles on hover/trigger |
| Scroll experience | **ScrollReveal** | Scroll-triggered reveal |
| Loading/status | **ShinyText** | Gradient sweep |
| Glitch aesthetic | **GlitchText** or **FuzzyText** | Edgy distortion |
| Focus highlight | **TrueFocus** | Focus moves across words |
| Typewriter | **TextType** | Typing effect with cursor |
| Circular badge | **CircularText** | Text in a circle |

## Component Details

### SplitText (ReactBits) ⭐ PRIMARY
**Why:** Most versatile. Splits text by word or char, applies staggered motion variants. Clean API with custom animation per split type.

```tsx
<SplitText text="Build something extraordinary" className="text-6xl font-bold" delay={50} />
```

### BlurText (ReactBits)
Blur-to-focus entrance. Cinematic, dreamy. Great for hero subtitles.

### DecryptedText (ReactBits)
Matrix-style character-by-character decrypt. More dramatic than ScrambledText.

### ShinyText (ReactBits)
CSS-only shimmer sweep. Zero JS — lightest weight option.

### GradientText (ReactBits)
Animated gradient flowing through text color. CSS-only.

### FallingText (ReactBits)
Characters fall from above with physics. Playful entrance.

### CircularText (ReactBits)
Static text in circle layout. CSS-only.

### CountUp (ReactBits)
Count from start to end value. One-directional count animation.

### FuzzyText (ReactBits)
Fuzzy/glitch rendering. CSS-only. Edgy aesthetic.

### TrueFocus (ReactBits)
Focus highlight moves across words on hover/read. Unique interaction.

### TextPressure (ReactBits)
Pressure-responsive text that reacts to cursor proximity.

### ScrollFloat (ReactBits)
Text floats on scroll with parallax-like effect.

### ScrollReveal (ReactBits)
Scroll-triggered reveal animation.

### ASCIIText (ReactBits)
Renders text as ASCII art.

### ScrambledText (ReactBits)
Scramble through random characters before settling.

### RotatingText (ReactBits)
Cycles through text options with rotation animation.

### GlitchText (ReactBits)
Glitch distortion effect on text.

### ScrollVelocity (ReactBits)
Text speed changes based on scroll velocity.

### VariableProximity (ReactBits)
Variable font weight/width changes based on cursor proximity.

### CurvedLoop (ReactBits)
Text follows a curved, looping path.

### TextType (ReactBits)
Typewriter effect with blinking cursor.

### Shuffle (ReactBits)
Characters shuffle/randomize before settling.

### TextCursor (ReactBits)
Blinking cursor effect for text.

## SSR Notes
All text components render final text into the DOM — crawlers see the content. Exception: DecryptedText/ScrambledText show random chars during animation — wrap with `aria-label`.
