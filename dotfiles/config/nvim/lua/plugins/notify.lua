return {
  {
    "rcarriga/nvim-notify",
    name = "nvim-notify",
    opts = {},
    config = function(_, opts)
      require("notify").setup(vim.tbl_extend("keep", {
        -- other stuff
        background_colour = "#000000",
      }, opts))
    end,
  },
}
