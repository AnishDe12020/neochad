local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
   return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

null_ls.setup {
   debug = true,
   sources = {
      formatting.prettier,
      formatting.rustfmt,
      formatting.stylua,
      formatting.gofmt,
   },
   on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
         vim.cmd [[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]]
      end
   end,
}

vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
