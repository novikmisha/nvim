return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("ibl").setup({
            scope = { show_start = false },
        })
    end
}
