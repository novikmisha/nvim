return {
    "epwalsh/obsidian.nvim",
    --    version = "master",
    lazy = true,
    event = {
        "BufReadPre /Users/mikhailnovik/vaults/*.md",
        "BufNewFile /Users/mikhailnovik/vaults/*.md",
    },
    keys = {
        { '<C-f>', '<cmd>ObsidianSearch<cr>' },
        { '<leader>on', '<cmd>ObsidianNew<cr>' },
        { '<leader>ot', '<cmd>ObsidianNewFromTemplate<cr>' },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("obsidian").setup(
            {
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
                    },
                },
                ui = {
                    enable = false,
                },
                daily_notes = {
                    folder = "notes/dailies",
                },
                follow_url_func = function(url)
                    vim.ui.open(url)
                end,
                templates = {
                    folder = "templates",
                },
                note_id_func = function(title)
                    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
                    -- In this case a note with the title 'My new note' will be given an ID that looks
                    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
                    local suffix = ""
                    if title ~= nil then
                        -- If title is given, transform it into valid file name.
                        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                    else
                        -- If title is nil, just add 4 random uppercase letters to the suffix.
                        for _ = 1, 4 do
                            suffix = suffix .. string.char(math.random(65, 90))
                        end
                    end
                    return tostring(os.time()) .. "-" .. suffix
                end,
            }
        )
    end
}
