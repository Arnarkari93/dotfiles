syntax on
set background=dark
let g:github_colors_block_diffmark = 0
colorscheme gruvbox
" colorscheme github
" colorscheme pink-moon

nnoremap <leader>ss :<C-u>call SetTheme()<cr>

function! SetTheme()
  if &background ==# "dark"
    set background=light
    let g:github_colors_soft = 1
    let g:github_colors_block_diffmark = 0
    colorscheme github
  else
    set background=dark
    colorscheme gruvbox
  endif
endfunction


set autoindent
set autoread
set backspace=eol,start,indent
set conceallevel=0
set clipboard=unnamed
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set hidden
set history=10000
set hlsearch
set ignorecase
set lazyredraw
set lcs=trail:·,tab:»·
set mouse=a
set nolist
set notimeout
set number
set numberwidth=4
" increment and decrement with C-a C-x
set nrformats="bin,octal,hex,alpha"
set relativenumber
set scrolloff=5
set shiftwidth=2
set showmatch
set smartcase
set softtabstop=2
set splitbelow
set splitright
set pyx=3
set tabstop=2
set termguicolors
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore+=*/node_modules/*
set wildmenu
set wrap


set nocompatible
filetype plugin on
set laststatus=2

if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif 

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:neoterm_default_mod='vertical'
let g:neoterm_autoscroll=1
let g:neoterm_autoinsert=1

let g:indentLine_setConceal = 0
" default ''.
" n for Normal mode
" v for Visual mode
" i for Insert mode
" c for Command line editing, for 'incsearch'
let g:indentLine_concealcursor = ""

" format on save
command! -nargs=0 Prettier :CocCommand prettier.formatFile
set rtp+=/usr/local/opt/fzf
