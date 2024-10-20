return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    init = function()
      -- https://github.com/sainnhe/gruvbox-material/issues/176
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("highlight-overrides-gruvbox-material", {}),
        pattern = "gruvbox-material",
        callback = function()
          vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { link = "TSComment" })
          vim.api.nvim_set_hl(0, "Search", { fg = "#fabd2f" })
          vim.api.nvim_set_hl(0, "IncSearch", { fg = "#fabd2f", bg = "#45403d" })
          vim.api.nvim_set_hl(0, "ErrorText", { underline = true, ctermbg = 52, bg = "none", sp = "#f2594b" })
          -- vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
          -- vim.api.nvim_set_hl(0, "FloatBorder", { link = "Grey", bg = "none" })
        end,
      })
      vim.cmd.colorscheme("gruvbox-material")
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_dim_inactive_windows = 0
      vim.g.gruvbox_material_visual = "blue background"
      -- vim.g.gruvbox_material_ui_contrast = "high"
      -- vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.g.gruvbox_material_diagnostic_line_highlight = 1
      vim.g.gruvbox_material_current_word = "underline"
      vim.g.gruvbox_material_spell_foreground = "colored"
    end,
  },
}
