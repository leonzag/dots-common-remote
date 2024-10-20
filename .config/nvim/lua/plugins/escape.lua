return {
  {
    "max397574/better-escape.nvim",
    enabled = true,
    opts = {
      -- mapping = { "jk", "jj", "kj" },
      mappings = {
        i = {
          k = { j = "<Esc>" },
        },
        t = {
          j = {},
        },
      },
      timeout = 300,
    },
  },
}
