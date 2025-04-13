vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", {desc="Open dir in Oil"})
vim.keymap.set("n", "gl",function() vim.diagnostic.open_float() end, {desc = "Show diagnostic"})
