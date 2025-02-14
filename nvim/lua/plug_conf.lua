vim.keymap.set("n","<leader>mir","<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n","<leader>gol","<cmd>CellularAutomaton game_of_life<CR>")
vim.api.nvim_create_user_command("MIR","CellularAutomaton make_it_rain",{desc="run animation"})
vim.api.nvim_create_user_command("GOL","CellularAutomaton game_of_life",{desc="run animation"})
