#!/usr/bin/env sh
set -eu

# Safer installer for YourNetwork Node OpenClaw skill.
# - No pipe-to-sh required by default
# - Supports pinning a version/tag
# - Verifies download succeeded

REPO_BASE_DEFAULT="https://raw.githubusercontent.com/privetavdey/yournetwork-node"
REF_DEFAULT="main"  # change to a tag like v0.2.0 for stable installs

REPO_BASE="${REPO_BASE:-$REPO_BASE_DEFAULT}"
REF="${REF:-$REF_DEFAULT}"
SKILLS_DIR="${SKILLS_DIR:-$HOME/.openclaw/workspace/skills}"
SKILL_SLUG="yournetwork-node"
DEST_DIR="$SKILLS_DIR/$SKILL_SLUG"

say() { printf "%s\n" "$*"; }

say ""
say "  YourNetwork Node Installer"
say "  ─────────────────────────"
say "  repo: $REPO_BASE"
say "  ref : $REF"
say "  dest: $DEST_DIR"
say ""

if ! command -v openclaw >/dev/null 2>&1; then
  say "  ✗ OpenClaw not found. Install it first: https://github.com/openclaw/openclaw"
  exit 1
fi
say "  ✓ OpenClaw found"

mkdir -p "$DEST_DIR"

TMP="$DEST_DIR/.SKILL.md.tmp"
URL="$REPO_BASE/$REF/skill.md"

say "  → Downloading: $URL"
# curl flags:
# -f fail on 4xx/5xx, -s silent, -S show errors, -L follow redirects
curl -fSsL "$URL" -o "$TMP"

# Basic sanity check: must contain frontmatter 'name:'
if ! grep -q "^name:" "$TMP"; then
  say "  ✗ Downloaded file doesn't look like a SKILL.md (missing 'name:' frontmatter)."
  say "    Refusing to install."
  rm -f "$TMP"
  exit 1
fi

mv "$TMP" "$DEST_DIR/SKILL.md"

say "  ✓ Skill installed: $DEST_DIR/SKILL.md"

say ""
say "  Next: restart OpenClaw Gateway if needed, then DM your bot:"
say "    start"
say ""
