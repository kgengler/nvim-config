# nvim

Personal Neovim config.

## Prerequisites

Install **before** first launch. mason auto-installs the language _servers_, but
needs the host runtimes below; two formatters are **not** mason-managed.

**Core (required):**

- **Neovim ≥ 0.11** (uses `vim.lsp.config`)
- **git**
- **C compiler + make** (`cc`/`clang`/`gcc`) — builds treesitter parsers & LuaSnip regex

**Formatters (required for formatting; not installed by mason):**

- **stylua** — Lua (`cargo install stylua` / `brew install stylua`)
- **clang-format** — C/C++ (`brew install clang-format`)

**Per-language runtimes (only for the languages you use):**

- **Node.js + npm** — TS/JS/JSON servers & prettier
- **Go** — gopls (gofmt included)
- **Rust** (rustup: cargo, rustfmt) — rust-analyzer; also fff.nvim build fallback
- **Ruby** — ruby-lsp

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
