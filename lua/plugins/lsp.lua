return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup()
        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({})
            end,
            ["lua_ls"] = function ()
                local lspconfig = require("lspconfig")
                lspconfig.lua_ls.setup {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" }
                            }
                        }
                    }
                }
            end,
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }
                vim.keymap.set({"n", "v", "i"}, "<F1>", vim.lsp.buf.hover, opts)
                vim.keymap.set({"n", "v"}, 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set({"n", "v", "i"}, '<A-Enter>', vim.lsp.buf.code_action, opts)
                vim.keymap.set({"n", "v", "i"}, "<C-p>", function() vim.lsp.buf.signature_help() end, opts)
            end,
        })
    end
}
