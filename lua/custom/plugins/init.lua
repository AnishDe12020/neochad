return {
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.plugins.null-ls"
      end,
   },
   ["github/copilot.vim"] = {
      config = function()
         vim.g.copilot_filetypes = { ["*"] = true }
         vim.g.copilot_no_tab_map = true
      end,
   },

   ["wakatime/vim-wakatime"] = {},

   ["hrsh7th/cmp-cmdline"] = { after = "cmp-nvim-lua" },
   ["folke/trouble.nvim"] = {},
}
