set nocompatible
set encoding=utf-8
set nu
set ttyfast
set cursorline
set scrolloff=20
set autoindent
set cindent
set bs=2
set hlsearch
set laststatus=2
set t_Co=256
set showmatch
highlight ColorColumn ctermbg=7

syntax on
filetype off

" Golang setup
set rtp+=$GOROOT/misc/vim

" include vundle and init
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Let vundle manage vundle
Plugin 'VundleVim/Vundle.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tell-k/vim-autopep8'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'prettier/vim-prettier'
" Plugins must be added before this line
call vundle#end()
filetype plugin indent on

" NerdTree setup
let NERDTreeIgnore=['\.pyc$', '\~$', '\.DS_Store', '\.swp'] "ignore files in NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Syntastic setup
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python3']

" Prettier setup
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql Prettier

" Syntax highlighting
let python_highlight_all=1

" Auto-pep8 setup
let g:autopep8_max_line_length = 79
let g:autopep8_on_save = 1 
let g:autopep8_disable_show_diff=1

" YCM settings
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Python PEP8 indentation
au FileType,BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab | 
    \ set fileformat=unix |
    \ set colorcolumn=79 |

" JavaScript File setup
au FileType, BufNewFile, BufRead *.js
		\	set tabstop=2 |
		\ set softtabstop=2 |
		\ set shiftwidth=2 |
		\ set formatprg=prettier |
		\ set syntax=javascript

" Default settings for other filetypes
set tabstop=2 |
set softtabstop=2 |
set shiftwidth=2 

" Map CTRL-hjkl to switch between vim panes
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
