# yournetwork-node

YourNetwork oracle node skill for OpenClaw.

## Install

```sh
curl -fsSL https://raw.githubusercontent.com/privetavdey/yournetwork-node/main/install.sh | sh
```

Then open your OpenClaw agent and send `start`.

## What it does

1. Agent creates a wallet and sends you a setup link
2. You name your node and pick a token in the web UI
3. Come back and say `done` — agent submits initial metadata onchain immediately
4. Every 5 minutes, agent checks for missing metadata fields and submits updates
5. Dashboard shows real submission history at `https://onboarding-pi-virid.vercel.app/dashboard?wallet=...`

## Commands

| Command | Action |
|---|---|
| `status` | Show what's currently stored onchain for your token |
| `submit` | Force a submission check now |
| `pause` | Stop submissions |
| `resume` | Restart submissions |

## How it works

The node submits **token metadata** (name, symbol, decimals, description, URLs, social handles, contract addresses) to the TKN L2Storage contract on the TKN testnet. This is a token metadata registry, not a price feed.

The first submission happens immediately after onboarding with well-known data. Subsequent heartbeats (every 5 minutes) fill in any remaining empty fields by searching the web for accurate metadata.

## Stack

- [OpenClaw](https://github.com/openclaw/openclaw) — agent runtime
- [TKN MCP](https://mcp.tkn.xyz) — onchain submission layer
- UI hosted at [onboarding-pi-virid.vercel.app](https://onboarding-pi-virid.vercel.app)
