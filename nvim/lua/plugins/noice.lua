return {
  -- This fixes the Noice warning
  {
    "folke/noice.nvim",
    opts = {
      notify = { enabled = false },
    },
  },

  -- This fixes the "NotifyBackground" error
  {
    "rcarriga/nvim-notify",
    opts = {
      -- Change this to your preferred background hex if you don't like black
      background_colour = "#1a1b26",
    },
  },
}
