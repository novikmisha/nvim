return {
    "folke/trouble.nvim",
    config = function()
        require("trouble").setup({
            keys = {
                ["<F2>"] = "next"
            }
        })
    end
}
