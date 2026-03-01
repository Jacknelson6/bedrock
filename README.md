# Bedrock

**The definitive animated frontend component system for Claude Code.**

Bedrock is a curated skill that gives Claude Code access to 150+ production-grade animated components from four leading open-source libraries — ready to compose into SaaS landing pages, marketing sites, and web applications.

## What's Inside

| Library | Components | Stack |
|---------|-----------|-------|
| [AnimateUI](https://github.com/imskyleen/animate-ui) | ~40 | Motion, Radix, shadcn |
| [SmoothUI](https://github.com/educlopez/smoothui) | ~50 | Motion, GSAP, shadcn |
| [Motion Primitives](https://github.com/ibelick/motion-primitives) | ~35 | Motion |
| [ReactBits](https://github.com/DavidHDev/react-bits) | ~135 | Motion, GSAP, Three.js |

### Component Categories

- **Text Effects** (24) — Hero headlines, typing, scramble, shimmer, morph, wave
- **Backgrounds** (15) — Aurora, particles, beams, gradients, noise, waves
- **Interactive Elements** (15) — Magnetic, cursor, tilt, glow, spotlight, dock
- **Cards & Content** (12) — Glow hover, expandable, tweet, spotlight cards
- **Buttons & Inputs** (11) — Magnetic, copy, morph, animated inputs
- **Numbers & Data** (5) — Animated numbers, sliding digits, price flow
- **Toolbars & Menus** (10) — Dynamic toolbars, morphing dialogs, popovers
- **Layout & Navigation** (11) — Accordion, carousel, scroll-triggered, transitions
- **3D & WebGL** (8) — Globe, hyperspeed, threads, orbs

## Install

### Quick Install (Recommended)

```bash
# Clone into your Claude Code skills directory
git clone https://github.com/OWNER/bedrock.git ~/.claude/skills/bedrock
```

### Manual Install

```bash
git clone https://github.com/OWNER/bedrock.git /tmp/bedrock
cp -r /tmp/bedrock ~/.claude/skills/bedrock
```

After installing, restart Claude Code. The skill auto-triggers when you ask to build any frontend UI.

## How It Works

When you ask Claude Code to build a landing page, hero section, feature grid, or any animated UI:

1. **Catalog lookup** — Matches your request to 150+ curated components
2. **Reference guides** — Reads category-specific implementation guides
3. **Source code** — Pulls exact component source (not generic training data)
4. **Project detection** — Adapts to your framework (Next.js, Vite, etc.)
5. **Composition** — Wires components together with proper scroll triggers and motion rhythm

## Repo Structure

```
bedrock/
├── SKILL.md              # Component catalog, rules, decision framework
├── references/           # Category implementation guides
│   ├── text-effects.md
│   ├── backgrounds.md
│   ├── interactive-elements.md
│   ├── cards-content.md
│   ├── buttons-inputs.md
│   ├── numbers-data.md
│   ├── toolbars-menus.md
│   ├── layout-navigation.md
│   ├── threed-webgl.md
│   ├── dependency-map.md
│   └── ssr-prerender.md
├── templates/            # Full page composition blueprints
│   ├── saas-landing.md
│   ├── hero-section.md
│   ├── features-grid.md
│   └── dashboard-shell.md
├── source/               # Raw component source from all 4 libraries
│   ├── animate-ui-components.txt
│   ├── animate-ui-docs.txt
│   ├── smoothui-components.txt
│   ├── smoothui-docs.txt
│   ├── motion-primitives-components.txt
│   ├── motion-primitives-docs.txt
│   ├── reactbits-components.txt
│   └── reactbits-docs.txt
└── scripts/
    ├── setup.sh          # First-time setup
    ├── update.sh         # Update source files
    └── detect-project.sh # Project environment detection
```

## Trigger Words

Bedrock activates when you mention: animation, motion, micro-interactions, "make it look good," "premium feel," "modern UI," landing page, hero section, feature grid, pricing table, or any request involving polished React components.

## Credits

Bedrock curates components from these excellent open-source projects:

- [AnimateUI](https://animate-ui.com) by imskyleen
- [SmoothUI](https://smoothui.dev) by educlopez
- [Motion Primitives](https://motion-primitives.com) by ibelick
- [ReactBits](https://reactbits.dev) by DavidHDev

## License

MIT
