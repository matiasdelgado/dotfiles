return {
  cmd = { "omnisharp" },
  root_dir = function(fname)
    local lspconfig = require('lspconfig')
    return lspconfig.util.root_pattern('*.sln', '*.csproj', '.git')(fname)
  end,
  settings = {
    FormattingOptions = {
      EnableEditorConfigSupport = true,
      OrganizeImports = true,
    },
    RoslynExtensionsOptions = {
      EnableAnalyzersSupport = true,
      EnableImportCompletion = true,
      EnableDecompilationSupport = true,
    },
  },
}
