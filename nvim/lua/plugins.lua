return {
	{'morhetz/gruvbox'
		,config = function() vim.cmd.colorscheme("gruvbox") end
	}
	,{"nvim-treesitter/nvim-treesitter"
		,build = ":TSUpdate"
		,config = function () 
      		local configs = require("nvim-treesitter.configs")

    		configs.setup({
    			ensure_installed = { "c", "lua", "vim", "vimdoc","python","glsl"
									,"query", "elixir", "heex", "javascript", "html" },
          		sync_install = false,
          		highlight = { enable = true },
          		indent = { enable = true },  
        		})
    	end}
	,{'eandrju/cellular-automaton.nvim'}
	,{'mbbill/undotree'}
	,{
    	'nvim-lualine/lualine.nvim',
    	dependencies = { 'nvim-tree/nvim-web-devicons' }
	}

}
