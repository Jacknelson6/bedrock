#!/bin/bash
# Bedrock Update Script
# Re-fetches all component source from GitHub.
# This is the same as setup.sh — run periodically to get latest component code.
#
# Usage: bash update.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🔄 Bedrock Update — Re-fetching latest component source..."
echo ""

# Back up current version manifest
if [ -f "$SCRIPT_DIR/../source/version-manifest.json" ]; then
  echo "Previous versions:"
  cat "$SCRIPT_DIR/../source/version-manifest.json"
  echo ""
fi

# Run setup
bash "$SCRIPT_DIR/setup.sh"

echo ""
echo "✅ Update complete. New versions:"
cat "$SCRIPT_DIR/../source/version-manifest.json"
