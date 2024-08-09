vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"i", "s" }, "<C-p>", "<Nop>")
vim.keymap.set({"i", "s" }, "<C-n>", "<Nop>")

vim.keymap.set('n', '<F2>', require('custom.goto_error_then_hint').goto_error_then_hint, { desc = 'Go to next [D]iagnostic message' })
