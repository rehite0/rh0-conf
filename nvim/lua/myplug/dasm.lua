
require("myplug.buff")

vim.api.nvim_create_user_command("Edasm"
	,function()
		vim.cmd(string.format("Ebuff gcc\\ -O3\\ -masm=intel\\ -march='native'\\ -S\\ %s\\ -o- asm",vim.fn.expand("%:p")) )
	end
	,{desc="disasmble current file"})

