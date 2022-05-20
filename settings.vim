syntax on
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
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


set backspace=eol,start,indent
set conceallevel=0
set cursorline
set clipboard=unnamed
set expandtab
set fileencoding=utf-8
set ignorecase
set lazyredraw
set laststatus=3 " global statusline
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
set wrap

filetype plugin on

" This was causing problems
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns space before line numbers
set signcolumn=auto

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

" Line indent display
let g:indentLine_setConceal = 1
let g:indentLine_concealcursor = "inc"
let g:indentLine_conceallevel = 2
let g:indentLine_fileType = ['typescript', 'typescriptreact', 'javascript', 'json']
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16'
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 20,
    \ 'x': 60,
    \ 'y': 5,
    \ 'z': 5,
    \ 'warning': 80,
    \ 'error': 80,
    \ }
"  airline default sections
"   let g:airline_section_a       (mode, crypt, paste, spell, iminsert)
"  let g:airline_section_b       (hunks, branch)[*]
"  let g:airline_section_c       (bufferline or filename, readonly)
"  let g:airline_section_gutter  (csv)
"  let g:airline_section_x       (tagbar, filetype, virtualenv)
"  let g:airline_section_y       (fileencoding, fileformat, 'bom', 'eol')
"  let g:airline_section_z       (percentage, line number, column number)
"  let g:airline_section_error   (ycm_error_count, syntastic-err, eclim,
"                                 languageclient_error_count)
"  let g:airline_section_warning (ycm_warning_count, syntastic-warn,
"                                 languageclient_warning_count, whitespace)


" format on save
command! -nargs=0 Prettier :CocCommand prettier.formatFile
set rtp+=/usr/local/opt/fzf

" copilot
let g:copilot_no_tab_map=1

