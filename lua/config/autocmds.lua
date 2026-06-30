-- Per-filetype indent width. Add filetypes here to extend.
-- A project's .editorconfig overrides these (Neovim applies it after FileType).
local indent_by_ft = {
	ruby = 2,
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = vim.tbl_keys(indent_by_ft),
	callback = function(args)
		local width = indent_by_ft[args.match]
		vim.bo[args.buf].shiftwidth = width
		vim.bo[args.buf].softtabstop = width
		vim.bo[args.buf].tabstop = width
	end,
})
