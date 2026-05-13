--- Typescript language server configuration
vim.lsp.config('ts_ls', {
  cmd = { "typescript-language-server", "--stdio" },
  init_options = { hostInfo = "neovim" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" },
})

vim.lsp.enable('ts_ls')

-- Intercepción para apagar el formateo (delegado a Biome)
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'Desactivar formateo de ts_ls a favor de Biome',
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == 'ts_ls' then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end
  end,
})
