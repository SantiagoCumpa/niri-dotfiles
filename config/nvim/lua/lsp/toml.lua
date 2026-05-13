vim.lsp.config('toml_ls', {
  cmd = { 'tombi', 'lsp' },
  filetypes = { 'toml' },
})
vim.lsp.enable('toml_ls')
