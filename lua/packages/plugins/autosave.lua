return {
    "okuuva/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    config = function()
        require("auto-save").setup({
            execution_message = {
                enabled = false,
            },
        })
    end
}
