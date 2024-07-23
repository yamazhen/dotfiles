return {
  -- treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        highlight = { enable = true, },
        indent = { enable = true, },
        ensure_installed = {
          'html',
          'javascript',
          'typescript',
          'tsx',
          'c',
          'css',
        },
        modules = {},
        sync_install = false,
        ignore_install = {},
        auto_install = true,
      })
    end,
  },
  --autotag
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup({})
    end,
  },
  -- autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/nvim-cmp',
    },
    config = function()
      local autopairs = require('nvim-autopairs')
      autopairs.setup({
        check_ts = true,
        ts_config = {
          lua = { 'string' },
          javascript = { 'template_string' },
          java = false,
        },
      })
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')

      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  -- autotag
  {
    'windwp/nvim-ts-autotag',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-ts-autotag').setup({})
    end,
  },
  -- indent-blankline
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    main = 'ibl',
    opts = {
      indent = { char = '▏' },
    }
  },
  -- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      local nvimtree = require('nvim-tree')
      local keymap = vim.keymap

      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      vim.opt.termguicolors = true

      nvimtree.setup({
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        sort = {
          sorter = 'case_sensitive',
        },
        view = {
          width = 30,
          number = false,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })
      -- keymap section
      keymap.set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
    end,
  },
  -- telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-tree/nvim-web-devicons',
      'folke/todo-comments.nvim',
    },
    config = function()
      local builtin = require('telescope.builtin')
      local telescope = require('telescope')
      local keymap = vim.keymap

      telescope.setup({
        defaults = {
          path_display = { 'smart' }
        }
      })
      telescope.load_extension('fzf')
      -- keymap section
      keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
      keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Find file by text' })
    end,
  },
  -- todo comments
  {
    'folke/todo-comments.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('todo-comments').setup({})
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup({
        size = function(term)
          if term.direction == 'horizontal' then
            return vim.o.lines * 0.4
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4
          elseif term.direction == 'float' then
            return math.min(vim.o.columns * 0.8, vim.o.lines * 0.8)
          end
        end,
        direction = 'float',
        float_opts = {
          border = 'curved',
        },
      })
      local keymap = vim.keymap
      keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<CR>', { desc = 'Toggle Terminal' })
    end,
  },
  -- which-key
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup({
        window = {
          border = 'single',
        },
      })
    end,
  },
}
