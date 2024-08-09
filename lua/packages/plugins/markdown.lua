return {
    "OXY2DEV/markview.nvim",
    lazy = false,      -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        require("markview").setup({
            hybrid_modes = {"n"},
            horizontal_rules = {
                parts = {
                    {
                        type = "repeating",
                        text = "─",

                        direction = "left",
                        hl = {
                            "Gradient1", "Gradient2",
                            "Gradient3", "Gradient4",
                            "Gradient5", "Gradient6",
                            "Gradient7", "Gradient8",
                            "Gradient9", "Gradient10"
                        },

                        repeat_amount = function ()
                            return 59
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
                            return 59
                        end
                    },
                }
            }
        })
    end
}
