call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'terryma/vim-multiple-cursors'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-repeat'
Plug 'Konfekt/FastFold'
Plug 'Konfekt/FoldText'
Plug 'thaerkh/vim-workspace'
Plug 'mhinz/vim-signify'
Plug 'bronson/vim-trailing-whitespace'
Plug 'joshdick/onedark.vim'
Plug 'machakann/vim-sandwich'
Plug 'Chiel92/vim-autoformat'
Plug 'ap/vim-buftabline'
"Plug 'autozimu/LanguageClient-neovim', {
    "\ 'branch': 'next',
    "\ 'do': 'bash install.sh',
    "\ }
Plug 'tpope/vim-vinegar'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/echodoc.vim'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
call plug#end()

if &compatible
    set nocompatible
endif
let mapleader="\<Space>"
set noshowmode
set background=dark
set termguicolors
set signcolumn=yes
"set foldnestmax=6
set foldmethod=syntax
set nofoldenable

set guifont=monospace:h11

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set nobomb
"set binary

set complete-=t   " disable searching tags
set nobackup
set noswapfile
"set shellcmdflag=-ic
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/bash
endif

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hidden

set hlsearch
set ignorecase
set smartcase
set nowrapscan

set number
set showcmd
set nowrap
"set relativenumber
autocmd InsertEnter,InsertLeave * set cul!
set lazyredraw
set showmatch

set synmaxcol=200
"let no_buffers_menu=1
"set mousemodel=popup
"set mouse=a
set title
set titleold="Terminal"
set titlestring=%F
set splitbelow
set splitright
set clipboard=unnamedplus

let g:ale_completion_enabled = 1
let g:ale_c_clangd_options = '--header-insertion=never'
let g:ale_lint_on_insert_leave = 1
"let g:LanguageClient_serverCommands = {
  "\ 'cc': ['clangd-9', '--header-insertion=never'],
  "\ 'cpp': ['clangd-9', '--header-insertion=never'],
  "\ 'hpp': ['clangd-9', '--header-insertion=never'],
  "\ 'c': ['clangd-9', '--header-insertion=never'],
  "\ 'h': ['clangd-9', '--header-insertion=never'],
  "\ }
"let g:echodoc#enable_at_startup = 1
"let g:echodoc#type = 'signature'
"let g:onedark_terminal_italics=1
"let g:deoplete#auto_complete_delay = 100
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', { '_': ['ale'] })


let g:workspace_session_directory = $HOME . '/.local/share/nvim/sessions/'
let g:workspace_session_disable_on_args = 1
let g:workspace_autosave = 0
let g:workspace_undodir=$HOME . '/.local/share/nvim/undodir/'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-v><Esc> <Esc>
endif

"" Remember cursor position
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

au TermOpen * setlocal nonumber norelativenumber

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap _ :<C-u>split<CR>
noremap \| :<C-u>vsplit<CR>

"" Copy/Paste/Cut

nnoremap <leader>B :enew<cr>
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>
"nnoremap <leader>bd :bp <bar> bd! #<cr>
nnoremap <leader>bd :bd<cr>
"cycle between last two open buffers
nnoremap <leader><leader> <c-^>

cnoremap <c-n> <down>
cnoremap <c-p> <up>

nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>jd :ALEGoToDefinition<CR>
nnoremap <leader>jfr :ALEFindReferences<CR>

nnoremap <C-p> :FZF<CR>
nnoremap <C-f> :Rg<CR>
nnoremap <C-Space> :Lines<CR>
nnoremap * *N
nnoremap <return> za
nnoremap <leader>w :w<cr>

nnoremap n nzzzv
nnoremap N Nzzzv

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev Bd bd
"nnoremap <silent> <leader>t :terminal<CR>
"
let g:onedark_terminal_italics = 1
let g:lightline = {'colorscheme': 'one'}
colorscheme onedark
