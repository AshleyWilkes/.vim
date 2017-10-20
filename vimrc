let mapleader="\<Space>"

"Vundle configuration and start {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-unimpaired'

Plugin 'tpope/vim-vinegar'

Plugin 'vim-scripts/Conque-GDB'

"run :PluginInstall to install newly added plugin!

call vundle#end()
filetype plugin indent on
"}}}

"search defaults {{{
set incsearch hlsearch
"}}}

"tab defaults {{{
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
"}}}

"leave some lines above/below cursor when close to top or bottom of the page{{{
set scrolloff=3
"}}}

"autoindent {{{
set autoindent
"}}}

"edit and source local vimrc {{{
autocmd FileType vim setlocal foldmethod=marker
"   make it easy to edit local vimrc {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
augroup groupname
    autocmd!
    autocmd BufWritePost $MYVIMRC :execute "normal! :source\ $MYVIMRC\<cr>"
augroup end
"   }}}
"}}}

"make first and last characters on a line more accessible {{{
nnoremap <leader>h ^
nnoremap <leader>l $
"enforce first and last characters shortcuts
nnoremap ^ <nop>
nnoremap $ <nop>
"}}}

"enforce hjkl instead of arrow keys {{{
nnoremap <Left> <nop>
nnoremap <Down> <nop>
nnoremap <Up> <nop>
nnoremap <Right> <nop>
"}}}

"enter normal mode from insert mode with kj {{{
inoremap kj <Esc>
inoremap <Esc> <nop>
"}}}

"change working directory to that of the current file with <leader>cd {{{
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
"}}}

"fugitive {{{
autocmd User fugitive if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \ nnoremap <buffer> gu :edit %:h<CR> | endif
"}}}

"ConqueGdb {{{
let g:ConqueGdb_SrcSplit = 'left'
"}}}

"typescript {{{
autocmd FileType typescript :set foldcolumn=4
autocmd FileType typescript :set foldmethod=indent
autocmd FileType typescript :set shiftwidth=2
autocmd FileType typescript :set foldlevel=1
"}}}

"journey_planner csa log settings {{{
"}}}
