vim.lsp.config('bash_ls', {
  cmd = { "bash-language-server", "start" },
  settings = {
    bashIde = {
      globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)',
    },
  },
  filetypes = { "bash", "sh" },
})
vim.lsp.enable('bash_ls')
