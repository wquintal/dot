return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    -- The FIX is here: We use .setup() and pass the handler inside.
    -- This replaces the old setup_handlers() function.
    mason_lspconfig.setup({
      handlers = {
        function(server_name)
          -- This is the function that connects the server to lspconfig
          lspconfig[server_name].setup({})
        end,
      },
    })
  end,
}
