vim.lsp.config('docker_ls', {
  cmd = { 'docker-language-server', 'start', '--stdio' },
  filetypes = { 'dockerfile', 'yaml.docker-compose' },
  get_language_id = function(_, ftype)
    if ftype == 'yaml.docker-compose' or ftype:lower():find('ya?ml') then
      return 'dockercompose'
    else
      return ftype
    end
  end,
})
vim.lsp.enable('docker_ls')
