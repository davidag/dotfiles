local M = {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  event = "Bufenter",
  cmd = { "Telescope" },
  dependencies = { 'nvim-lua/plenary.nvim' },
}

M.opts = {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },
  },
}

return M
