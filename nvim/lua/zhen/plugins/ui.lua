return {
  -- colorscheme
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
        }
      })
      vim.cmd("colorscheme carbonfox")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
  -- icons
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({})
    end,
  },
  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    requires = {"nvim-tree/nvim-web-devicons"},
    config = function()
      require('lualine').setup({
        options = {
          theme = {
            normal = {
              a = { fg = '#ffffff', bg = 'NONE' },
              b = { fg = '#ffffff', bg = 'NONE' },
              c = { fg = '#ffffff', bg = 'NONE' },
            },
            insert = {
              a = { fg = '#ffffff', bg = 'NONE' },
              b = { fg = '#ffffff', bg = 'NONE' },
              c = { fg = '#ffffff', bg = 'NONE' },
            },
            visual = {
              a = { fg = '#ffffff', bg = 'NONE' },
              b = { fg = '#ffffff', bg = 'NONE' },
              c = { fg = '#ffffff', bg = 'NONE' },
            },
            replace = {
              a = { fg = '#ffffff', bg = 'NONE' },
              b = { fg = '#ffffff', bg = 'NONE' },
              c = { fg = '#ffffff', bg = 'NONE' },
            },
            command = {
              a = { fg = '#ffffff', bg = 'NONE' },
              b = { fg = '#ffffff', bg = 'NONE' },
              c = { fg = '#ffffff', bg = 'NONE' },
            },
            inactive = {
              a = { fg = '#ffffff', bg = 'NONE' },
              b = { fg = '#ffffff', bg = 'NONE' },
              c = { fg = '#ffffff', bg = 'NONE' },
            },
          },
          component_separators = '',
          section_separators = '',
        }
      })
    end,
  },
  -- tabline
  {
    "akinsho/bufferline.nvim",
    requires = {"nvim-tree/nvim-web-devicons"},
    version = "*",
    opts = {
      options = {
        mode = "buffers",
        separator_style = "none",
        indicator = {
                style = "none",
        },
        tab_size = 18,
      },
    },
  }
}
