vim.cmd.let('mapleader = " "') -- Change the leader key to space bar
vim.keymap.set('n', '<leader>ff', '<cmd>Ex<cr>')  -- Spacebar + f + f will take you to the file list 
vim.keymap.set('n', '<leader>to', '<cmd>terminal<cr>')

-- Telescope bindings

local builtin = require('telescope.builtin') -- declare the builtin variable and assign telescope to it
vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- spacebar+p+f will open up the telescope file explorer
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {}) -- spacebar+p+g will open up a page where you can type a string and search for files containing it
