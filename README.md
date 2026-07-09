# nvim

Personal Neovim config. Requires **Neovim ≥ 0.11** (uses `vim.lsp.config`).

## Prerequisites

Install everything below **before** first launch. mason auto-installs language
_servers_ (rust-analyzer, gopls, ts_ls, …) but needs the host runtimes; the
formatters are **not** mason-managed.

Runtimes are managed with [mise](https://mise.jdx.dev); Rust via
[rustup](https://rustup.rs). After installing mise, add the runtimes:

```sh
mise use -g go@latest node@lts ruby@3.2.4   # Go, Node (TS/JS/JSON + prettier), Ruby
```

Activate mise in your shell (`mise activate`) so the runtimes are on `PATH`.

### macOS

```sh
xcode-select --install                          # cc + make (treesitter, LuaSnip)
brew install neovim git mise                     # editor, git, runtime manager
brew install stylua clang-format shfmt shellcheck # formatters + bashls diagnostics
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh  # Rust
```

### Fedora

```sh
sudo dnf install neovim git gcc make mise                # editor, git, build tools
sudo dnf install clang-tools-extra shfmt ShellCheck      # formatters + bashls diagnostics
cargo install stylua                                     # stylua (not packaged)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh  # Rust
```

## Install

```sh
git clone git@github.com:kgengler/nvim-config.git ~/.config/nvim
nvim   # lazy.nvim bootstraps; mason installs servers on first run
```

Run `:checkhealth` and `:Mason` to confirm tooling.

## Keys

Leader = `,`

| Key                         | Action                                     |
| --------------------------- | ------------------------------------------ |
| `ff` / `fg`                 | Find files / live grep (fff)               |
| `fz` / `fc`                 | Fuzzy grep / grep word under cursor        |
| `<leader>f`                 | Format selection — visual mode (lines)     |
| `<leader>F`                 | Format entire buffer (normal mode)         |
| `<leader>y` / `<leader>Y`   | Yank to system clipboard                   |
| `gd` / `gD`                 | LSP go to definition / declaration         |
| `<leader>rn` / `<leader>ca` | LSP rename / code action                   |
| `<leader>xx` / `<leader>xX` | Diagnostics / buffer diagnostics (Trouble) |
| `<leader>cs` / `<leader>cl` | Symbols / LSP refs (Trouble)               |
| `af` / `if`                 | Select around/inner function (treesitter)  |

`:Git` for fugitive.
