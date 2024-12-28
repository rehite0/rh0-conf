--require("")
vim.g.mapleader=" "

--key maps
--make arrow unuasble in i mode
--check :h motions
vim.keymap.set("i","..","<ESC>")
vim.keymap.set("n",";l","o<ESC>")
vim.keymap.set("n",";k","ddkkp")
vim.keymap.set("n",";j","ddp")

--vim.keymap.set("n","<leader>pv",vim.cmd.Ex)

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
