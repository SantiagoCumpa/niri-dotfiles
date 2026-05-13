vim.lsp.config('fish_ls', {
  cmd = { "fish-lsp", "start" },
  filetypes = { "fish" },
})
vim.lsp.enable('fish_ls')
