vim.g.mapleader=" "
vim.g.maplocalleader="\\"
require("config.lazy")
require("python3.init")

--key maps
--check motions and key-notation
vim.keymap.set("i",";;","<ESC>")
vim.keymap.set({"i","v","n"},";l",'<cmd>popu lsp<cr>')

vim.keymap.set("n","<Leader><CR>","o<ESC>")
vim.keymap.set("n","<Leader>;",":E")

vim.keymap.set("n","<Leader>k",":normal! mtkddp`t<CR>")
vim.keymap.set("n","<Leader>j",":normal! mtjddkkp`t<CR>")
vim.keymap.set("n","<Leader>m",":make<CR>")
vim.keymap.set("n","<Leader>e",":Lex 30 <CR>")

--make arrow unuasble in i mode
vim.keymap.set("i","<Up>","<Nop>")
vim.keymap.set("i","<Down>","<Nop>")
vim.keymap.set("i","<Left>","<Nop>")
vim.keymap.set("i","<Right>","<Nop>")

--user command
vim.api.nvim_create_user_command("Epause","suspend",{desc="pause nvim"})
vim.api.nvim_create_user_command("Eterm","call system('alacritty')",{desc="launch terminal"})
vim.api.nvim_create_user_command("Elsp","popup lsp",{desc="launch lsp menu"})

--options check :h options
local opt={
	clipboard		= 'unnamedplus'
	,number			= true
	,relativenumber	= false
	,numberwidth	= 3
	,hlsearch		= false
	,wrap			= true
	,ignorecase		= true
	,smartcase		= true
	,termguicolors	= true
	,backup			= false
	,swapfile		= false
	,mouse			= "a"
	,autoread		= true
	,tabstop		= 4
	,expandtab		= false
	,shiftwidth		= 4
	,autoindent		= true
	,smartindent	= true
	,encoding		= "utf-8"
	,scrolloff		= 2
	,nrformats		= 'hex'
	,backspace		= "indent,eol,start"
	,history		= 1000
	,wrapscan		= true
}
vim.cmd([[
	aunmenu PopUp
	anoremenu	PopUp.terminal	<cmd>call system('alacritty')<CR>
	anoremenu	PopUp.man	<cmd>call system('alacritty -e bash -i -c fman')<CR>
	anoremenu	PopUp.thunar	<cmd>call system('thunar')<CR>
	anoremenu	PopUp.make	<cmd>w<CR><cmd>Make<CR>
	anoremenu	PopUp.gdb	<cmd>w<CR><cmd>call system('alacritty -e bash -c gdb')<CR>

	anoremenu	PopUp.explore	<cmd>lex 30<CR>
	anoremenu	PopUp.save	<cmd>w<cr>
	anoremenu	PopUp.save&exit	<cmd>x<cr>
	anoremenu	PopUp.exit	<cmd>q!<cr>
	anoremenu	PopUp.delete	<cmd>d<cr>
	anoremenu	PopUp.yank	<cmd>y<cr>
	anoremenu	PopUp.put	<cmd>p<cr>

	anoremenu	PopUp.lsp	<cmd>popup lsp<cr>
	anoremenu	lsp.diagnostic		<cmd>lua vim.diagnostic.open_float()<cr>
	anoremenu	lsp.references		<cmd>lua vim.lsp.buf.references()<cr>
	anoremenu	lsp.type_definition	<cmd>lua vim.lsp.buf.type_definition()<cr>
	anoremenu	lsp.typehierarchy		<cmd>lua vim.lsp.buf.typehierarchy()<cr>
	anoremenu	lsp.workspace_symbol	<cmd>lua vim.lsp.buf.workspace_symbol()<cr>
	anoremenu	lsp.document_symbol	<cmd>lua vim.lsp.buf.document_symbol()<cr>
	anoremenu	lsp.signature_help	<cmd>lua vim.lsp.buf.signature_help()<cr>
	anoremenu	lsp.incoming_calls	<cmd>lua vim.lsp.buf.incoming_calls()<cr>
	anoremenu	lsp.implementation	<cmd>lua vim.lsp.buf.implementation()<cr>
	anoremenu	lsp.hover			<cmd>lua vim.lsp.buf.hover()<cr>
	anoremenu	lsp.format		<cmd>lua vim.lsp.buf.format()<cr>
	anoremenu	lsp.definition		<cmd>lua vim.lsp.buf.definition()<cr>
	anoremenu	lsp.declaration		<cmd>lua vim.lsp.buf.declaration()<cr>
	amenu     PopUp.URL         gx
]])

local group = vim.api.nvim_create_augroup("nvim.popupmenu", { clear = true })
vim.api.nvim_create_autocmd("MenuPopup", {
	pattern = "*",
	group = group,
	desc = "Custom PopUp Setup",
	callback = function()
		vim.cmd [[
	  amenu disable PopUp.lsp
	  ]]

		if vim.lsp.get_clients({ bufnr = 0 })[1] then
			vim.cmd [[
		amenu enable PopUp.lsp
		]]
		end
	end,
})

for k,v in pairs(opt) do
	vim.opt[k]=v
end

