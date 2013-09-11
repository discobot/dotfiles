let g:solarized_termcolors=16
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/powerline/bindings/vim
call vundle#rc()

"Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
"Bundle 'jcf/vim-latex'
Bundle 'johnsyweb/vim-makeshift.git'
"Bundle 'orenhe/pylint.vim'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Raimondi/delimitMate'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'dantler/vim-alternate'
Bundle 'fs111/pydoc.vim'
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'localvimrc'
Bundle 'log.vim'
Bundle 'mileszs/ack.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/Tagbar'

"Interface colors
syntax enable 
let python_highlight_all = 1
set t_Co=256
colorscheme solarized
set background=light

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
set noantialias
set guifont=PragmataPro:h11
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
"let g:EasyMotion_leader_key = '<Leader>'

"What is this?
set tags=./tags,tags;$HOME
autocmd BufWritePost,FileWritePost *.js silent! !jsctags . &
set backspace=indent,eol,start

" Search 
set hlsearch
set incsearch
set ignorecase
set smartcase

" Make a simple search text object s
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" Tabs
set autoindent
set noexpandtab
set tabstop=4
"set expandtab
set softtabstop=4
set shiftwidth=4

"Tagbar
let g:tagbar_sort = 0

"Powerline 
"let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'solarized256'

"For t_Co bug inside solarized
set t_Co=256

let g:syntastic_cpp_checkers=['cpplint']
