" Install vim-plug ,f it not exists.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim Plug
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Theme
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
" Editor Config
Plug 'editorconfig/editorconfig-vim', { 'as': 'editor-config' }
" Highlight Search
Plug 'haya14busa/incsearch.vim', { 'as': 'highlight-search'  }
" NerdTree
Plug 'preservim/nerdtree', { 'as': 'NerdTree' }

call plug#end()

" Theme
:colorscheme catppuccin_frappe
let g:lightline = {'colorscheme': 'catppuccin_frappe'}

" Enable filetype
filetype indent plugin on

" Config
let mapleader=","
set autoindent
set autowrite
set backspace=indent,eol,start
set encoding=utf-8
set fillchars+=vert:┃
set foldlevelstart=20
set foldmethod=indent
set history=1000
set laststatus=1
set nocompatible
set noshowmode
set noswapfile
set nowrap
set number
set relativenumber
set showmatch
set tags=tags
set textwidth=120
set undodir=~/.vim/undodir
set undofile
set wildmenu
set termguicolors

" Maps
" Search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Plug
map <leader>I :PlugInstall<CR>
map <leader>C :PlugClean<CR>

" Vim
map <leader>r :source $MYVIMRC<CR>
noremap <leader>w :w<CR>
noremap <leader>wq :wq<CR>
noremap <leader>q :q!<CR>

" NERDtree
map <Leader>nt :NERDTreeToggle<CR>
map <Leader>nf :NERDTreeFind<CR>
let NERDTreeQuitOnOpen=0
let NERDTreeWinSize=35
let NERDTreeCaseSensitiveSort=1
let NERDTreeWinPos = "left"

autocmd VimEnter * NERDTree | wincmd p

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
