return {
  {
    "rcarriga/nvim-notify",
    opts = {
      render = "compact",
      stages = "static",
      fps = 60,
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = false,
        lsp_doc_border = false,
      },
      routes = {
        {
          filter = { find = "Cannot make changes, 'modifiable' is off" },
          opts = { stop = true },
        },
        {
          filter = { find = "Treesitter parser not found for current buffer" },
          opts = { stop = true },
        },
        {
          filter = { find = "Node .* for lang .* is not configured" },
          opts = { stop = true },
        },
        {
          filter = { find = "no manual entry for" },
          opts = { stop = true },
        },
        {
          filter = { find = "No information available" },
          opts = { stop = true },
        },
      },
      views = {
        cmdline_popup = {
          border = {
            style = "single",
          },
        },
        cmdline_popupmenu = {
          border = {
            style = "single",
          },
        },
        hover = {
          border = {
            -- style = "single", -- also set lsp_doc_border = true,
          },
        },
        popup = {
          border = {
            style = "single",
          },
        },
        mini = {
          border = {
            style = "single",
          },
        },
        notify = {
          border = {
            style = "single",
          },
        },
      },
    },
  },
}
