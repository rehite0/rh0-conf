--require("")
vim.g.mapleader=" "

--key maps
--make arrow unuasble in i mode
--check motions and key-notation
vim.keymap.set("i",";;","<ESC>")

vim.keymap.set("n","<Leader>l","o<ESC>")
vim.keymap.set("n","<Leader>:",":!")

vim.keymap.set("n","<Leader>k",":normal! mtkddp`t<CR>")
vim.keymap.set("n","<Leader>j",":normal! mtjddkkp`t<CR>")
vim.keymap.set("n","<Leader>m",":make<CR>")
vim.keymap.set("n","<Leader>e",":Lex 30 <CR>")

vim.keymap.set("i","<Up>","<Nop>")
vim.keymap.set("i","<Down>","<Nop>")
vim.keymap.set("i","<Left>","<Nop>")
vim.keymap.set("i","<Right>","<Nop>")

--user command
vim.api.nvim_create_user_command("P","suspend",{desc="pause nvim"})

--options check :h options
local opt={
	clipboard	= 'unnamedplus'
	,tabstop	= 4
	,number		= true
	,relativenumber	= false
	,numberwidth	= 3
	,hlsearch	= false
	,shiftwidth	= 4
	,wrap		= true
	,ignorecase	= true
	,smartcase	= true
	,termguicolors	= true
	,backup		= false
	,swapfile	= false
	,mouse		= "a"
	,autoread	= true
	,autoindent	= true
	,smartindent	= true
	,encoding	= "utf-8"
	,scrolloff	= 7
	,nrformats	= 'hex'
	,backspace	= "indent,eol,start"
	,history	= 1000
}
--scripts

--auto command :h autocmd
--vim.api.create_autocmd(
--	{'VimSuspend'},
--	pattern="",
--	callback=function() end)
--au VimResume

--------------------------------------
for k,v in pairs(opt) do
	vim.opt[k]=v
end

--print("")
--use :so to source
--
--plugin:
--	fugitive
--	commentary
