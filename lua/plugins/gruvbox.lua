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
    end
}
