--celullar automaton
vim.keymap.set("n","<leader>mir","<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n","<leader>gol","<cmd>CellularAutomaton game_of_life<CR>")
vim.api.nvim_create_user_command("MIR","CellularAutomaton make_it_rain",{desc="run animation"})
vim.api.nvim_create_user_command("GOL","CellularAutomaton game_of_life",{desc="run animation"})

--undotree
vim.keymap.set("n","<leader>u","<cmd>UndotreeToggle<CR>")

--lualine
require 'lualine'.setup{
	sections = {
		lualine_a = {'location','progress'},
		lualine_b = {'filename','diff'},
		lualine_c = {},
		lualine_x = {'filetype'},
		lualine_y = {'branch'},
		lualine_z = {'mode'},

	},
	options = {
		icons_enabled = false,
		theme = 'auto',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {
		  statusline = {},
		  winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = false,
		refresh = {
		  statusline = 100,
		  tabline = 100,
		  winbar = 100,
    	}
  	},
	inactive_sections = {
    	lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	  },
  	tabline = {},
 	winbar = {},
  	inactive_winbar = {},
  	extensions = {}
}
