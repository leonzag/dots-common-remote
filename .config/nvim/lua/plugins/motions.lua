return {
  {
    "andymass/vim-matchup",
    event = "BufReadPost", -- WARN: Don't use `LazyFile` - it doesn't work with `nvim-treesitter`
    init = function()
      vim.o.matchpairs = "(:),{:},[:],<:>"
    end,
    config = function()
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
    end,
  },
  {
    "echasnovski/mini.move",
    vscode = true,
    config = function(_, opts)
      require("mini.move").setup(opts)
    end,
    keys = {
      { "<A-l>", mode = { "n", "v" } },
      { "<A-k>", mode = { "n", "v" } },
      { "<A-j>", mode = { "n", "v" } },
      { "<A-h>", mode = { "n", "v" } },
    },
    opts = {
      mappings = {
        left = "<A-h>",
        right = "<A-l>",
        down = "<A-j>",
        up = "<A-k>",
        line_left = "<A-h>",
        line_right = "<A-l>",
        line_down = "<A-j>",
        line_up = "<A-k>",
      },
    },
  },
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        char = {
          keys = { "t", "T" },
        },
      },
    },
    -- stylua: ignore
    keys = {
      -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      -- { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "o", "x" }, false },
      { "f", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "F", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
}
