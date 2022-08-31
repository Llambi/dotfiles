" Install vim-plug if it not exists.

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Theme
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

Plug 'editorconfig/editorconfig-vim', { 'as': 'editor-config' }
Plug 'haya14busa/incsearch.vim', { 'as': 'highlight-search'  }

call plug#end()

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:lightline = {'colorscheme': 'catppuccin_latte'}

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
