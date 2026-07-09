# nvim

Personal Neovim config.

## Prerequisites

Install **before** first launch. mason auto-installs the language _servers_, but
needs the host runtimes below; the formatters are **not** mason-managed.

### macOS

```sh
# Build tools — cc + make for treesitter parsers & LuaSnip (via Xcode CLT)
xcode-select --install

# Editor + git
brew install neovim git

# Formatters (not mason-managed) + shellcheck for bashls diagnostics
brew install stylua clang-format shfmt shellcheck

# Language runtimes — Node (TS/JS/JSON + prettier), Go, Rust, Ruby
brew install node go rust ruby
```

### Fedora

```sh
# Editor, git, build tools, and language runtimes
sudo dnf install neovim git gcc make nodejs npm golang rust cargo ruby

# Formatters + shellcheck for bashls diagnostics (stylua not packaged → cargo)
sudo dnf install clang-tools-extra shfmt ShellCheck
cargo install stylua
```

Requires **Neovim ≥ 0.11** (uses `vim.lsp.config`). Language servers
(rust-analyzer, gopls, ts_ls, etc.) install automatically via mason on first
launch.

## Install

```sh
git clone git@github.com:kgengler/nvim-config.git ~/.config/nvim
nvim   # lazy.nvim bootstraps; mason installs servers on first run
```

Then `:checkhealth` and `:Mason` to confirm tooling.

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
