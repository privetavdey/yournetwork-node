#!/bin/sh

set -e

REPO="https://raw.githubusercontent.com/privetavdey/yournetwork-node/main"
SKILLS_DIR="$HOME/.openclaw/workspace/skills/yournetwork-node"

echo ""
echo "  YourNetwork Node Installer"
echo "  ─────────────────────────"
echo ""

# Check OpenClaw is installed
if ! command -v openclaw >/dev/null 2>&1; then
  echo "  ✗ OpenClaw not found."
  echo "    Install it first: https://github.com/openclaw/openclaw"
  echo ""
  exit 1
fi

echo "  ✓ OpenClaw found"

# Create skill directory
mkdir -p "$SKILLS_DIR"

# Download skill file
echo "  → Downloading skill..."
curl -fsSL "$REPO/skill.md" -o "$SKILLS_DIR/SKILL.md"
echo "  ✓ Skill installed"

# Reload OpenClaw
echo "  → Activating..."
if openclaw skills reload 2>/dev/null; then
  echo "  ✓ Agent reloaded"
else
  echo "  ✓ Skill installed (restart OpenClaw to activate)"
fi

echo ""
echo "  ────────────────────────────────────────"
echo "  Done. Open your agent and send any message"
echo "  to begin node activation."
echo "  ────────────────────────────────────────"
echo ""
