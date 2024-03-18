return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        disable_background = true,
        disable_italics = true,
        dim_inactive_windows = false,
        styles = { transparency = true },
        groups = {
          panel = "#000000",
          overlay = "#000000",
        },
      })
    end,
  },
}
