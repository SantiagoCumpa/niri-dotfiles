--- Rust language server (rust analyzer)
vim.lsp.config('rust_ls', {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml', 'rust-project.json' },
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = true,
      procMacro = {
        enable = true,
      },
    }
  },
})


vim.lsp.enable('rust_ls')
