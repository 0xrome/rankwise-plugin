# Rankwise plugin

Rankwise measures how often AI search engines cite your brand. This plugin brings that data into your coding agent. It connects the Rankwise MCP server and adds two skills.

## Install

In Claude Code, run:

```
/plugin marketplace add 0xrome/rankwise-plugin
/plugin install rankwise@rankwise
```

The first time a Rankwise tool runs, you sign in to Rankwise in your browser. You need a Rankwise account. If you do not have one, ask for a free AI visibility score and follow the link it gives you.

## What it does

The plugin connects the Rankwise MCP server at `https://tryrankwise.com/api/mcp`. It adds two skills.

- `audit-to-briefs` reads your scorecard, the questions where AI engines do not cite you, and your content opportunities. It proposes briefs for the biggest gaps. It writes draft briefs only when you agree. It approves a brief, which spends credits, only when you name it.
- `read-share-of-voice` reads your AI share of voice and its history, the competitor leaderboard, citations per engine, and the citations you won or lost in the last 30 days.

The plugin reads from one Rankwise workspace. It does not edit your website. It does not publish an article unless you ask.

## Example prompts

- "What is my AI share of voice, and how do I compare with competitors?"
- "Why don't AI engines cite my brand? Turn my audit into content briefs."
- "Which AI citations did we win or lose in the last 30 days?"

## Layout

- `.claude-plugin/marketplace.json` lists the plugin for Claude Code.
- `.agents/plugins/marketplace.json` lists the plugin for Codex.
- `plugins/rankwise/` holds the plugin: both manifests, `.mcp.json`, the skills and the icon.
- `scripts/build-codex-zip.sh` builds `dist/rankwise-codex-plugin.zip` for the OpenAI plugin directory.

## Privacy and support

- Privacy policy: https://tryrankwise.com/privacy
- Contact and support: https://tryrankwise.com/contact

## License

MIT. See `LICENSE`.
