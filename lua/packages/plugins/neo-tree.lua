return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    keys = {
        { '<leader>1', '<cmd>Neotree filesystem toggle left<CR>' },
    },
    config = function()
        require("neo-tree").setup({
            use_popups_for_input = false,
            auto_restore_session_experimental = true,
            close_if_last_window = true,
            use_libuv_file_watcher = true,
            filesystem = {
                follow_current_file = {
                    enabled = true, -- This will find and focus the file in the active buffer every time
                },

            },
            buffer = {
                follow_current_file = {
                    enabled = true, -- This will find and focus the file in the active buffer every time
                },
            },
            window = {
                width = 40
            }
        })
    end,
}
