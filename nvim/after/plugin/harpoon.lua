local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>m1', function() mark.set_current_at(1) end)
vim.keymap.set('n', '<leader>m2', function() mark.set_current_at(2) end)
vim.keymap.set('n', '<leader>m3', function() mark.set_current_at(3) end)
vim.keymap.set('n', '<leader>m4', function() mark.set_current_at(4) end)

vim.keymap.set('n', '<leader>f1', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>f2', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>f3', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>f4', function() ui.nav_file(4) end)

