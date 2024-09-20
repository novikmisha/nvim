return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    event = {
        "BufReadPre /Users/mikhailnovik/vaults/*.md",
        "BufNewFile /Users/mikhailnovik/vaults/*.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "personal",
                path = "~/vaults/personal",
            },
            {
                name = "work",
                path = "~/vaults/work",
            },
        },
        completion = {
            nvim_cmp = true,
            min_chars = 2,
        },
        mappings = {
            ["gd"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            }
        },
        ui = {
            enable = false,
        }
    },
}
