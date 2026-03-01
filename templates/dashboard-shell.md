# Dashboard Shell — Bedrock Template

For app interfaces, dashboards, and internal tools. Focuses on functional animation that aids usability rather than marketing-style dramatic entrances.

## Layout Structure

```
┌──────────────────────────────────────────────┐
│  TOPBAR (Navbar with blur backdrop)          │
│  Logo · Search · Notifications · Avatar      │
├────────┬─────────────────────────────────────┤
│        │  BREADCRUMBS / PAGE TITLE           │
│  SIDE  │  (AnimatedBackground tab indicator) │
│  BAR   ├─────────────────────────────────────┤
│        │                                     │
│  Nav   │  CONTENT AREA                       │
│  with  │  ┌─────────┐ ┌─────────┐           │
│  Dock  │  │ Stat    │ │ Stat    │           │
│  style │  │ Card    │ │ Card    │           │
│        │  │ (Number)│ │ (Number)│           │
│        │  └─────────┘ └─────────┘           │
│        │  ┌──────────────────────┐           │
│        │  │  Data Table / Chart  │           │
│        │  │  (AnimatedGroup)     │           │
│        │  └──────────────────────┘           │
│        │                                     │
├────────┴─────────────────────────────────────┤
│  TOOLBAR (ToolbarDynamic, context-aware)     │
└──────────────────────────────────────────────┘
```

## Key Components for Dashboards

### Stat Cards
```tsx
<AnimatedGroup preset="fade" className="grid grid-cols-2 lg:grid-cols-4 gap-4">
  {stats.map(stat => (
    <div key={stat.label} className="p-6 rounded-xl border bg-card">
      <p className="text-sm text-muted-foreground">{stat.label}</p>
      <div className="mt-2 flex items-baseline gap-2">
        <AnimatedNumber
          value={stat.value}
          springOptions={{ stiffness: 150, damping: 25 }}
          className="text-3xl font-bold tabular-nums"
        />
        <span className={`text-sm ${stat.trend > 0 ? 'text-green-500' : 'text-red-500'}`}>
          {stat.trend > 0 ? '+' : ''}{stat.trend}%
        </span>
      </div>
    </div>
  ))}
</AnimatedGroup>
```

### Sidebar Navigation
```tsx
<nav className="w-64 border-r bg-card p-4">
  <AnimatedBackground
    defaultValue={currentPage}
    className="rounded-lg bg-muted"
    transition={{ type: "spring", stiffness: 300, damping: 30 }}
  >
    {navItems.map(item => (
      <a key={item.id} data-id={item.id} href={item.href}
         className="flex items-center gap-3 px-3 py-2.5 text-sm rounded-lg">
        <item.icon className="w-4 h-4" />
        {item.label}
        {item.badge && <NotificationBadge count={item.badge} />}
      </a>
    ))}
  </AnimatedBackground>
</nav>
```

### Floating Toolbar
```tsx
<ToolbarDynamic className="fixed bottom-6 left-1/2 -translate-x-1/2 z-50 bg-card border rounded-full px-4 py-2 shadow-xl">
  {selectedItems.length > 0 ? (
    // Context: items selected
    <div className="flex items-center gap-3">
      <span className="text-sm">{selectedItems.length} selected</span>
      <button>Archive</button>
      <button>Delete</button>
    </div>
  ) : (
    // Default: quick actions
    <div className="flex items-center gap-3">
      <button>New</button>
      <button>Import</button>
      <button>Export</button>
    </div>
  )}
</ToolbarDynamic>
```

### Page Transitions
```tsx
<TransitionPanel
  variants={{
    enter: { opacity: 0, x: 20, filter: "blur(4px)" },
    center: { opacity: 1, x: 0, filter: "blur(0px)" },
    exit: { opacity: 0, x: -20, filter: "blur(4px)" }
  }}
  transition={{ duration: 0.3 }}
>
  {/* Current page content */}
</TransitionPanel>
```

## Dashboard Motion Guidelines

Dashboard animations should be **subtle and fast** — they aid comprehension, not create spectacle:

- Stat number transitions: 200-400ms (fast spring)
- Page transitions: 200-300ms (quick fade/slide)
- List item staggers: 30ms between items (rapid cascade)
- Sidebar indicator: 150ms spring (snappy)
- Toasts/notifications: 300ms entrance, 200ms exit
- Loading skeletons: continuous shimmer at 1.5s cycle

Avoid in dashboards: dramatic text effects, heavy backgrounds, slow staggers, 3D effects.
