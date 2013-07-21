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
"Bundle 'jcf/vim-latex'
"Bundle 'vim-scripts/AutoComplPop'
Bundle 'ervandew/supertab'
Bundle 'davidhalter/jedi-vim'
Bundle 'fs111/pydoc.vim'
Bundle 'orenhe/pylint.vim'
Bundle 'johnsyweb/vim-makeshift.git'
Bundle 'log.vim'

"Interface colors
syntax enable 
let python_highlight_all = 1
set t_Co=256
colorscheme solarized
set background=dark

"Interface tune
set encoding=utf-8 
set laststatus=2
set noshowmode
set term=xterm
set mouse=a
set ttymouse=xterm2
set number
set wrap
set ruler
set cursorline
set cc=80


autocmd FileType python compiler pylint
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }


set wildmode=longest,list,full
set wildmenu


filetype plugin indent on

"Hotkeys
let mapleader=","
noremap <leader>o <Esc>:CtrlP<CR>
noremap <leader>l <Esc>:CtrlPTag<CR>
noremap <leader>t <Esc>:NERDTree<CR>
noremap <leader>k <Esc>:TagbarOpenAutoClose<CR>


"What is this?
set tags=./tags,tags;$HOME
autocmd BufWritePost,FileWritePost *.js silent! !jsctags . &
set backspace=indent,eol,start

" Search 
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tabs
set autoindent
set expandtab
"set noexpandtab
set tabstop
set softtabstop=4
set shiftwidth=4

"Tagbar
let g:tagbar_sort = 0

"Powerline 
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'solarized256'

"For t_Co bug inside solarized
set t_Co=256
