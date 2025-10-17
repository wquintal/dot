return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Import mason
    local mason = require("mason")

    -- Import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- Enable mason
    mason.setup()

    -- This line is important. It tells mason-lspconfig to automatically install
    -- the tools we need for our specific LSPs.
    mason_lspconfig.setup({
      -- A list of servers to automatically install if they're not already present
      ensure_installed = {
        "gopls"
      }
    })
  end,
}
