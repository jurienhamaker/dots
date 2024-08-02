return {
  "stevearc/oil.nvim",
  enabled = false,
  keys = {
    { "<leader>e", "<cmd>Oil --float<CR>", desc = "Explorer" },
  },
  opts = {
    keymaps = { ["<Esc>"] = "actions.close", ["q"] = "actions.close" },
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 5,
    },
  },
  -- Optional dependencies
  dependencies = { "echasnovski/mini.icons" },
}
