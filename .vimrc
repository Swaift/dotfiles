if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

"let g:Powerline_symbols = 'fancy'
set encoding=utf-8
"let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''


set nocompatible
set ttimeoutlen=100
set backspace=indent,eol,start
set foldmethod=indent
set nofoldenable
set cursorline
set hidden
"set cursorcolumn
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
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'haya14busa/incsearch.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'vim-scripts/Conque-GDB'
Plugin 'nelstrom/vim-markdown-folding'
"Plugin 'easymotion/vim-easymotion'
Plugin 'morhetz/gruvbox'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

call vundle#end()
filetype plugin indent on

let g:syntastic_mode_map = {'mode':'active', 'active_filetypes':[], 'passive_filetypes':['java','asm']}
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
let g:airline#extensions#tabline#close_symbol = 0

"set statusline+=%#warningmsg#
"set statusline+=%{syntasticstatuslineflag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
set noshowmode
syntax on

set background=dark
colorscheme gruvbox
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
"highlight clear LineNr
highlight VertSplit          ctermbg=NONE

"set fillchars=vert:\│
set fillchars=vert:\│,stl:\_,stlnc:\_

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

noremap M J
noremap J 8j
noremap K 8k
noremap L 8l
noremap H 8h
nnoremap Y y$

noremap <F12> <Esc>:syntax sync fromstart<CR>

set wmh=0
set splitbelow
set splitright

command! P !pdflatex *.tex

highlight Comment gui=italic
highlight Comment cterm=italic
set t_ZH=[3m
set t_ZR=[23m

let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>v V
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" Ctrl P
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Buffergator
let g:buffergator_suppress_keymaps = 1
let g:buffergator_viewport_split_policy = 'R'
nmap <leader>j :bnext<cr>
nmap <leader>k :bprevious<cr>
nmap <leader>b :BuffergatorOpen<cr>
nmap <leader>t :enew<cr>
"nmap <leader>d :bp <BAR> bd #<cr>

augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
    autocmd bufwritepost .vimrc :AirlineRefresh
augroup END

" w : forward to next word beginning with alphanumeric char
" b : backward to prev word beginning with alphanumeric char
function! <SID>GotoPattern(pattern, dir) range
    let g:_saved_search_reg = @/
    let l:flags = "We"
    if a:dir == "b"
        let l:flags .= "b"
    endif
    for i in range(v:count1)
        call search(a:pattern, l:flags)
    endfor
    let @/ = g:_saved_search_reg
endfunction
nnoremap <silent> w :<C-U>call <SID>GotoPattern('\(^\\|\<\)[A-Za-z0-9_]', 'f')<CR>
vnoremap <silent> w :<C-U>let g:_saved_search_reg=@/<CR>gv/\(^\\|\<\)[A-Za-z0-9_]<CR>:<C-U>let @/=g:_saved_search_reg<CR>gv
nnoremap <silent> b :<C-U>call <SID>GotoPattern('\(^\\|\<\)[A-Za-z0-9_]', 'b')<CR>
vnoremap <silent> b :<C-U>let g:_saved_search_reg=@/<CR>gv?\(^\\|\<\)[A-Za-z0-9_]<CR>:<C-U>let @/=g:_saved_search_reg<CR>gv
