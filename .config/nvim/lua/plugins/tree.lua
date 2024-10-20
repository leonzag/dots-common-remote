return {
  "nvim-neo-tree/neo-tree.nvim",
  -- enabled = false,
  keys = {
    { "<A-o>", "<esc><cmd>Neotree toggle float<cr>", mode = { "n", "v" }, desc = "Toggle Explorer" },
    { "<A-e>", "<esc><cmd>Neotree toggle left action=show<cr>", mode = { "n", "v" }, desc = "Toggle Explorer" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  opts = {
    update_focused_file = {
      enable = true,
    },
    event_handlers = { -- normal mode in rename inputs
      {
        event = "neo_tree_popup_input_ready",
        ---@param args { bufnr: integer, winid: integer }
        handler = function(args)
          vim.cmd("stopinsert")
          vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
        end,
      },
    },
    popup_border_style = "single",
    sources = { "filesystem" },
    source_selector = {
      winbar = false,
      statusline = false,
    },
    window = {
      mappings = {
        ["<space>"] = "none",
        ["<A-.>"] = "next_source",
        ["<A-,>"] = "prev_source",
        ["Y"] = "none",
        -- ["Y"] = function(state)
        --   local node = state.tree:get_node()
        --   local path = node:get_id()
        --   vim.fn.setreg("+", path, "c")
        -- end,
      },
    },
    filesystem = {
      filtered_items = {
        always_show = { ".github", ".gitignore", ".config", ".local", ".zsh" },
      },
      -- WARN: dangerous opt:
      use_libuv_file_watcher = true,
      find_by_full_path_words = true,
      window = {
        mappings = {
          ["t"] = { "add", nowait = true, config = { show_path = "none" } },
          ["L"] = { "open_nofocus" },
        },
      },
      commands = {
        open_nofocus = function(state)
          require("neo-tree.sources.filesystem.commands").open(state)
          vim.schedule(function()
            vim.cmd([[Neotree focus]])
          end)
        end,
      },
    },
    sort_case_insensitive = true,
    default_component_configs = {
      modified = {
        symbol = " ● ",
        highlight = "NeoTreeModified",
      },
    },
  },
}
