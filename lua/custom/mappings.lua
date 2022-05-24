require("custom.plugins.toggleterm")

local M = {}

M.toggleterm = {
  n = {
    ["<leader>g"] = { "<cmd>lua lazygit_toggle()<CR>", { noremap = true, silent = true } },
        ["<leader>cr"] = { ":source $MYVIMRC<CR>" , { noremap = true, silent = true } },
        ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "  find files" },

  },
}

return M
