require("config.lazy")
vim.opt.tabstop = 4       -- Number of spaces a tab represents
vim.opt.shiftwidth = 4    -- Number of spaces for each indent
vim.opt.expandtab = true  -- Convert tabs to spaces
vim.opt.number = true

-- Set shiftwidth
vim.keymap.set('n', '<leader>sw', ':set shiftwidth=4<CR>')

-- Open terminal on right side: `Space + T + L`
vim.keymap.set('n', '<leader>tl', ':leftabove vsplit | terminal<CR>')
-- Open terminal on right side: `Space + T + R`
vim.keymap.set('n', '<leader>tr', ':rightbelow vsplit | terminal<CR>')
vim.keymap.set('n', '<leader>tb', ':rightbelow split | terminal<CR>')
-- Save
vim.keymap.set('n', '<leader>w', ':w<CR>')

-- Basic git add/commit commands
vim.keymap.set('n', '<leader>ga', ':!git add %<CR>')
vim.keymap.set('n', '<leader>gc', ':!git commit -m ')

-- Basic cargo commands
vim.keymap.set('n', '<leader>cr', ':!cargo run<CR>')
vim.keymap.set('n', '<leader>ca', ':!cargo add ')
vim.keymap.set('n', '<leader>cf', ':!rustfmt %<CR>')
vim.keymap.set('n', '<leader>cc', ':!cargo clippy<CR>')


-- Hover
require('hover').config({
  --- List of modules names to load as providers.
  --- @type (string|Hover.Config.Provider)[]
  providers = {
    'hover.providers.diagnostic',
    'hover.providers.lsp',
    'hover.providers.dap',
    'hover.providers.man',
    'hover.providers.dictionary',
    -- Optional, disabled by default:
    -- 'hover.providers.gh',
    -- 'hover.providers.gh_user',
    -- 'hover.providers.jira',
    -- 'hover.providers.fold_preview',
    -- 'hover.providers.highlight',
  },
  preview_opts = {
    border = 'single'
  },
  -- Whether the contents of a currently open hover window should be moved
  -- to a :h preview-window when pressing the hover keymap.
  preview_window = false,
  title = true,
  mouse_providers = {
    'hover.providers.lsp',
  },
  mouse_delay = 1000
})

-- Setup keymaps
vim.keymap.set('n', 'K', function()
  require('hover').open()
end, { desc = 'hover.nvim (open)' })

vim.keymap.set('n', 'gK', function()
  require('hover').enter()
end, { desc = 'hover.nvim (enter)' })

vim.keymap.set('n', '<C-p>', function()
    require('hover').switch('previous')
end, { desc = 'hover.nvim (previous source)' })

vim.keymap.set('n', '<C-n>', function()
    require('hover').switch('next')
end, { desc = 'hover.nvim (next source)' })

-- Mouse support
vim.keymap.set('n', '<MouseMove>', function()
  require('hover').mouse()
end, { desc = 'hover.nvim (mouse)' })

vim.o.mousemoveevent = true

