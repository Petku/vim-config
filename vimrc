set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Git 
Plugin 'tpope/vim-fugitive'

" Utilities
Plugin 'tmhedberg/SimpylFold' "Folding
Plugin 'vim-scripts/indentpython.vim' "Indent python
Plugin 'Valloric/YouCompleteMe' "Completer
Plugin 'vim-syntastic/syntastic' "Syntax checking
Plugin 'nvie/vim-flake8' "PEP8 checking syntax
Plugin 'scrooloose/nerdtree' "File browser
Plugin 'jistr/vim-nerdtree-tabs' "Nerd tree TABS
Plugin 'ctrlpvim/ctrlp.vim' "Super searching
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plugin 'python-rope/ropevim' " Refactoring for python
Plugin 'jiangmiao/auto-pairs' " Autoclose plugin

"Markdown
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'

"Theme / Interface
Plugin 'blueshirts/darcula'
Plugin 'morhetz/gruvbox'
Plugin 'jdsimcoe/abstract.vim'
Plugin 'ayu-theme/ayu-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" " see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Theme and Styling
syntax enable " enable syntax processing

"set background=dark
"colorscheme solarized
"colorscheme darcula " awesome colorscheme
"colorscheme gruvbox
"colorscheme abstract
set termguicolors     " enable true colors support
let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
colorscheme ayu

highlight Comment cterm=italic gui=italic


set t_Co=256
set guifont=DroidSansMono\ Nerd\ Font\ 11

if (has("termguicolors"))
  set termguicolors
endif

"Spaces & tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set autoindent      " New lines inherit the indentation of previous lines.
set shiftwidth=4    " Indent 4 spaces

"UI Config
set splitbelow          " opens new buffer below current
set splitright          " opens new buffer below current
set number              " show line numbers
set ruler               " always show cursor position
set laststatus=2        " always shows the status bar
"set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
"set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set fillchars+=vert:\   " removes ugly styling of borders in vim 

"Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Where to split vim tabs
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1 "Docstring for folds SimplyFold Plugin


"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za
"----------Stop python PEP 8 stuff--------------

"YouCompleteMe settings
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"Look pretty code!!!
let python_highlight_all=1
syntax on 

" Solarized switching background
"call togglebg#map("<F5>")

" NerdTree settings
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"let g:nerdtree_tabs_open_on_console_startup=1 "Run on console startup


" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set clipboard=unnamed "On Os X accesses system clipboard

" CtrlP setting to be fast AF
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

