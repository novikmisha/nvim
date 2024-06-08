return {
    "shortcuts/no-neck-pain.nvim",
    config = function()
        require("no-neck-pain").setup({
            width = 125,
            autocmds = {
                enableOnVimEnter = true,
                skipEnteringNoNeckPainBuffer = true
            },
            buffers = {
                setNames = true,
                right = {
                    enabled = false,
                }
            }
        })
    end
}
