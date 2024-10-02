require("config.lazy")
require("onedark").load()

vim.wo.relativenumber = true
vim.opt.wrap = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autochdir = true

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
