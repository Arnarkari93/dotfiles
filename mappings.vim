
let mapleader = " "
let maplocalleader = ","

map <Leader>vr :source ~/.vimrc<cr>
map <Leader>e :Sexplore<cr>
map <Leader>w <C-w><cr>

" Remap keys for gotos
nmap <silent> ,gg <Plug>(coc-definition)
nmap <silent> ,gt <Plug>(coc-type-definition)
nmap <silent> ,gi <Plug>(coc-implementation)
nmap <silent> ,gr <Plug>(coc-references)
nmap <silent> ,gn <Plug>(coc-rename)
nmap <silent> ,gf <Plug>(coc-fix-current)
command! -nargs=0 Format :call CocAction('format')
nmap <leader>fr :Format<CR>
" Use K to show documentation in preview window
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>
nmap <silent> <leader>en <Plug>(coc-diagnostic-next)
nmap <silent> <leader>eN <Plug>(coc-diagnostic-prev)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" restart coc
nnoremap <silent> <leader>rr :CocRestart<CR>

" buffers 
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
" delete buttfer
nnoremap <leader>bd :bdelete<cr> 
nnoremap <leader><Tab> <C-w><C-w><CR>

" fzf.vim
nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <leader>gs :GFiles?<CR>
nnoremap <silent> <leader>sb :Buffers<CR>
nnoremap <silent> <leader>sl :BLines<CR>
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
" fzf.vim end\

xnoremap <Tab> >gv
xnoremap <S-Tab> <gv

" search selected word in project
nnoremap <Leader>fw :Rg <C-R><C-W>

nnoremap <Leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <Leader>w <C-w>
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>c :
nnoremap B ^
nnoremap <leader>sn :noh<cr>

" vimrc
nnoremap <leader>fee :vsplit $MYVIMRC<cr>
nnoremap <leader>fer :source $MYVIMRC<cr>
nnoremap <leader>fes :source $MYVIMRC<cr>
"
" yarn commands
nnoremap <leader>br :T yarn relay<cr>
nnoremap <leader>bb :T yarn build<cr>
nnoremap <leader>bc :T yarn build-clean<cr>
nnoremap <leader>bt :<C-u>call RunTestFile()<cr>
nnoremap <leader>bT :T yarn test<cr>
nnoremap <leader>by :T yarn<cr>

nnoremap <leader>gt :<C-u>call GoToTestFile()<cr>
function! GoToTestFile()
  let file=expand("%:r")
  execute ":edit " . file."_test.re"
endfunction

function! RunTestFile()
  let file=expand("%:r")
  let extention=expand("%:e")
  let ending=get(split(file, "_"), 1)
  if !empty(ending) && ending == "test" && extention == "re"
    execute ":T yarn test " . file.".bs.js"
  elseif extention == "re"
    execute ":T yarn test " . file."_test.bs.js"
  endif
endfunction

:tnoremap <Esc> <C-\><C-n>

" Execute macros over lines
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

" Move highlighted item up or down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

" Window mappings
nnoremap <leader>w0 <C-w>=<cr>
nnoremap <leader>w1 <C-w>o<cr>
nnoremap <leader>w2 <C-w>o<bar>:vsp<bar>:1wincmd w<cr>
nnoremap <leader>w3 <C-w>o<bar>:vsp<bar>:vsp<bar>:1wincmd w<cr>
nnoremap <leader>w4 <C-w>o<bar>:vsp<bar>:sp<bar>:1wincmd w<bar>:sp<bar>:1wincmd w<cr>
nnoremap <leader>wd <C-w>c<cr>
nnoremap <leader>we :resize +1<cr>
nnoremap <leader>wh :vertical resize -5<cr>
nnoremap <leader>wi :vertical resize +5<cr>
nnoremap <leader>wn :resize -1<cr>
nnoremap <leader>wo <C-w>o<cr>
nnoremap <leader>wsh :sp<cr>
nnoremap <leader>wsv :vsp<cr>
nnoremap <leader>wtc :tabclose<cr>
nnoremap <leader>wtn :tabnext<cr>
nnoremap <leader>wtp :tabprevious<cr>
nnoremap <leader>wtt :tabnew<cr>

" Git mappings
nnoremap <leader>ga :Git add .<cr>
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gp :Git pull<cr>
