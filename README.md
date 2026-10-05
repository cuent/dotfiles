# Dotfiles

[![Bootstrapping CI](https://github.com/cuent/dotfiles/actions/workflows/simulate_chezmoi.yml/badge.svg)](https://github.com/cuent/dotfiles/actions/workflows/simulate_chezmoi.yml)


Configuration managed by [chezmoi](https://www.chezmoi.io/) for consistent dotfiles across machines.

## 🚀 Usage

1. Install chezmoi:
   ```sh
   sh -c "$(curl -fsLS get.chezmoi.io)"
   ```
2. Initialize:
   ```sh
   chezmoi init --apply <repo-url>
   ```
3. Apply changes:
   ```sh
   chezmoi apply
   ```

## Troubleshooting

- Use `chezmoi doctor` to debug issues.
- Ensure dependencies like `curl`, `fzf`, and `ag` are installed.

## GPU server shell configuration

Bash and Zsh source `~/.config/shell/codex.sh`, which selects the Codex
installation at shell startup (including when the home directory is shared):

| Hosts | Installation root |
| --- | --- |
| corgi, bluejay | `/data2/xxs22` |
| doc2, doc3 (gpucluster2, gpucluster3) | `/data/xxs22` |

The root's `bin` directory is added to `PATH` and `CODEX_HOME` is set to
`<root>/.codex`. Other hostnames retain their existing environment. Codex
binaries, credentials, sessions, and caches are not tracked here.

Bluejay's Conda configuration keeps environments and the primary package
cache under `/data2/xxs22/conda`, with the existing package caches as fallbacks.
