cellular_automaton_conf=function()
	mir =function()
		vim.cmd(
			[[	let f= &wrap 
				if f
					set nowrap
				endif
				CellularAutomaton make_it_rain
			 ]])
	end
	vim.keymap.set("n","<leader>mir",mir)
	vim.keymap.set("n","<leader>gol","<cmd>CellularAutomaton game_of_life<CR>")
	vim.api.nvim_create_user_command("Emir",mir,{desc="run animation"})
	vim.api.nvim_create_user_command("Egol","CellularAutomaton game_of_life",{desc="run animation"})
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
	local bufopts = { noremap=true, silent=true, }
	local mapping={
		hover={'n','[h'}
		,references={'n', '[r'}	--gr
		,signature_help={'n','[s'}
		,declaration={'n','[D'}	--gD
		,definition={'n','[d'}	--gd
		,implementation={'n','[i'}	--gi
		,add_workspace_folder={'n','[wa'}
		,remove_workspace_folder={'n','[wr'}
		,type_definition={'n','[td'}
		,rename={'n','[rn'}
		,code_action={'n','[ca'}
		,format={'n','[='}
	}
	vim.keymap.set('n','[e'	,vim.diagnostic.open_float, bufopts)
	--	vim.keymap.set('n',';lgw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	--	vim.keymap.set('n',';lw','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
	--	vim.keymap.set('n',';lli','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	--	vim.keymap.set('n',';llo','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
	for k,v in pairs(mapping) do
		vim.keymap.set(v[1],v[2],vim.lsp.buf[k],bufopts)
	end
end

utilsnips_conf=function()
	vim.g.UltiSnipsExpandTrigger="<TAB>"
	vim.g.UltiSnipsListSnippets=';sl'
	vim.g.UltiSnipsJumpForwardTrigger="<c-s-.>"
	vim.g.UltiSnipsJumpBackwardTrigger="<c-s-,>"
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
		--completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
		},
		view={docs={auto_open=false}},
		mapping = cmp.mapping.preset.insert({
			["<c-h>"] = function()
				if(cmp.visible_docs()) then cmp.close_docs()
				else cmp.open_docs() end end,
			["<C-j>"] = function()
				if(cmp.visible_docs())then cmp.scroll_docs(4)
				else cmp.select_next_item() end end,
			["<C-k>"] = function()
				if(cmp.visible_docs())then cmp.scroll_docs(-4)
				else cmp.select_prev_item() end end,
			["<C-Space>"] = cmp.mapping.complete(),
			["<s-TAB>"] = cmp.mapping.abort(),
			["<TAB>"] = cmp.mapping.confirm({ select = true }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = 'ultisnips' },
			}, {
			{ name = "buffer" },
		}),
	})
end
