# AGENTS.md

Guidance for AI coding agents working in this Neovim config. See `README.md` for
human setup & prerequisites.

## Layout & conventions

- `lua/config/` — `set.lua` (options), `remap.lua` (core keymaps, leader = `,`),
  `lazy.lua` (bootstrap + `require("lazy").setup`).
- `lua/plugins/` — **one lazy.nvim spec per file**, each `return {...}`. Add a
  plugin = add a new file here; lazy auto-imports the dir. No central plugin list.
- **Indentation: hard tabs** in all Lua files. Run `stylua` after edits.
- Lua = ground truth; there is no test suite. "Verify" means load the config
  headless and assert runtime state (below).

## lazy.nvim idioms (match these)

- Prefer `opts = {...}` over `config = function() require(x).setup(opts) end`
  unless setup needs imperative logic (lsp/cmp do; most don't).
- Lazy-load: `event` (e.g. `BufReadPre`/`InsertEnter`/`BufWritePre`), `cmd`, or
  `keys`. Only `colorscheme` and `treesitter` use `lazy = false`. Don't add
  startup-eager plugins without a reason.
- Colorscheme spec uses `priority = 1000` + `lazy = false`.

## LSP (mason-lspconfig v2 — important)

- The `handlers` field is **gone**. Servers auto-enable via `automatic_enable` →
  `vim.lsp.enable()`. Configure with `vim.lsp.config("*", {...})` and
  `vim.lsp.config("<server>", {...})` in `lua/plugins/lsp.lua`.
- **Add a language** = three edits: server → `ensure_installed` (`lsp.lua`);
  parser → `parsers` list (`treesitter.lua`); formatter → `formatters_by_ft`
  (`conform.lua`). You can skip the formatter if the LSP formats it — the
  `<leader>f`/`<leader>F` mappings pass `lsp_format = "fallback"`, so a server
  with no CLI formatter (e.g. Rust/Ruby) still formats via the LSP.
- **Formatting is manual** (no format-on-save): `<leader>f` formats the visual
  selection's lines, `<leader>F` the whole buffer.
- Verify server names against installed `nvim-lspconfig` (e.g. `ts_ls`, not
  `tsserver`). mason installs servers + prettier; **stylua/clang-format are not
  mason-managed** and must be on PATH.

## Verify (headless, no UI)

```sh
nvim --headless "+Lazy! sync" +qa                      # plugins resolve, exit 0
nvim --headless -c 'checkhealth lazy' -c 'wq! /tmp/h'  # then grep ERROR in /tmp/h
```

Runtime assertions (open a sample file, then check):

```sh
nvim --headless -c 'edit f.go' \
  -c 'lua vim.wait(8000, function() return #vim.lsp.get_clients({bufnr=0})>0 end)' \
  -c 'lua print(vim.lsp.get_clients({bufnr=0})[1].name)' +qa
nvim --headless -c 'lua print(vim.inspect(require("conform").list_formatters(0)))' +qa
```

Lazy-load proof: `require("lazy.core.config").plugins["<name>"]._.loaded` is `nil`
at startup, set after the trigger fires.

## Rules

- Conventional Commits. Branch off `main`; commit/push only when asked.
- Never commit secrets. No new third-party plugins/deps unless requested.
- Edits to ≥3 files: plan first.
