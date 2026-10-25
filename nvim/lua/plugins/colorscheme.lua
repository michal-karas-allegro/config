return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- Enable true color support
      vim.opt.termguicolors = true

      -- Set background to dark
      vim.o.background = "dark"

      -- Choose contrast/variant: 'hard', 'medium' (default), or 'soft'
      vim.g.gruvbox_material_background = "hard"

      -- Optional: Enable italic comments
      vim.g.gruvbox_material_enable_italic = 1

      -- Load the colorscheme
      vim.cmd("colorscheme gruvbox-material")
    end,
  },
}
