-- File: ~/.config/nvim/lua/plugins/completion.lua

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "zbirenbaum/copilot-cmp", -- ADD THIS DEPENDENCY
  },
  config = function()
    local cmp = require("cmp")

    require("copilot_cmp").setup() -- Configure the copilot source

    cmp.setup({
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "copilot" }, -- ADD COPILOT TO YOUR SOURCES
        { name = "buffer" },
      }),
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
    })
  end,
}
