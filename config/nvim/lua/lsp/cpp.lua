--- C/C++ language server
vim.lsp.config('cpp_ls', {
  -- Comando optimizado para alto rendimiento y análisis estricto
  cmd = {
    'clangd',
    '--background-index',      -- Indexa el código en segundo plano
    '--clang-tidy',            -- Activa el linter estricto de C++
    '--header-insertion=iwyu', -- Inserta los includes necesarios automáticamente
    '--completion-style=detailed'
  },

  -- Soportar todo el ecosistema de LLVM
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },

  -- Marcadores críticos. El servidor buscará estos archivos hacia arriba en el directorio
  root_markers = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac'
  },

  -- Aunque funciona en archivos únicos, se recomienda tener un proyecto estructurado
  workspace_required = false,
})
vim.lsp.enable('cpp_ls')
