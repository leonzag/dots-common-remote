return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<A-.>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    { "<A-]>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer right " },
    { "<A-,>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "<A-[>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer left" },
    { "<S-h>", false },
    { "<S-l>", false },
  },
  opts = {
    options = {
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "NeoTreeDirectoryIcon",
          text_align = "center",
        },
        -- {
        --   filetype = "aerial",
        --   text = "Code Outline",
        --   highlight = "AerialLine",
        --   text_align = "left",
        -- }
      },
    },
  },
}
