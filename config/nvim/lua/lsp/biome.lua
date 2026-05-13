--- Biome language server configuration
vim.lsp.config('biome', {
  cmd = function(dispatchers, config)
    local exec_cmd = 'biome'
    if config and config.root_dir then
      local local_cmd = vim.fs.joinpath(config.root_dir, 'node_modules', '.bin', 'biome')
      if vim.fn.executable(local_cmd) == 1 then
        exec_cmd = local_cmd
      end
    end
    return vim.lsp.rpc.start({ exec_cmd, 'lsp-proxy' }, dispatchers)
  end,
  filetypes = {
    'astro', 'css', 'graphql', 'javascript', 'javascriptreact',
    'json', 'jsonc', 'svelte', 'typescript', 'typescriptreact', 'vue',
  },
  root_markers = { 'biome.json', 'biome.jsonc' },
  workspace_required = true
})

vim.lsp.enable('biome')
