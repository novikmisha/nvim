return {
    'Wansmer/langmapper.nvim',
    lazy = false,
    priority = 1, -- High priority is needed if you will use `autoremap()`
    config = function()
        local lm = require("langmapper")
        lm.setup()
        lm.hack_get_keymap()
    end,
}
