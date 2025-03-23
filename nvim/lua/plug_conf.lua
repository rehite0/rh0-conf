cellular_automaton_conf=function()
	vim.keymap.set("n","<leader>mir","<cmd>CellularAutomaton make_it_rain<CR>")
	vim.keymap.set("n","<leader>gol","<cmd>CellularAutomaton game_of_life<CR>")
	vim.api.nvim_create_user_command("MIR","CellularAutomaton make_it_rain",{desc="run animation"})
	vim.api.nvim_create_user_command("GOL","CellularAutomaton game_of_life",{desc="run animation"})
end

undotree_conf=function()
	vim.keymap.set("n","<leader>u","<cmd>UndotreeToggle<CR>")
end

lualine_conf=function()
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
end

mason_conf=function()
	require 'mason'.setup{}
end

mason_lspconfig_conf=function()
	require 'mason-lspconfig'.setup{}
	require 'mason-lspconfig'.setup_handlers{
			function(server_name) 
				local capabilities = require('cmp_nvim_lsp').default_capabilities()
				require('lspconfig')[server_name].setup{
				 on_attach=lspconfig_on_attach
				,root_dir = require('lspconfig').util.root_pattern(".git",vim.fn.getcwd())
				,capabilities = capabilities
			}
			end
	}
end

lspconfig_on_attach=function(client)
	print("LSP started.");
	--require'completion'.on_attach(client)
	--require'diagnostic'.on_attach(client)

	vim.keymap.set('n','vi','<cmd>lua vim.lsp.buf.declaration()<CR>')
	vim.keymap.set('n','vd','<cmd>lua vim.lsp.buf.definition()<CR>')
	vim.keymap.set('n','vK','<cmd>lua vim.lsp.buf.hover()<CR>')
	vim.keymap.set('n','vr','<cmd>lua vim.lsp.buf.references()<CR>')
	vim.keymap.set('n','va','<cmd>lua vim.lsp.buf.signature_help()<CR>')
--	vim.keymap.set('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
--	vim.keymap.set('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
--	vim.keymap.set('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
--	vim.keymap.set('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
--	vim.keymap.set('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
--	vim.keymap.set('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
--	vim.keymap.set('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
--	vim.keymap.set('n','<leader>ar','<cmd>lua vim.lsp.buf.rename()<CR>')
--	vim.keymap.set('n','<leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>')
--	vim.keymap.set('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
--	vim.keymap.set('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end

utilsnips_conf=function()
	vim.g.UltiSnipsExpandTrigger="<TAB>"
	vim.g.UltiSnipsListSnippets='<A-l'
	vim.g.UltiSnipsJumpForwardTrigger="<A-n>"
	vim.g.UltiSnipsJumpBackwardTrigger="<A-p>"
	vim.g.UltiSnipsEditSplit="vertical"
	vim.g.UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips/"
end
cmp_conf= function()
	local cmp = require("cmp")
	cmp.setup({
		snippet = {
			expand = function(args)
				vim.fn["UltiSnips#Anon"](args.body)
			end,
		},
		window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = 'ultisnips' },	
			}, {
			{ name = "buffer" },
		}),
	})
end
