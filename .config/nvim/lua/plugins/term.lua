return {
  "akinsho/toggleterm.nvim",
  init = function()
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<C-w>", [[<C-\><C-w>]], opts)
      vim.keymap.set("t", "<C-l>", [[<C-\><C-l>]], opts)
      -- vim.keymap.set("t", "<C-k>", [[<C-\><C-k>]], opts)
      vim.keymap.set("t", "<C-j>", [[<C-\><C-j>]], opts)
      -- vim.keymap.set("t", "<C-h>", [[<C-\><C-h>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  end,
  keys = {
    { "<A-;>", "<cmd>ToggleTerm direction=float<cr>", mode = { "i", "n", "v", "t" }, desc = "ToggleTerm" },
    { "<A-t>", "<cmd>ToggleTerm direction=horizontal<cr>", mode = { "i", "n", "v", "t" }, desc = "ToggleTerm" },
    { "<A-\\>", "<cmd>ToggleTerm direction=vertical<cr>", mode = { "i", "n", "v", "t" }, desc = "ToggleTerm" },
    { "<A-h>", "<Left>", mode = { "t" }, desc = "Left" },
    { "<A-j>", "<Down>", mode = { "t" }, desc = "Down" },
    { "<A-k>", "<Up>", mode = { "t" }, desc = "Up" },
    { "<A-l>", "<Right>", mode = { "t" }, desc = "Right" },
  },
  -- TODO: Configure LazyGit for working with toggleterm
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    direction = "float",
    highlights = {
      -- Normal = {
      --   guibg = "#232323",
      -- },
      NormalFloat = {
        link = "NormalFloat",
      },
      FloatBorder = {
        --   guifg = "#928374",
        --   guibg = "#282828",
        link = "FloatBorder",
      },
    },
    shading_factor = -20,
    float_opts = {
      winblend = 5,
      border = "single",
    },
  },
}
