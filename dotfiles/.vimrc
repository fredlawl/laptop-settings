unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

set nocompatible

inoremap jj <ESC>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set termguicolors
set bg=dark
set t_Co=256
" colorscheme simplifysimplify-dark
colorscheme catppuccin_mocha
syntax enable

" Basic Settings
filetype indent plugin on

set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set number
set cursorline
set list
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set ruler
set showmode
set title
set nostartofline
set laststatus=2
set backspace=indent,eol,start
set visualbell
set scrolloff=3
set nowrap
set smartindent
set autoindent
set splitbelow
set splitright

" Set tabs to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

set spell spelllang=en_us

" Go here: http://vimdoc.sourceforge.net/htmldoc/spell.html to find all the
" related commands

"set mouse=a
"set notimeout ttimeout ttimeoutlen=200

syn on se title

if exists("&relativenumber")
    set relativenumber
    au BufReadPost * set relativenumber
endif

if has("autocmd")
    filetype on
    autocmd BufWritePre * :%s/\s\+$//e
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown textwidth=75
    autocmd BufNewFile,BufRead *.c,*.h,*.cpp,*.hpp setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab textwidth=75
endif

"set noeb vb t_vb=

" Fix colors by putting them at end of file :)
hi SpellBad cterm=underline ctermfg=red
" highlight NNormal SpecialKey ctermbg=none
