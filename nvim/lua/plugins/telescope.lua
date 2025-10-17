return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local builtin = require('telescope.builtin')
    local keymap = vim.keymap.set

    -- Re-creating your exact keybindings
    keymap('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
    keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
    keymap('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
    keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Find help tags' })
  end,
}
