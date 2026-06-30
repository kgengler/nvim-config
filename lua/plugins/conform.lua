return {
	"stevearc/conform.nvim",
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				local s, e = vim.fn.line("v"), vim.fn.line(".")
				if s > e then
					s, e = e, s
				end
				local last = vim.api.nvim_buf_get_lines(0, e - 1, e, true)[1]
				require("conform").format({
					bufnr = 0,
					lsp_format = "fallback",
					range = { ["start"] = { s, 0 }, ["end"] = { e, #last } },
				})
			end,
			mode = "x", -- Visual mode (char/line/block) only
			desc = "Format selection (lines)",
		},
		{
			"<leader>F",
			function()
				require("conform").format({ bufnr = 0, lsp_format = "fallback" })
			end,
			mode = "n",
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			lua = { "stylua" },
			go = { "gofmt" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			markdown = { "prettier" },
		},
		formatters = {
			["clang-format"] = {
				prepend_args = { "-style=file", "-fallback-style=LLVM" },
			},
			-- Wrap markdown prose at 80 chars; prettier leaves tables intact.
			prettier = {
				prepend_args = { "--prose-wrap", "always" },
			},
		},
	},
}
