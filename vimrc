execute pathogen#infect()

set expandtab
set tabstop=4
set shiftwidth=4
set number
set cursorline
set hidden

syntax on
syntax enable

filetype plugin indent on

colorscheme monokai
if has("gui_running")
    " set background=dark
    " colorscheme solarized
    " let g:solarized_termcolors=256

    if has("gui_gtk2")
        set guifont=Inconsolata\ 12
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
        set guifont=Consolas:h14:cANSI
    endif
endif

set t_Co=256

function! FormatJSON()
    :'<,'>!python -m json.tool
endfunction
command! -range FormatJSON call FormatJSON()
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

let mapleader = "\<Space>"

noremap <C-n> :call NumberToggle()<CR>
noremap <leader>d :bp\|bd #<CR>
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
map <C-e> :NERDTreeToggle<CR>

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

nnoremap <CR> G
nnoremap <BS> gg

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

 " Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Move down to next row when lines wrap
nnoremap j gj
nnoremap k gk

" Remove trailling whitespace on :w
autocmd BufWritePre * :%s/\s\+$//e

vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

let g:jsx_ext_required = 0
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

let g:syntastic_javascript_checkers = ['jshint']

let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|tmp\|git'
let g:mustache_abbreviations = 1

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

set directory=~/.vim/_tmp/
set backupdir=~/.vim/backup/

runtime! plugin/sensible.vim
