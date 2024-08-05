-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- buffer management
keymap.set("n", "<leader>]", "<cmd>bn<cr>", { desc = "Move to next buffer" })
keymap.set("n", "<leader>[", "<cmd>bp<cr>", { desc = "Move to previous buffer" })
keymap.set("n", "<leader>x", "<cmd>bd<cr>", { desc = "Close buffer" })

-- Funzione globale per passare al buffer specificato nella finestra corrente
_G.switch_to_buffer = function(index)
	local buffers = vim.api.nvim_list_bufs()
	local valid_buffers = {}

	-- Crea una lista di buffer validi (caricati)
	for _, buf in ipairs(buffers) do
		if vim.api.nvim_buf_is_loaded(buf) then
			table.insert(valid_buffers, buf)
		end
	end

	if index > 0 and index <= #valid_buffers then
		vim.api.nvim_set_current_buf(valid_buffers[index])
	else
		print("Buffer " .. index .. " non esiste.")
	end
end

-- Mappa i numeri 1-9 a :lua switch_to_buffer(n)
for i = 1, 9 do
	vim.api.nvim_set_keymap(
		"n",
		"<leader>" .. tostring(i),
		":lua switch_to_buffer(" .. i .. ")<CR>",
		{ desc = "Move to buffer number " .. i, noremap = true, silent = true }
	)
end

-- Mappa il numero 0 a :lua switch_to_buffer(10) per accedere al 10° buffer
vim.api.nvim_set_keymap(
	"n",
	"<leader>0",
	":lua switch_to_buffer(10)<CR>",
	{ desc = "Move to buffer 10", noremap = true, silent = true }
)
