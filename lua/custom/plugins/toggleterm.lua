require("toggleterm").setup({
	open_mapping = [[<C-\>]],
        --  open_mapping = [[<c-x>]],
   hide_numbers = true, -- hide the number column in toggleterm buffers
   shade_filetypes = {},
   shade_terminals = false,
   shading_factor = "0", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
   start_in_insert = true,
   insert_mappings = false, -- whether or not the open mapping applies in insert mode
   persist_size = false,
   direction = "horizontal", --'horizontal', -- 'vertical' | 'horizontal' | 'window' | 'float',
   shell = vim.o.shell, -- change the default shell
   -- This field is only relevant if direction is set to 'float'
})

function _G.set_terminal_keymaps()
   local opts = { noremap = true }
   vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
   vim.api.nvim_buf_set_keymap(0, "t", "jk", "<esc>", opts)
   vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
   vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
   vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
   vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

lazygit_toggle = function()
	lazygit:toggle()
end


