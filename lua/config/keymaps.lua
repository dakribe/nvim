local modes = {
	normal = "n",
	visual_select = "v",
	select = "s",
	visual = "x",
	insert = "i",
	command_line = "c",
	terminal = "t",
}

local nmap = function(keys, func)
	vim.keymap.set("n", keys, func)
end

local vmap = function(keys, func)
	vim.keymap.set("v", keys, func)
end

vim.g.mapleader = " "

-- Save buffer
vim.keymap.set(modes.normal, "<leader>w", "<cmd>:w<CR>")

-- Move lines
vim.keymap.set(modes.visual_select, "J", ":m '>+1<CR>gv=gv")
vim.keymap.set(modes.visual_select, "K", ":m '<-2<CR>gv=gv")

-- imap("jk", "<esc>")
vim.keymap.set(modes.insert, "jk", "<esc>")

-- Center buffer
nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")

nmap("<leader>y", [["+y]])
vmap("<leader>y", [["+y]])
nmap("<leader>Y", [["+Y]])

return modes
