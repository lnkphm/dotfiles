-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- No swap file
vim.opt.swapfile = false

-- Fast update time
vim.opt.updatetime = 250

-- Line number
vim.opt.nu = true

-- Show relative number to the line with cursor
vim.opt.relativenumber = true

-- Wrap
vim.opt.wrap = false

-- Display mode
vim.opt.showmode = false

-- Always dislay status line
vim.opt.laststatus = 2

-- Minimal number of lines to keep above and below the cursor
vim.opt.scrolloff = 8

-- Alway display sign column
vim.opt.signcolumn = 'yes'

-- Allow filename with '@'
vim.opt.isfname:append('@-@')

-- Search highlight
vim.opt.hlsearch = false

-- Split window rules
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Copy indent of current line to new line
vim.opt.autoindent = true

-- Number of space that <Tab> counts for
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Round indent. Use for > and <
vim.opt.shiftround = true

-- Use appropriate number of spaces to insert a <Tab>
vim.opt.expandtab = true

-- Insert correct blanks when in front of a line
vim.opt.smarttab = true

-- Smart backspace
vim.opt.backspace = 'indent,eol,start'

-- Hightlight current line
vim.opt.cursorline = true

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable 24bit color
vim.opt.termguicolors = true

