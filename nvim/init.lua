-- Set the leader key before anything else
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load core settings
require('core.options')
require('core.keymaps')

-- Load plugins from the lua/plugins/ directory
require('lazy').setup('plugins')
