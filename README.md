# Dotfiles

Configuration managed by [chezmoi](https://www.chezmoi.io/) for consistent dotfiles across machines.

## Usage

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
