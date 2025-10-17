local opt = vim.opt -- for conciseness

-- Tab / Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- Search
opt.incsearch = true
opt.hlsearch = true

-- Appearance
opt.number = true
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = 'yes' -- Always show the signcolumn to avoid layout shifts
opt.laststatus = 2 -- Always show the statusline

-- Behavior
opt.clipboard = 'unnamedplus' -- Use system clipboard
opt.swapfile = false -- Disable swap files
opt.scrolloff = 8 -- Keep 8 lines visible above/below the cursor
