if &compatible
    set nocompatible
endif
set termguicolors
"set t_Co=256
"let g:ale_enabled = 1
"let g:ale_completion_enabled = 1
"let g:ale_go_bingo_executable = 'gopls'

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'raimondi/delimitmate'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
"Plug 'vim-scripts/VisIncr'
Plug 'terryma/vim-multiple-cursors'
"Plug 'w0rp/ale'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'tpope/vim-repeat'
Plug 'Konfekt/FastFold'
Plug 'Konfekt/FoldText'
Plug 'thaerkh/vim-workspace'
Plug 'mhinz/vim-signify'
Plug 'bronson/vim-trailing-whitespace'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-surround'
Plug 'Chiel92/vim-autoformat'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ 'go': ['/Users/yanzhou3/go/bin/gopls']
    \ }
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

set background=dark

let g:onedark_terminal_italics=1
colorscheme onedark

nnoremap <C-p> :FZF<CR>

let g:lightline = {'colorscheme': 'onedark'}

"map  <leader>f <Plug>(easymotion-bd-f)
"nmap <leader>f <Plug>(easymotion-overwin-f)
"nmap s <Plug>(easymotion-overwin-f2)

let g:workspace_session_directory = $HOME . '/.local/share/nvim/sessions/'
let g:workspace_session_disable_on_args = 1
let g:workspace_autosave = 0
let g:workspace_undodir=$HOME . '/.local/share/nvim/undodir/'

let g:deoplete#auto_complete_delay = 100
let g:deoplete#enable_at_startup = 1

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

nmap <silent> <C-b> <Plug>(ale_previous_wrap)
nmap <silent> <C-f> <Plug>(ale_next_wrap)

"if executable('pyls')
    "au User lsp_setup call lsp#register_server({
        "\ 'name': 'pyls',
        "\ 'cmd': {server_info->['pyls']},
        "\ 'whitelist': ['python'],
        "\ })
"endif

"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
"set binary

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=' '

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set ignorecase
set smartcase
set nowrapscan

"" Folding
set foldenable
set foldlevelstart=1
"set foldnestmax=6
set foldmethod=syntax
nnoremap <return> za

"" Movement
"nnoremap j gj
"nnoremap k gk
"inoremap jk <esc>
"
set complete-=t   " disable searching tags

"set iskeyword-=_

"" Directories for swp files
set nobackup
set noswapfile

set shellcmdflag=-ic

"set fileformats=dos,unix,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
set number
set showcmd
set nowrap
"set relativenumber
"set cursorline
set lazyredraw
set showmatch

set synmaxcol=200
"syntax sync minlines=256

"let no_buffers_menu=1

set mousemodel=popup
set mouse=a
"

"" Disable the blinking cursor.
set gcr=a:blinkon0

"" Use modeline overrides
"set modeline
"set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
"nnoremap n nzzzv
"nnoremap N Nzzzv

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
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

" terminal emulation
"nnoremap <silent> <leader>t :terminal<CR>
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-v><Esc> <Esc>
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
"augroup vimrc-sync-fromstart
"autocmd!
"autocmd BufEnter * :syntax sync maxlines=200
"augroup END

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
set splitbelow
set splitright
noremap _ :<C-u>split<CR>
noremap \| :<C-u>vsplit<CR>

nnoremap <silent> <leader>bb :Buffers<CR>
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <silent> <leader>bc :new<CR>

nnoremap <silent> <leader>wt :ToggleWorkspace<CR>

"" Copy/Paste/Cut
set clipboard=unnamedplus

"" Tabs
nnoremap <C-[> gt
nnoremap <C-]> gT
nnoremap <C-t> :tabnew<CR>

cnoremap <c-n>  <down>
cnoremap <c-p>  <up>

nnoremap <leader><space> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
