#!/bin/bash
# Bedrock Project Detection Script
# Analyzes the current project to determine framework, dependencies, and configuration.
# Outputs a JSON summary for Claude Code to parse.
#
# Usage: bash detect-project.sh [project-root]
#   project-root: Path to project root (default: current directory)

set -euo pipefail

PROJECT_ROOT="${1:-.}"
PKG_JSON="$PROJECT_ROOT/package.json"

# Initialize detection results
FRAMEWORK="unknown"
ROUTER="unknown"
HAS_MOTION=false
HAS_FRAMER_MOTION=false
HAS_GSAP=false
HAS_THREE=false
HAS_R3F=false
HAS_DREI=false
HAS_TAILWIND=false
HAS_SHADCN=false
HAS_CLSX=false
HAS_TW_MERGE=false
HAS_CN_UTIL=false
HAS_LUCIDE=false

# Check package.json exists
if [ ! -f "$PKG_JSON" ]; then
  echo '{"error": "No package.json found at '"$PROJECT_ROOT"'"}'
  exit 1
fi

PKG=$(cat "$PKG_JSON")

# Helper: check if a package exists in dependencies or devDependencies
has_dep() {
  echo "$PKG" | grep -q "\"$1\"" && echo true || echo false
}

# Framework detection
if echo "$PKG" | grep -q '"next"'; then
  FRAMEWORK="nextjs"
  if [ -d "$PROJECT_ROOT/app" ]; then
    ROUTER="app"
  elif [ -d "$PROJECT_ROOT/src/app" ]; then
    ROUTER="app"
  elif [ -d "$PROJECT_ROOT/pages" ] || [ -d "$PROJECT_ROOT/src/pages" ]; then
    ROUTER="pages"
  else
    ROUTER="app" # Default assumption for new Next.js projects
  fi
elif echo "$PKG" | grep -q '"vite"'; then
  FRAMEWORK="vite"
elif echo "$PKG" | grep -q '"react-scripts"'; then
  FRAMEWORK="cra"
fi

# Animation library detection
HAS_MOTION=$(has_dep "motion")
HAS_FRAMER_MOTION=$(has_dep "framer-motion")
HAS_GSAP=$(has_dep "gsap")
HAS_THREE=$(has_dep '"three"')
HAS_R3F=$(has_dep "@react-three/fiber")
HAS_DREI=$(has_dep "@react-three/drei")

# UI framework detection
HAS_TAILWIND=$(has_dep "tailwindcss")
HAS_CLSX=$(has_dep "clsx")
HAS_TW_MERGE=$(has_dep "tailwind-merge")
HAS_LUCIDE=$(has_dep "lucide-react")

# shadcn/ui detection
if [ -f "$PROJECT_ROOT/components.json" ]; then
  HAS_SHADCN=true
elif [ -d "$PROJECT_ROOT/components/ui" ] || [ -d "$PROJECT_ROOT/src/components/ui" ]; then
  HAS_SHADCN=true
fi

# cn() utility detection
for util_path in "lib/utils.ts" "lib/utils.js" "src/lib/utils.ts" "src/lib/utils.js"; do
  if [ -f "$PROJECT_ROOT/$util_path" ]; then
    if grep -q "cn(" "$PROJECT_ROOT/$util_path" 2>/dev/null; then
      HAS_CN_UTIL=true
      break
    fi
  fi
done

# Output JSON
cat << EOF
{
  "framework": "$FRAMEWORK",
  "router": "$ROUTER",
  "animation": {
    "motion": $HAS_MOTION,
    "framer_motion": $HAS_FRAMER_MOTION,
    "gsap": $HAS_GSAP,
    "three": $HAS_THREE,
    "r3f": $HAS_R3F,
    "drei": $HAS_DREI
  },
  "ui": {
    "tailwind": $HAS_TAILWIND,
    "shadcn": $HAS_SHADCN,
    "clsx": $HAS_CLSX,
    "tw_merge": $HAS_TW_MERGE,
    "cn_util": $HAS_CN_UTIL,
    "lucide": $HAS_LUCIDE
  },
  "needs_install": {
    "motion": $([ "$HAS_MOTION" = false ] && [ "$HAS_FRAMER_MOTION" = false ] && echo true || echo false),
    "clsx": $([ "$HAS_CLSX" = false ] && echo true || echo false),
    "tailwind_merge": $([ "$HAS_TW_MERGE" = false ] && echo true || echo false),
    "cn_util": $([ "$HAS_CN_UTIL" = false ] && echo true || echo false)
  },
  "directives": {
    "use_client": $([ "$FRAMEWORK" = "nextjs" ] && [ "$ROUTER" = "app" ] && echo true || echo false),
    "motion_import": "motion/react",
    "ssr_false_for_webgl": $([ "$FRAMEWORK" = "nextjs" ] && echo true || echo false)
  }
}
EOF
