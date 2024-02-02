local opts = { noremap = true, silent = false }

-- local term_opts = { silent = true }

---- shorten function name
local keymap = vim.api.nvim_set_keymap

local function nkeymap(key, map, customOpts)
  if customOpts then
    keymap("n", key, map, customOpts)
  else
    keymap("n", key, map, opts)
  end
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- NORMAL MODE --
-- Window navigation
for i=0,9,1
do
  keymap("n", "<leader>" .. i, ":" .. i .. "wincmd w<CR>", opts)
end

nkeymap("<leader>w", "<C-w>")
nkeymap("<leader>wsh", ":sp<cr>")
nkeymap("<leader><Tab>", "<C-w><C-w>")

keymap("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<cr>", opts)

keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- save
keymap("n", "<leader>fs", ":w <cr>", opts)

keymap("n", "<leader>fer", ":luafile $MYVIMRC<cr>", opts)
keymap("n", "<leader>fee", ":vsplit $MYVIMRC<cr>", opts)

-- Behave vim Y
keymap("n", "Y", "y$", opts)

-- Terminal
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- search
keymap("n", "n", "nzzzv", opts) -- keep search results centered
keymap("n", "N", "Nzzzv", opts) -- keep search results centered
keymap("n", "J", "mzJ`z", opts) -- keep search results centered
keymap("n", "<leader>sn", ":noh<cr>", opts)

keymap("n", "C-d", "C-dzz", opts)
keymap("n", "C-u", "C-uzz", opts)

-- search and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- VISUAL --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)

