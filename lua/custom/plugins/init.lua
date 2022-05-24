return {
  ["akinsho/toggleterm.nvim"] = {
    config = function ()
      require "custom.plugins.toggleterm"
    end
  },
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require "custom.plugins.null-ls"
      end,
   },
   ["hrsh7th/cmp-cmdline"] = {
     config = function ()
      require("custom.plugins.cmp_cmdline")
     end
   }
}
