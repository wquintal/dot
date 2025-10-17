return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup({
      open_mapping = [[<c-\>]], -- A common mapping to open a terminal
      direction = 'float',
    })

    local keymap = vim.keymap.set
    -- Re-creating your exact keybindings for different terminal types
    keymap('n', '<leader>tt', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Toggle floating terminal' })
    keymap('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Toggle horizontal terminal' })
  end
}
