 call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-commentary'
  Plug 'vim-scripts/ReplaceWithRegister'
  Plug 'easymotion/vim-easymotion'

  " Fuzy finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'luochen1990/rainbow' " -> Bracket colors
  Plug 'kassio/neoterm'
  Plug 'tpope/vim-fugitive' " -> git
  Plug 'chrisbra/Colorizer' " -> hex colors
  Plug 'jparise/vim-graphql'
  Plug 'bronson/vim-visual-star-search'
  "
  " color schemes
  Plug 'gruvbox-community/gruvbox'
  Plug 'sts10/vim-pink-moon'
  Plug 'cormacrelf/vim-colors-github'

  " Language server
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'github/copilot.vim' " -> AI autocomplete

  Plug  'Yggdroot/indentLine'
call plug#end()

" COC.vim begin
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

let g:WorkspaceFolders = [
 \ '/Users/arnar/dev/island.is/apps/judicial-system/web',
 \ '/Users/arnar/dev/island.is/apps/judicial-system/backend',
 \ '/Users/arnar/dev/island.is/apps/judicial-system/api',
 \ '/Users/arnar/dev/island.is/apps/judicial-system/web-e2e',
 \ '/Users/arnar/dev/island.is/libs/judicial-system/consts',
 \ '/Users/arnar/dev/island.is/libs/judicial-system/types',
 \ ]
