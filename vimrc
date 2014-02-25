let g:solarized_termcolors=16
set nocompatible
filetype off


if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

set rtp+=~/.vim/bundle/vundle/

NeoBundle 'ervandew/supertab'
NeoBundle 'johnsyweb/vim-makeshift.git'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'vim-scripts/AutoComplPop'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'dantler/vim-alternate'
NeoBundle 'gmarik/vundle'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-scripts/Tagbar'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'rhysd/vim-clang-format'
NeoBundle 'benmills/vimux'

"Color themes
NeoBundle 'zeis/vim-kolor'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
NeoBundle 'chriskempson/base16-vim'


"Do i realy need this?
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'fs111/pydoc.vim'

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
set guifont="Source Code Pro for Powerline":h12
set cc=80
set lazyredraw
set showmatch


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

" Make a simple search text object s
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" Tabs
set autoindent
"set noexpandtab
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

"Tagbar
let g:tagbar_sort = 0

"Airline
"let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts=1

"For t_Co bug inside solarized
set t_Co=256

let g:syntastic_cpp_checkers=['cpplint']

" Every buffer in new Tabs
":au BufAdd,BufNewFile,BufRead * nested tab sball

" Clang format
autocmd FileType c,cpp,objc map <buffer><Leader>x  <Plug>(operator-clang-format))
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

"let g:clang_format#code_style='llvm'
let g:clang_format#style_options = {
			\ "AccessModifierOffset" : -4,
            \ "IndentWidth" : 4,
            \ "TabWidth" : 4,
            \ "Standard" : "C++11",
            \ "UseTab" : "true",
			\ "AllowShortLoopsOnASingleLine" : "false",
			\ "BreakBeforeBraces": "Attach",
			\ "BinPackParameters": "true"}

