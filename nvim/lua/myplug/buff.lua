--buff plugin depend on::
--comentry.nvim
--seting split right
vim.api.nvim_create_user_command("Ebuff",
	function(opts)
		cmd=opts.fargs[1]
		ft=opts.fargs[2]
		if cmd==nil then cmd="echo hi" end
		vim.cmd('vs /tmp/a.buff')
		vim.cmd('%d')
		vim.cmd(string.format("0read! %s",cmd))
		vim.cmd(string.format("0insert|%s\n.",string.rep("-",vim.api.nvim_win_get_width(0)-8 ) ) )
		vim.cmd(string.format("0insert|%s\n.",cmd))
		if ft then vim.cmd(string.format("set filetype=%s",ft)) end
		vim.cmd("normal ggVjgc")
	end
	,{nargs="*", desc="create a buffer"})

vim.api.nvim_create_autocmd('BufWritePre',{
	pattern='*.buff',
	callback=function()
		vim.cmd('normal ggVgc^vg_"ay')
		cmd=vim.fn.getreg("a")
		if cmd==nil then cmd="echo hi2" end
		vim.cmd('%d')
		vim.cmd(string.format("0read! %s",cmd))
		vim.cmd(string.format("0insert|%s\n.",string.rep("-",vim.api.nvim_win_get_width(0)-8 ) ) )
		vim.cmd(string.format("0insert|%s\n.",cmd))
		vim.cmd("normal ggVjgc")
	end
})
