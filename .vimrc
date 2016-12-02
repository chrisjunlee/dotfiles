" ================ About =============================
" .vimrc file of Chris Lee, an ascetic minimalist 

" ================ General Config ====================
set nocompatible
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set smartcase
filetype off
set autoindent

" allow bashrc alias usage in vim shell
set shellcmdflag=-ic

" ================ Visual Sugar ======================
syntax on
set number

" display tab completion
set wildmode=list:longest
set wildmenu

" highlight search results
set hlsearch

" ================ Status Bar ========================
set statusline=%-f%=%l,%v
set laststatus=2
highlight StatusLine term=bold cterm=bold gui=bold

" ================ Mappings ==========================
nnoremap ; :
nnoremap zz ZZ

" disable Ex mode
nnoremap Q <nop>

" ctrl-s save
nnoremap <C-s> :w<cr>
inoremap <C-s> <esc>:w<cr>l

" sudo save
cmap w!! w !sudo tee > /dev/null %

" quick-exit. trade-off: q register
nnoremap <silent>qq :q!<cr>

" ================ Leader Mappings ===================
" NB: chain commands with \| or <bar>
let mapleader = "\<Space>"
nnoremap <leader>num :set number!<cr>
nnoremap <leader>np :set nopaste <cr>
nnoremap <leader>p :set paste <bar> startinsert <cr>
nnoremap <silent><leader>rr :source $MYVIMRC <cr>
nnoremap <silent><leader>h :nohlsearch<cr><esc>
nnoremap <silent><leader>w :set wrap!<cr>

" ================ Functions =========================

" ================ Macros ============================
" # header
let @s='O60i#yyjpj'

" ================ Autocmds ==========================
" jump to previous edit cursor
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" css indent 
autocmd FileType css setlocal shiftwidth=2 tabstop=2

" ================ Vundle Sugar ======================
set rtp+=~/.vim/bundle/Vundle.vim
filetype plugin indent on

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'surround.vim'
Plugin 'repeat.vim'
Plugin 'pangloss/vim-javascript'
""Plugin 'vim-flake8'
call vundle#end()

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_filetype_whitelist = {'cpp': 1, 'c': 1, 'python':1}
let python_highlight_all=1
"autocmd BufWritePost *.py call Flake8()
