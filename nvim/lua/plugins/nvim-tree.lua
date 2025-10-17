return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('nvim-tree').setup {}

    -- Your old keymap to toggle the file explorer
    local keymap = vim.keymap.set
    keymap('n', '<C-g>', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle file explorer' })
  end,
}
