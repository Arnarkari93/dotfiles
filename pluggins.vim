 call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-commentary'
  Plug 'vim-scripts/ReplaceWithRegister'
  Plug 'easymotion/vim-easymotion'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'reasonml-editor/vim-reason-plus'
  Plug 'luochen1990/rainbow'
  Plug 'vim-airline/vim-airline'
  Plug 'kassio/neoterm'
  Plug 'tpope/vim-fugitive'
  Plug 'chrisbra/Colorizer'
  Plug 'jparise/vim-graphql'
  Plug 'amiralies/vim-rescript'
  Plug 'bronson/vim-visual-star-search'
  " color schemes
  Plug 'gruvbox-community/gruvbox'
  Plug 'sts10/vim-pink-moon'
  Plug 'cormacrelf/vim-colors-github'

	" for neovim
	if has('nvim')
		Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" for vim 8 with python
	else
	  Plug 'Shougo/deoplete.nvim'
	  Plug 'roxma/nvim-yarp'
	  Plug 'roxma/vim-hug-neovim-rpc'
	  " the path to python3 is obtained through executing `:echo exepath('python3')` in vim
	  let g:python3_host_prog = "/usr/local/bin/python3"
	endif

  Plug  'Yggdroot/indentLine'
call plug#end()

" COC.vim begin
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-reason', 
  \ ]

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

let g:WorkspaceFolders = [
 \ '/Users/arnar/gangverk/ws-monorepo/src/mobile/projects/mobile-app',
 \ '/Users/arnar/gangverk/ws-monorepo/src/solum/bidclient',
 \ '/Users/arnar/gangverk/ws-monorepo/src/solum/dls',
 \ '/Users/arnar/gangverk/ws-monorepo/src/typescript',
 \ ]
