local cmd, opt = vim.cmd, vim.opt

cmd("syntax on")
cmd("filetype plugin on")

vim.g.mapleader = " "
opt.clipboard = "unnamedplus"
opt.splitright = true
opt.splitbelow = true
opt.winminheight = 0
opt.winminwidth = 0
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.encoding = "utf-8"
opt.viminfo = "<800,:100,/50,'100,f1"
opt.exrc = true
opt.secure = true

opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftround = true
opt.joinspaces = false
opt.autoindent = true
