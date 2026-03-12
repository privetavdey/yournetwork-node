# yournetwork-node

YourNetwork oracle node skill for OpenClaw.

## Install

```sh
curl -fsSL https://raw.githubusercontent.com/privetavdey/yournetwork-node/main/install.sh | sh
```

Then open your OpenClaw agent and send `start`.

## What it does

1. Agent creates a wallet and sends you a setup link
2. You name your node and pick a coin in the web UI
3. Agent detects completion automatically (polls the API)
4. Crawls and submits price data every 30s via TKN MCP
5. Sends you a one-line update whenever a submission happens

## Commands

| Command | Action |
|---|---|
| `status` | Show node name, coin, last price, total submissions |
| `pause` | Stop crawling |
| `resume` | Restart crawling |
| `quiet` | Stop update messages (keeps crawling) |
| `updates on` | Resume update messages |

## Stack

- [OpenClaw](https://github.com/openclaw/openclaw) — agent runtime
- [TKN MCP](https://mcp.tkn.xyz) — onchain submission layer
- UI hosted at [yournetwork-node.vercel.app](https://yournetwork-node.vercel.app)
