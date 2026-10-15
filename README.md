# dorkitude Homebrew Tap

```bash
brew tap dorkitude/tap
brew install deadlore
```

EnronQA dataset access and evaluation:

```bash
brew install dorkitude/tap/enronqa-cli
enronqa fetch
```

See [EnronQA-cli](https://github.com/dorkitude/EnronQA-cli) for batch and granular workflows.

Cloudflare from your terminal (Workers, R2, DNS, every API operation):

```bash
brew install dorkitude/tap/cfctl
cfctl docs
```

See [cfctl](https://github.com/dorkitude/cfctl).

Tailscale admin from your terminal (devices, tags, policy file, auth keys, any API endpoint):

```bash
brew install dorkitude/tap/tsctl
tsctl auth status
```

See [tsctl](https://github.com/dorkitude/tsctl).

Skim pages, files, and lists with Jev, keeping only what helps with your goal (saves agent tokens):

```bash
brew install dorkitude/tap/skimmer
skimmer auth
```

See [skimmer](https://github.com/dorkitude/skimmer).

DreamHost from your terminal (DNS records, announcement lists, the whole API):

```bash
brew install dorkitude/tap/dhctl
dhctl auth
```

See [dhctl](https://github.com/dorkitude/dhctl).

Let agents control your Mac (click, type, read UI, screenshots) through a CLI and MCP server, enabled for a limited time from a menu bar app:

```bash
brew install --cask dorkitude/tap/macinto-sh
open /Applications/Macinto.sh.app
```

See [macinto-sh](https://github.com/dorkitude/macinto-sh).
