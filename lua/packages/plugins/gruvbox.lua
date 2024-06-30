return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            italic = {
                strings = false,
                emphasis = false,
                comments = false,
                operators = false,
                folds = false,
            },
            overrides = {
                -- https://github.com/ellisonleao/gruvbox.nvim/issues/230#issuecomment-1493883602
                SignColumn = { link = "Normal" },
            }
        })
        vim.cmd.colorscheme "gruvbox"

        vim.cmd([[ hi! NoiceCmdlinePopup guibg=#282828 ]])
        vim.cmd([[ hi! NoiceCmdlinePopupBorder guifg=#fabd2f guibg=NONE]])

        vim.cmd([[ hi! NoiceCmdlineIconCmdline guifg=#fabd2f guibg=NONE ]])
        vim.cmd([[ hi! NoiceCmdlineIconHelp guifg=#fabd2f guibg=NONE ]])
        vim.cmd([[ hi! NoiceCmdlineIconInput guifg=#fabd2f guibg=NONE ]])
        vim.cmd([[ hi! NoiceCmdlineIconLua guifg=#fabd2f guibg=NONE ]])
        vim.cmd([[ hi! NoiceCmdlineIconSearch guifg=#fabd2f guibg=NONE ]])

    end
}
