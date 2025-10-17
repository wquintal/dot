return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      -- You can customize the signs here if you want
      signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = ' ' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
    })
  end,
}
