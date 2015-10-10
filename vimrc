let g:solarized_termcolors=16
set nocompatible
filetype off


if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

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
NeoBundle 'vim-scripts/AutoComplPop'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'dantler/vim-alternate'
NeoBundle 'gmarik/vundle'
NeoBundle 'rking/ag.vim'
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
NeoBundle 'bling/vim-bufferline'
NeoBundle 'autotag'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'fisadev/vim-isort'

NeoBundle 'Valloric/YouCompleteMe'

"Color themes
NeoBundle 'zeis/vim-kolor'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'tomasr/molokai'
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'abra/vim-abra'


"Do i realy need this?
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'fs111/pydoc.vim'

call neobundle#end()

"Interface colors
syntax enable
let python_highlight_all = 1
"set t_Co=16
let g:solarized_italic=1
let g:hybrid_use_iTerm_colors = 1

"Disable Bells
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

colorscheme solarized
"colorscheme ron
"colorscheme abra
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
set guifont=Sauce\ Code\ Powerline/13/-1/5/25/0/0/0/1/0
=======
set cursorline
"set cc=80
set lazyredraw
set showmatch


"autocmd FileType python compiler pylint
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }


set wildmode=longest,list,full
set wildmenu


filetype plugin indent on

"Hotkeys
let mapleader="\<Space>"
noremap <leader>o <Esc>:CtrlP<CR>
noremap <leader>l <Esc>:CtrlPTag<CR>
noremap <leader>t <Esc>:NERDTree<CR>
noremap <leader>k <Esc>:TagbarOpenAutoClose<CR>
map <Leader> <Plug>(easymotion-prefix)
map s <Plug>(easymotion-bd-w)

"What is this?
set tags=./tags,tags;$HOME
autocmd BufWritePost,FileWritePost *.js silent! !jsctags . &
set backspace=indent,eol,start

nnoremap <Leader>w :wa<CR>

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
set expandtab
set tabstop=4
"set expandtab
set softtabstop=4
set shiftwidth=4

"Tagbar
let g:tagbar_sort = 0

"Airline
"let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts=1

"For t_Co bug inside solarized
set t_Co=16

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
            \ "UseTab" : "false",
			\ "AllowShortLoopsOnASingleLine" : "false",
			\ "BreakBeforeBraces": "Attach",
			\ "BinPackParameters": "true"}

let g:airline_theme='bubblegum'


"expand region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
