function ColorVim(color)
	require("gruvbox").setup({
		italic = false
	})
	vim.cmd([[colorscheme gruvbox]])
end
ColorVim()


