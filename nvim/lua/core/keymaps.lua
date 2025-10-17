local keymap = vim.keymap.set

-- Add these lines to your keymaps.lua file
--
-- Toggle the bufferline
keymap('n', '<leader>b', '<cmd>BufferLineToggle<cr>', { desc = 'Toggle bufferline' })

-- Switch between buffers
keymap('n', '<C-l>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer' })
keymap('n', '<C-h>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer' })

-- Close a buffer
keymap('n', '<leader>c', '<cmd>bdelete<CR>', { desc = 'Close current buffer' })
-- General keymaps
-- We will add plugin keymaps here as we install them
print('Keymaps loaded!')



-- Open specific terminals
keymap('n', '<leader>t1', '<cmd>ToggleTerm id=1 direction=horizontal<CR>', { desc = 'Toggle term 1 (Horizontal)' })
keymap('n', '<leader>t2', '<cmd>ToggleTerm id=2 direction=horizontal<CR>', { desc = 'Toggle term 2 (Horizontal)' })
keymap('n', '<leader>t3', '<cmd>ToggleTerm id=3 direction=vertical<CR>', { desc = 'Toggle term 3 (Vertical)' })

-- Navigate between terminals
keymap('n', ']t', '<cmd>ToggleTermNext<CR>', { desc = 'Next terminal' })
keymap('n', '[t', '<cmd>ToggleTermPrev<CR>', { desc = 'Previous terminal' })




-- LSP Keymaps and Auto-Format Setup
local lsp_group = vim.api.nvim_create_augroup("user_lsp_config", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_group,
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local bufnr = event.buf
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = bufnr, noremap = true, silent = true, desc = desc })
    end

    -- Enable format on save
    if client and client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = lsp_group,
        buffer = bufnr,
        callback = function() vim.lsp.buf.format({ bufnr = bufnr }) end,
      })
    end

    -- Keybindings
    map('gd', vim.lsp.buf.definition, 'Go to Definition')
    map('K', vim.lsp.buf.hover, 'Hover Documentation')
    map('gD', vim.lsp.buf.declaration, 'Go to Declaration')
    map('<leader>rn', vim.lsp.buf.rename, 'Rename Symbol')
    map('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
    map('<leader>e', vim.diagnostic.open_float, 'Show Line Diagnostics')
  end,
})
