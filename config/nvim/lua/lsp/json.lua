vim.lsp.config('json_ls', {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  init_options = {
    provideFormatter = false,
  },
  settings = {
    json = {
      validate = { enable = true },
      format = { enable = false }, -- Doble seguridad para silenciar el formateo
    }
  }
})
vim.lsp.enable("json_ls")
