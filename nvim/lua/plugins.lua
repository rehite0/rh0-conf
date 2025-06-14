require("plug_conf")
return {
	{'morhetz/gruvbox'
		,config = function() vim.cmd.colorscheme("gruvbox")
		vim.api.nvim_set_hl(0, "StatusLine", {reverse = false})
		vim.api.nvim_set_hl(0, "StatusLineNC", {reverse = false})
	end
	}
	,{"nvim-treesitter/nvim-treesitter"
		,build = ":TSUpdate"
		,config = function ()
      		local configs = require("nvim-treesitter.configs")

    		configs.setup({
    			ensure_installed = { "c", "lua", "vim", "vimdoc","python","glsl"
									,"query", "elixir", "heex", "javascript", "html", "bash" },
          		sync_install = false,
          		highlight = { enable = true },
          		indent = { enable = true },
        		})
    	end}
	,{	'eandrju/cellular-automaton.nvim'
		,config=cellular_automaton_conf
	}
	,{	'mbbill/undotree'
		,config=undotree_conf
	}
	,{
		'nvim-lualine/lualine.nvim'
		,dependencies = { 'nvim-tree/nvim-web-devicons' }
		,config=lualine_conf
	},

	{
		 "williamboman/mason.nvim"
		,config=mason_conf
	},
	{
		 "williamboman/mason-lspconfig.nvim"
		,dependencies = {'mason.nvim'}
		,config=mason_lspconfig_conf
	},

	{
		"neovim/nvim-lspconfig"
	},
	{ 'Sirver/ultisnips', config=utilsnips_conf},
	{
		"hrsh7th/cmp-nvim-lsp"
	},
	{
		"hrsh7th/nvim-cmp",
		config =cmp_conf,
		dependencies={ 'quangnguyen30192/cmp-nvim-ultisnips' },
	},
	{
		'michaeljsmith/vim-indent-object',
	},
	{
		'tpope/vim-commentary',
		config= function()
			vim.cmd('filetype plugin indent on')
			end
	},
	{
		'tpope/vim-surround'
	},
}
