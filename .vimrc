
" to work on any bash like xonsh
set shell=/usr/bin/bash

call plug#begin('~/.vim/plugged')

Plug 'chrisbra/csv.vim'

"autocomplete language servers
Plug 'neoclide/coc.nvim', { 'do': { -> coc#util#install() } }

"fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Grep search
Plug 'wookayin/fzf-ripgrep.vim'

"status bottom line
Plug 'itchyny/lightline.vim'

"File Tree
Plug 'preservim/nerdtree'

"colorfull brackets and parenthesis matching
Plug 'frazrepo/vim-rainbow'

"easy commenter
Plug 'preservim/nerdcommenter'

"insert brackts automatically
Plug 'jiangmiao/auto-pairs'

"floating terminal
Plug 'voldikss/vim-floaterm'

"better syntax highlight
Plug 'sheerun/vim-polyglot'

call plug#end()

"navigate tabs with shift+left shift+right
nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
            \ execute 'NERDTree' argv()[0] | wincmd p | enew | endif

" Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"F2 toggle NERDTree open/close
nnoremap <Home> :NERDTreeToggle<CR>

"ctrl t as terminal toggle
noremap  <C-T>  :FloatermToggle<CR>
noremap! <C-T>  <Esc>:FloatermToggle<CR>
tnoremap <C-T>  <C-\><C-n>:FloatermToggle<CR>

"fzf remap for file search
nnoremap <C-F> :BLines<CR>

"goto definition
nnoremap <C-D> :call CocAction('jumpDefinition')<CR>

"rename symbol
nmap <leader>rn <Plug>(coc-rename)

"ctrl+/ toggle comment lines
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

"allow mouse input
set mouse=a

let g:NERDTreeWinSize=45

"Set the colorscheme (installed in .vim dir)
"colorscheme atom-dark-256
colorscheme monokai

"turn on syntax highlight
"set nocompatible
syntax enable
"filetype detection
filetype plugin indent on
set termguicolors
