local present, lspconfig = pcall(require, "lspconfig")

if not present then
   return
end

local M = {}

require("plugins.configs.others").lsp_handlers()

-- Borders for LspInfo winodw
local win = require "lspconfig.ui.windows"
local _default_opts = win.default_opts

win.default_opts = function(options)
   local opts = _default_opts(options)
   opts.border = "single"
   return opts
end

M.on_attach = function(client, bufnr)
   client.resolved_capabilities.document_formatting = false
   client.resolved_capabilities.document_range_formatting = false

   local lsp_mappings = require("core.utils").load_config().mappings.lspconfig
   local wk_exists, wk = pcall(require, "which-key")

   if wk_exists then
      wk.register(lsp_mappings.n, { buffer = bufnr })
   else
      -- todo, make use of bufnr here
      -- add no whichkey func logic here
   end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
   documentationFormat = { "markdown", "plaintext" },
   snippetSupport = true,
   preselectSupport = true,
   insertReplaceSupport = true,
   labelDetailsSupport = true,
   deprecatedSupport = true,
   commitCharactersSupport = true,
   tagSupport = { valueSet = { 1 } },
   resolveSupport = {
      properties = {
         "documentation",
         "detail",
         "additionalTextEdits",
      },
   },
}

lspconfig.sumneko_lua.setup {
   on_attach = M.on_attach,
   capabilities = capabilities,

   settings = {
      Lua = {
         diagnostics = {
            globals = { "vim", "nvchad" },
         },
         workspace = {
            library = {
               [vim.fn.expand "$VIMRUNTIME/lua"] = true,
               [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
         },
      },
   },
}

local servers = { "tsserver", "tailwindcss", "eslint", "cssls", "gopls", "prismals", "rust_analyzer", "solang" }

for _, lsp in ipairs(servers) do
   lspconfig[lsp].setup {
      on_attach = M.on_attach,
      capabilities = capabilities,
   }
end
--
-- -- requires a file containing user's lspconfigs
-- local addlsp_confs = nvchad.load_config().plugins.options.lspconfig.setup_lspconf
--
-- if #addlsp_confs ~= 0 then
--    require(addlsp_confs).setup_lsp(M.on_attach, capabilities)
-- end

return M
