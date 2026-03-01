#!/bin/bash
# Bedrock Setup Script
# Fetches component source code and documentation from all four library GitHub repos.
# Populates the source/ directory with consolidated .txt files.
#
# Usage: bash setup.sh
#
# This script is designed to be run by Claude Code. It clones the repos temporarily,
# extracts component source code, and organizes it into reference files.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BEDROCK_DIR="$(dirname "$SCRIPT_DIR")"
SOURCE_DIR="$BEDROCK_DIR/source"
TEMP_DIR=$(mktemp -d)

echo "🪨 Bedrock Setup — Fetching component source code..."
echo "   Temp directory: $TEMP_DIR"
echo ""

mkdir -p "$SOURCE_DIR"

# --- AnimateUI ---
echo "📦 [1/4] Cloning AnimateUI..."
git clone --depth 1 https://github.com/imskyleen/animate-ui.git "$TEMP_DIR/animate-ui" 2>/dev/null

echo "   Extracting components..."
{
  echo "# AnimateUI — Component Source Code"
  echo "# Scraped from github.com/imskyleen/animate-ui"
  echo "# $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo ""
  find "$TEMP_DIR/animate-ui/packages" -name "*.tsx" -o -name "*.ts" | sort | while read -r file; do
    relpath="${file#$TEMP_DIR/animate-ui/}"
    echo "=========================================="
    echo "FILE: $relpath"
    echo "=========================================="
    cat "$file"
    echo ""
    echo ""
  done
} > "$SOURCE_DIR/animate-ui-components.txt"

echo "   Extracting docs..."
{
  echo "# AnimateUI — Documentation"
  echo "# Scraped from github.com/imskyleen/animate-ui"
  echo ""
  find "$TEMP_DIR/animate-ui/apps/www" -name "*.mdx" -o -name "*.md" | sort | while read -r file; do
    relpath="${file#$TEMP_DIR/animate-ui/}"
    echo "=========================================="
    echo "FILE: $relpath"
    echo "=========================================="
    cat "$file"
    echo ""
    echo ""
  done
} > "$SOURCE_DIR/animate-ui-docs.txt"

echo "   ✅ AnimateUI complete"

# --- Motion Primitives ---
echo "📦 [2/4] Cloning Motion Primitives..."
git clone --depth 1 https://github.com/ibelick/motion-primitives.git "$TEMP_DIR/motion-primitives" 2>/dev/null

echo "   Extracting components..."
{
  echo "# Motion Primitives — Component Source Code"
  echo "# Scraped from github.com/ibelick/motion-primitives"
  echo "# $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo ""
  find "$TEMP_DIR/motion-primitives/components" -name "*.tsx" -o -name "*.ts" | sort | while read -r file; do
    relpath="${file#$TEMP_DIR/motion-primitives/}"
    echo "=========================================="
    echo "FILE: $relpath"
    echo "=========================================="
    cat "$file"
    echo ""
    echo ""
  done
} > "$SOURCE_DIR/motion-primitives-components.txt"

echo "   Extracting docs..."
{
  echo "# Motion Primitives — Documentation"
  echo "# Scraped from github.com/ibelick/motion-primitives"
  echo ""
  find "$TEMP_DIR/motion-primitives" -path "*/content/*" -name "*.mdx" -o -name "*.md" | sort | while read -r file; do
    relpath="${file#$TEMP_DIR/motion-primitives/}"
    echo "=========================================="
    echo "FILE: $relpath"
    echo "=========================================="
    cat "$file"
    echo ""
    echo ""
  done
} > "$SOURCE_DIR/motion-primitives-docs.txt"

echo "   ✅ Motion Primitives complete"

# --- SmoothUI ---
echo "📦 [3/4] Cloning SmoothUI..."
git clone --depth 1 https://github.com/educlopez/smoothui.git "$TEMP_DIR/smoothui" 2>/dev/null

echo "   Extracting components..."
{
  echo "# SmoothUI — Component Source Code"
  echo "# Scraped from github.com/educlopez/smoothui"
  echo "# $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo ""
  # SmoothUI stores components in various locations
  find "$TEMP_DIR/smoothui" -path "*/components/*" -name "*.tsx" | sort | while read -r file; do
    relpath="${file#$TEMP_DIR/smoothui/}"
    echo "=========================================="
    echo "FILE: $relpath"
    echo "=========================================="
    cat "$file"
    echo ""
    echo ""
  done
} > "$SOURCE_DIR/smoothui-components.txt"

echo "   Extracting docs..."
{
  echo "# SmoothUI — Documentation"
  echo "# Scraped from github.com/educlopez/smoothui"
  echo ""
  find "$TEMP_DIR/smoothui" -name "*.mdx" -o -path "*/content/*" -name "*.md" | sort | while read -r file; do
    relpath="${file#$TEMP_DIR/smoothui/}"
    echo "=========================================="
    echo "FILE: $relpath"
    echo "=========================================="
    cat "$file"
    echo ""
    echo ""
  done
} > "$SOURCE_DIR/smoothui-docs.txt"

echo "   ✅ SmoothUI complete"

# --- ReactBits ---
echo "📦 [4/4] Cloning ReactBits..."
git clone --depth 1 https://github.com/DavidHDev/react-bits.git "$TEMP_DIR/react-bits" 2>/dev/null

echo "   Extracting components (TypeScript + Tailwind variants only)..."
{
  echo "# ReactBits — Component Source Code (TS + Tailwind)"
  echo "# Scraped from github.com/DavidHDev/react-bits"
  echo "# $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  echo ""
  # ReactBits has components in src/content/ organized by category
  find "$TEMP_DIR/react-bits/src" -name "*.tsx" -o -name "*.ts" -o -name "*.jsx" | sort | while read -r file; do
    relpath="${file#$TEMP_DIR/react-bits/}"
    echo "=========================================="
    echo "FILE: $relpath"
    echo "=========================================="
    cat "$file"
    echo ""
    echo ""
  done
} > "$SOURCE_DIR/reactbits-components.txt"

echo "   Extracting docs..."
{
  echo "# ReactBits — Documentation"
  echo "# Scraped from github.com/DavidHDev/react-bits"
  echo ""
  find "$TEMP_DIR/react-bits" -name "*.mdx" -o -name "*.md" | grep -v node_modules | grep -v CHANGELOG | sort | while read -r file; do
    relpath="${file#$TEMP_DIR/react-bits/}"
    echo "=========================================="
    echo "FILE: $relpath"
    echo "=========================================="
    cat "$file"
    echo ""
    echo ""
  done
} > "$SOURCE_DIR/reactbits-docs.txt"

echo "   ✅ ReactBits complete"

# --- Save version manifest ---
echo ""
echo "📋 Saving version manifest..."
{
  echo "{"
  echo "  \"scraped_at\": \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\","

  cd "$TEMP_DIR/animate-ui"
  AUI_SHA=$(git rev-parse HEAD)
  echo "  \"animate_ui\": { \"repo\": \"imskyleen/animate-ui\", \"sha\": \"$AUI_SHA\" },"

  cd "$TEMP_DIR/motion-primitives"
  MP_SHA=$(git rev-parse HEAD)
  echo "  \"motion_primitives\": { \"repo\": \"ibelick/motion-primitives\", \"sha\": \"$MP_SHA\" },"

  cd "$TEMP_DIR/smoothui"
  SUI_SHA=$(git rev-parse HEAD)
  echo "  \"smoothui\": { \"repo\": \"educlopez/smoothui\", \"sha\": \"$SUI_SHA\" },"

  cd "$TEMP_DIR/react-bits"
  RB_SHA=$(git rev-parse HEAD)
  echo "  \"reactbits\": { \"repo\": \"DavidHDev/react-bits\", \"sha\": \"$RB_SHA\" }"

  echo "}"
} > "$SOURCE_DIR/version-manifest.json"

# --- Cleanup ---
echo "🧹 Cleaning up temp directory..."
rm -rf "$TEMP_DIR"

# --- Summary ---
echo ""
echo "🪨 Bedrock setup complete!"
echo ""
echo "Source files:"
ls -lh "$SOURCE_DIR/"
echo ""
echo "Total source size:"
du -sh "$SOURCE_DIR/"
echo ""
echo "Run 'bash $SCRIPT_DIR/update.sh' to refresh source code."
