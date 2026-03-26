function InfoSetup()
	vim.opt['modifiable']=false
	vim.keymap.set({"n","v","i"},"q","<cmd>:q!<cr>")
	vim.keymap.set({"n"},"i",
	[[T*vt:"xy<cmd>let @/=@x<cr><cmd>let @/.="\\n\\*\\*\\+"<cr>//<cr>]])
	--setup going back with mark
	--setup going to menu
	--setup colourscheme
end

vim.api.nvim_create_user_command("InfoSetup"
	,InfoSetup
	,{desc="setup nvim for info reading"})
