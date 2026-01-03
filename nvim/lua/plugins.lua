return {
    -- Lang Server For Config
    "folke/neodev.nvim",
    -- Show NVIm Hotkey Completion
    "folke/which-key.nvim",
    -- JSON Config Manager
    { "folke/neoconf.nvim", cmd = "Neoconf" },
	
    -- Theme
    {
	  'maxmx03/solarized.nvim',
	  lazy = false,
	  priority = 1000,
	  ---@type solarized.config
	  opts = {},
	  config = function(_, opts)
	    vim.o.termguicolors = true
	    vim.o.background = 'light'
	    require('solarized').setup(opts)
	    vim.cmd.colorscheme 'solarized'
	  end,
	},
    
    -- File Tabs
    {
        'romgrk/barbar.nvim',
        dependencies = {
          'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
          'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {},
        version = '^1.0.0', 
    },

    -- Completion
    {
      'neovim/nvim-lspconfig',
      config = function()
        -- Python
        vim.lsp.config.pyright = {}
        vim.lsp.enable('pyright')
        
        -- Rust
        vim.lsp.config.rust_analyzer = {}
        vim.lsp.enable('rust_analyzer')
      end
    },
    {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',    -- LSP completions
        'hrsh7th/cmp-buffer',      -- Buffer words
        'hrsh7th/cmp-path',        -- File paths
    },
    config = function()
      local cmp = require('cmp')
    cmp.setup({

        mapping = cmp.mapping.preset.insert({
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
            ['<C-e>'] = cmp.mapping.abort(),
        }),
        sources = {
            { name = 'nvim_lsp' },
            { name = 'buffer' },
            { name = 'path' },
        },
    })
    end
    }
}
