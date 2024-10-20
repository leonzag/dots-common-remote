return {
  {
    "LunarVim/bigfile.nvim",
    opts = {},
  },
  {
    "mg979/vim-visual-multi",
    branch = "master",
    -- event = { "BufReadPost", "BufNewFile" },
    init = function()
      vim.g.VM_theme = "purplegray"
      vim.g.VM_mouse_mappings = 1
    end,
  },
  {
    "Wansmer/treesj",
    vscode = true,
    keys = {
      { "J", "<CMD>TSJToggle<CR>", mode = { "n", "v" }, desc = "Toggle TreesJoin" },
    },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = {
      use_default_keymaps = false,
      max_join_length = 500,
    },
  },
  {
    "monaqa/dial.nvim",
    keys = {
      -- Visual mode mappings
      {
        "+",
        mode = { "v" },
        function()
          require("dial.map").manipulate("increment", "visual")
        end,
        desc = "Increment",
      },
      {
        "-",
        mode = { "v" },
        function()
          require("dial.map").manipulate("decrement", "visual")
        end,
        desc = "Decrement",
      },
      {
        "g+>",
        mode = { "v" },
        function()
          require("dial.map").manipulate("increment", "gvisual")
        end,
        desc = "Increment",
      },
      {
        "g-",
        mode = { "v" },
        function()
          require("dial.map").manipulate("decrement", "gvisual")
        end,
        desc = "Decrement",
      },
      -- Normal mode mappings
      {
        "+",
        function()
          require("dial.map").manipulate("increment", "normal")
        end,
        desc = "Increment",
      },
      {
        "-",
        function()
          require("dial.map").manipulate("decrement", "normal")
        end,
        desc = "Decrement",
      },
      {
        "g+>",
        function()
          require("dial.map").manipulate("increment", "gnormal")
        end,
        desc = "Increment",
      },
      {
        "g-",
        function()
          require("dial.map").manipulate("decrement", "gnormal")
        end,
        desc = "Decrement",
      },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.case.new({
            types = { "camelCase", "PascalCase", "snake_case", "SCREAMING_SNAKE_CASE" },
          }),
        },
      })
    end,
  },
}

