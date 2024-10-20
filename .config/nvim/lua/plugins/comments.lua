  return {
    {
    "folke/ts-comments.nvim",
    opts = {
      lang = {
        hyprlang = "# %s",
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    enabled = true,
    lazy = false,
    vscode = true,
    init = function()
      local ft = require("Comment.ft")
      ft.set("hyprlang", "# %s")
    end,
    opts = {
      -- local ft = require("Comment.ft"),
      -- ft.set("hyprlang", "#%s"),
      padding = true,
      sticky = true,
      ignore = nil,
      toggler = {
        -- line = "gcc",
        block = "gbc",
      },
      opleader = {
        -- line = "gc",
        block = "gb",
      },
      extra = {
        above = "gcO",
        below = "gco",
        eol = "gcA",
      },
      mappings = {
        basic = false,
        extra = true,
      },
      pre_hook = function()
        require("ts-comments.comments")
      end,
    },
    },
}
