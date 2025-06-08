return {
    "OXY2DEV/markview.nvim",
    lazy = false,      -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
--     markview.nvim:  horizontal_rules  is deprecated. Use  markdown → horizontal_rules  instead.
-- markview.nvim:  hybrid_modes  is deprecated. Use  preview → hybrid_modes  instead.
-- markview.nvim:  code_blocks → hl  is deprecated. Use  code_blocks → border_hl  instead.
    config = function()
        require("markview").setup({
            preview = {
                hybrid_modes = {"n"},
            },
            links = {
                enable = true,
                hyperlinks = {
                    custom = {
                    }
                }

            },
            code_blocks = {
                style = "language",

                pad_amount = 4,
                pad_char = " ",

                border_hl = "CursorLine",
            },
            markdown = {
                horizontal_rules = {
                    parts = {
                        {
                            type = "repeating",
                            text = "─",

                            direction = "left",
                            hl = { "Gradient1", "Gradient2", "Gradient3", "Gradient4", "Gradient5", "Gradient6", "Gradient7", "Gradient8", "Gradient9", "Gradient10" },

                            repeat_amount = function ()
                                local w = vim.api.nvim_win_get_width(0);
                                local l = vim.api.nvim_buf_line_count(0);

                                l = vim.fn.strchars(tostring(l)) + 4;

                                return math.min(59, math.ceil((w - (l + 3)) / 2));
                            end
                        },
                        {
                            type = "text",
                            text = "  "
                        },
                        {
                            type = "repeating",
                            text = "─",

                            direction = "right",
                            hl = {
                                "Gradient1", "Gradient2",
                                "Gradient3", "Gradient4",
                                "Gradient5", "Gradient6",
                                "Gradient7", "Gradient8",
                                "Gradient9", "Gradient10"
                            },

                            repeat_amount = function ()
                                local w = vim.api.nvim_win_get_width(0);
                                local l = vim.api.nvim_buf_line_count(0);

                                l = vim.fn.strchars(tostring(l)) + 4;

                                return math.min(59, math.ceil((w - (l + 3)) / 2));
                            end
                        },
                    }
                }
            }
        })
    end
}
