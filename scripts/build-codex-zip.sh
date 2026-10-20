#!/usr/bin/env bash
# Builds dist/rankwise-codex-plugin.zip for the OpenAI plugin directory.
# The ZIP root is the plugin root: .codex-plugin/plugin.json, .mcp.json,
# skills/, assets/, README.md and LICENSE. The Claude manifest stays out.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PLUGIN="$ROOT/plugins/rankwise"
OUT="$ROOT/dist/rankwise-codex-plugin.zip"
STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT

mkdir -p "$STAGE/.codex-plugin" "$ROOT/dist"
cp "$PLUGIN/.codex-plugin/plugin.json" "$STAGE/.codex-plugin/plugin.json"
cp -R "$PLUGIN/skills" "$PLUGIN/assets" "$PLUGIN/README.md" "$STAGE/"
cp "$ROOT/LICENSE" "$STAGE/LICENSE"
# Codex's .mcp.json example takes a bare url, without the Claude "type" key.
cat > "$STAGE/.mcp.json" <<'JSON'
{
  "mcpServers": {
    "rankwise": {
      "url": "https://tryrankwise.com/api/mcp"
    }
  }
}
JSON

rm -f "$OUT"
(cd "$STAGE" && find . -name .DS_Store -delete && zip -qrX "$OUT" .)
echo "$OUT"
