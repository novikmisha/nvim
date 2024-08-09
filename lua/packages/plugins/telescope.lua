return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            extensions = {
                fzf = {
                    fuzzy = true,                    -- false will only do exact matching
                    override_generic_sorter = true,  -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                }
            },
            pickers = {
                oldfiles = {
                    cwd_only = true,
                }
            },
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next,   -- move to next result
                    },
                    n = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next,   -- move to next result
                    },
                },
            }
        })
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<C-o>", builtin.find_files, {})
        vim.keymap.set("n", "<C-e>", builtin.oldfiles, {})
        vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
        require('telescope').load_extension('fzf')
    end,
}
