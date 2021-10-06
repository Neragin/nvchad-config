local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config

   local servers = {"html", "cssls", "tsserver", "pyright", "sqlls", "rust_analyzer", "prismals", "jsonls", "bashls", "yamlls", "dotls"}

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         -- root_dir = vim.loop.cwd,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end
   
   -- typescript

  -- lspconfig.tsserver.setup {
  --   cmd = { "typescript-language-server", "--stdio" },
  --   filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  --   init_options = {hostInfo = "neovim"},
  --   root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
  --   }
end

return M

