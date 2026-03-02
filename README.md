# Bedrock

**The definitive animated frontend component system for Claude Code.**

Bedrock is a curated skill that gives Claude Code access to 120+ production-grade animated components from ReactBits — ready to compose into SaaS landing pages, marketing sites, and web applications.

## What's Inside

| Library | Components | Stack |
|---------|-----------|-------|
| [ReactBits](https://github.com/DavidHDev/react-bits) | ~122 | Motion, GSAP, Three.js, OGL |

### Component Categories

- **Text Effects** (23) — Hero headlines, split text, blur reveal, decrypt, scramble, count up
- **Animations** (28) — Magnetic, cursor effects, transitions, trails, ribbons
- **Components** (35) — Cards, docks, carousels, galleries, menus, navigation
- **Backgrounds** (36) — Aurora, particles, beams, silk, waves, noise, and 30+ more

## Install

### Quick Install (Recommended)

```bash
# Clone into your Claude Code skills directory
git clone https://github.com/Jacknelson6/bedrock.git ~/.claude/skills/bedrock
```

### Manual Install

```bash
git clone https://github.com/Jacknelson6/bedrock.git /tmp/bedrock
cp -r /tmp/bedrock ~/.claude/skills/bedrock
```

After installing, restart Claude Code. The skill auto-triggers when you ask to build any frontend UI.

## How It Works

When you ask Claude Code to build a landing page, hero section, feature grid, or any animated UI:

1. **Catalog lookup** — Matches your request to 120+ curated components
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
│   ├── ssr-prerender.md
│   ├── style-profiles.md
│   ├── typography-recipes.md
│   ├── design-tokens.md
│   └── motion-theory.md
├── templates/            # Full page composition blueprints
│   ├── complete-examples.md
│   ├── saas-landing.md
│   ├── hero-section.md
│   ├── features-grid.md
│   └── dashboard-shell.md
├── source/               # Raw component source from ReactBits
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

Bedrock curates components from:

- [ReactBits](https://reactbits.dev) by DavidHDev

## License

MIT
