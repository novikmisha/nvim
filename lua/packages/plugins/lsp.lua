return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        vim.diagnostic.config({
            update_in_insert = true,
        })

        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {
                            'vim',
                            'require',
                        },
                    },
                },
            },
        })
        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_enable = true,
        })
        --[[
        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            ["lua_ls"] = function ()
                local lspconfig = require("lspconfig")
                lspconfig.lua_ls.setup {
                    settings = {
                        Lua = {
                            hint = {
                                enable = true
                            },
                            diagnostics = {
                                globals = { "vim" }
                            }
                        }
                    }
                }
            end,
        })
        --]]

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }
                vim.keymap.set({"n", "v", "i"}, "<F1>", vim.lsp.buf.hover, opts)
                vim.keymap.set({"n", "v"}, 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set({"n", "v", "i"}, '<A-Enter>', vim.lsp.buf.code_action, opts)
                vim.keymap.set({"n", "v", "i"}, "<C-p>", function() vim.lsp.buf.signature_help() end, opts)

                local id = vim.tbl_get(ev, 'data', 'client_id')
                local client = id and vim.lsp.get_client_by_id(id)

                if client == nil then
                    return
                end

                if client.supports_method('textDocument/inlayHint') then
                    vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
                    return
                end

                if client.supports_method('document_highlight') then
                    vim.api.nvim_exec(
                        [[
                          augroup lsp_document_highlight
                            autocmd! * <buffer>
                            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                          augroup END
                        ]],
                        false
                    )
                end

            end,
        })
    end


}
