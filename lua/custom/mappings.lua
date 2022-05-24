require("custom.plugins.toggleterm")

local M = {}

M.toggleterm = {
  n = {
    ["<leader>g"] = { "<cmd>lua lazygit_toggle()<CR>", { noremap = true, silent = true } }
  }
}

return M
