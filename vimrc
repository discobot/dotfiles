let g:solarized_termcolors=16
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/powerline/bindings/vim
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'dantler/vim-alternate'
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/Tagbar'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'ervandew/supertab'
Bundle 'davidhalter/jedi-vim'

syntax enable 
set t_Co=256
colorscheme solarized
set background=dark
set encoding=utf-8 
set laststatus=2
set noshowmode
set mouse=a 

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

set term=xterm

set wildmode=longest,list,full
set wildmenu

filetype plugin indent on
set number
set wrap
set ruler
set cursorline

set tabstop=4

let mapleader=","

noremap <leader>o <Esc>:CtrlP<CR>
noremap <leader>l <Esc>:CtrlPTag<CR>
noremap <leader>t <Esc>:NERDTree<CR>
noremap <leader>k <Esc>:TagbarOpenAutoClose<CR>

set tags=./tags,tags;$HOME
autocmd BufWritePost,FileWritePost *.js silent! !jsctags . &
set backspace=indent,eol,start

set hlsearch

set autoindent
"set expandtab
set softtabstop=2
set shiftwidth=2

let g:tagbar_sort = 0
set t_Co=256

let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'solarized256'

