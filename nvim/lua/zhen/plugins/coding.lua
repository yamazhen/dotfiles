return
{
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      require("nvim-autopairs").setup({})
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  -- Autotag
  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require('nvim-ts-autotag').setup({})
    end,
  },
  -- Todo Comments
  {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup({})
  end,
  },
  -- Indent Guides
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
    indent = { char = "┊" },
    },
  }
}
