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

"clear search highlights with <leader><space> {{{
nmap <leader><space> :nohlsearch<CR>
"}}}

"insert blank line with <leader>o/O {{{
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>
"}}}

"break a line at cursor without exiting normal mode with <space><Enter>{{{
nnoremap <leader><CR> i<CR><ESC>
"}}}

"split windows to the right {{{
set splitright
"}}}

"make splitting easier {{{
nmap <leader>vv <C-W>v-
nmap <leader>ss <C-W>s-
"}}}

"Sessions handling {{{
"where to save sessions
let g:session_dir = $HOME."/.vim/session"

"set session name
command! -nargs=1 SessionName let g:sessionname=<f-args>
command! SessionCleanSave :set sessionoptions=blank,buffers,curdir,tabpages

"save session when vim closes
autocmd VimLeave * call SaveSession()

"load session when vim opens
autocmd VimEnter * nested call OpenSession()

"Saves the session to session dir. Creates session dir if it doesn't exist.
"Sessions are named after servername parameter or g:sessionname
function! SaveSession()
  " get the server (session) name
  if exists("g:sessionname")
    let s = g:sessionname
  else
    let s = v:servername
  endif

  " create session dir if needed
  if !isdirectory(g:session_dir)
    call mkdir(g:session_dir, "p")
  endif

  " save session using server name
  execute "mksession! ".g:session_dir."/".s.".session.vim"
endfunc

"Open a saved session if there were no filenames passed as arguments
"The session opened is based on servername (session name). If there 
"is no session for this server, none will be opened
function! OpenSession()
  "check if filenames were passed as arguments
  if argc() == 0
    let sn = v:servername
    let file = g:session_dir."/".sn.".session.vim"

    "if session file exists, ask user if he wants to load it  
    if filereadable(file)
      if (confirm("Load last session?\n\n".file, "&Yes\n&No", 1) == 1)
        execute "source ".file
      endif
    endif

  endif
endfunc
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
