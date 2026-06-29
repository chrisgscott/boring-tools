#!/bin/zsh
set -euo pipefail

# Sync tool source directories into the portfolio's tools/ folder.
# Run this before deploying to ensure the portfolio has the latest versions.

PORTFOLIO_DIR="$(cd "$(dirname "$0")" && pwd)"
TOOLS_DIR="$PORTFOLIO_DIR/tools"
BUILDS_DIR="/Users/chrisgscott/projects/overnight-builds"

# Each line: tool-name
TOOLS=(subtrack-lite meditrack-simple habitflow nagreminder splitsimple coparent-simple pureplant-scheduler dealscope)

synced=0
skipped=0

for tool in "${TOOLS[@]}"; do
  src="$BUILDS_DIR/$tool"
  dst="$TOOLS_DIR/$tool"

  if [ ! -d "$src" ]; then
    echo "SKIP: $tool (source not found: $src)"
    ((skipped++))
    continue
  fi

  # Only sync if source is newer than destination
  src_mtime=$(stat -f %m "$src/index.html" 2>/dev/null || echo 0)
  dst_mtime=$(stat -f %m "$dst/index.html" 2>/dev/null || echo 0)

  if [ "$src_mtime" -gt "$dst_mtime" ]; then
    echo "SYNC: $tool"
    rm -rf "$dst"
    cp -r "$src" "$dst"
    rm -f "$dst/README.md"
    ((synced++))
  else
    echo "OK:   $tool (up to date)"
  fi
done

echo ""
echo "Done. Synced: $synced, Skipped: $skipped, Total: ${#TOOLS[@]}"
