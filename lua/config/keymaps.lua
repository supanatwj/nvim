local map = vim.keymap.set

map("n", "<leader>e" , vim.cmd.Ex)

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })


--[[
-- floating terminal
map("n", "<leader>fT", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
map("n", "<leader>ft", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
map({"n","t"}, "<c-/>",function() Snacks.terminal.focus(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
map({"n","t"}, "<c-_>",function() Snacks.terminal.focus(nil, { cwd = LazyVim.root() }) end, { desc = "which_key_ignore" })
]]--

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })


-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>uI", function() vim.treesitter.inspect_tree() vim.api.nvim_input("I") end, { desc = "Inspect Tree" })

-- telescop
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

--auto close bracket
-- map("i", "(", "()<left>")
-- map("i", "[", "[]<left>")
-- map("i", "{", "{}<left>")

-- Helper function to check if the cursor is between a pair
local function delete_pair()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  -- Get the character before and after the cursor
  local char_before = string.sub(line, col, col)
  local char_after = string.sub(line, col + 1, col + 1)
  -- Define pairs to check against
  local pairs = {
    ['{'] = '}',
    ['['] = ']',
    ['('] = ')',
  }
  -- If cursor is between a matching pair, delete both
  if pairs[char_before] == char_after then
    return "<BS><Del>"
  else
    return "<BS>"
  end
end

-- Map the Backspace key in insert mode using an expression map
map("i", "<BS>", delete_pair, { expr = true, noremap = true })

--commit toggle
map("n","<C-/>", "gcc", { remap = true, desc = "Toggle comment"})
map("v","<C-/>", "gc", { remap = true, desc = "Toggle comment"})

--change multiple word
map("", "<leader>r", "\"hy:%s/<C-r>h//g<left><left>")
