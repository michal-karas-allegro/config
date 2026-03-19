return {
  {
    "savq/melange-nvim", -- install the plugin
    lazy = false, -- load immediately
    priority = 1000, -- load before other UI plugins
    config = function()
      vim.opt.termguicolors = true
      vim.cmd("colorscheme melange") -- set the colorscheme
    end,
  },
}
