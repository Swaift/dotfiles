if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

set nocompatible
set ttimeoutlen=100
set backspace=indent,eol,start
set foldmethod=indent
set nofoldenable
set cursorline
set cursorcolumn
autocmd BufRead,BufNew *.md set filetype=markdown
filetype plugin indent on

set visualbell
set t_vb=

autocmd FileType tex setlocal shiftwidth=4 tabstop=4
autocmd FileType html setlocal shiftwidth=2 tabstop=2

"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
let g:ycm_confirm_extra_conf = 0

let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_StartMessages = 0

let g:syntastic_cpp_compiler_options = '-std=c++11'

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'terryma/vim-multiple-cursors'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'haya14busa/incsearch.vim'
"Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'nelstrom/vim-markdown-folding'

call vundle#end()
filetype plugin indent on

let g:syntastic_mode_map = {'mode':'active', 'active_filetypes':[], 'passive_filetypes':['java']}
nnoremap <c-w>E :SyntasticToggleMode<cr>

let g:markdown_fenced_languages = ['c', 'cpp', 'java']

autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"autocmd vimenter * NERDTree
autocmd vimenter * wincmd p

"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

let g:airline#extensions#tabline#enabled = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let mapleader = ','

set laststatus=2

set ruler
set number
set ai
set smarttab
set expandtab
set cindent
set ts=4
set sw=4
set hlsearch
set ignorecase
set smartcase
syntax on

"execute pathogen#infect()

let g:solarized_bold=0
let g:solarized_termcolors=256
colorscheme gruvbox
set bg=dark
let g:airline_theme='gruvbox'

highlight Normal             ctermbg=NONE
highlight NonText            ctermbg=NONE
highlight LineNr             ctermbg=NONE
highlight SignifyLineAdd     ctermbg=NONE
highlight SignifyLineDelete  ctermbg=NONE
highlight SignifyLineChange  ctermbg=NONE
highlight SignifySignAdd     ctermbg=NONE
highlight SignifySignDelete  ctermbg=NONE
highlight SignifySignChange  ctermbg=NONE
highlight SignColumn         ctermbg=NONE
highlight CursorLine         ctermbg=NONE
highlight Folded             ctermbg=NONE
highlight FoldColumn         ctermbg=NONE
highlight NonText            ctermbg=NONE
highlight clear LineNr

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

map J 8j
map K 8k
map L 8l
map H 8h

noremap <F12> <Esc>:syntax sync fromstart<CR>

set wmh=0
set splitbelow
set splitright

command P !pdflatex *.tex

highlight Comment gui=italic
highlight Comment cterm=italic
set t_ZH=[3m
set t_ZR=[23m

