require("config.lazy")
vim.opt.tabstop = 4       -- Number of spaces a tab represents
vim.opt.shiftwidth = 4    -- Number of spaces for each indent
vim.opt.expandtab = true  -- Convert tabs to spaces
vim.opt.number = true

-- Open terminal on right side: `Space + T + L`
vim.keymap.set('n', '<leader>tl', ':leftabove vsplit | terminal<CR>')
-- Open terminal on right side: `Space + T + R`
vim.keymap.set('n', '<leader>tr', ':rightbelow vsplit | terminal<CR>')
-- Save
vim.keymap.set('n', '<leader>w', ':w<CR>')
