set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdTree'

Plugin 'fatih/vim-go'

Plugin 'nsf/gocode', {'rtp': 'vim/'}

Plugin 'junegunn/seoul256.vim'

Plugin 'valloric/youcompleteme'

Plugin 'scrooloose/nerdcommenter'

Plugin 'bling/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'ntpeters/vim-better-whitespace'

Plugin 'mileszs/ack.vim'

Plugin 'vimwiki/vimwiki'

Plugin 'tpope/vim-fugitive'
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
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Colour
colo seoul256
set t_Co=256

" Tabbing and indenting set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent
filetype indent on

" Common settings
set hlsearch
set number
syntax on
hi Normal ctermbg=none

" Useful shortcuts
let mapleader=","
set pastetoggle=<leader>p
map <C-n> :NERDTreeToggle<CR>
map <leader>sw :StripWhitespace<CR>
imap jk <Esc>
nnoremap <silent> <leader>n :nohlsearch<CR>

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_python_binary_path = '/usr/bin/python3'

" Vim Airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16'
let g:airline_left_sep=''
let g:airline_right_sep=''

" Better WhiteSpace
highlight ExtraWhitespace ctermbg=114

" Nerdcommenter
let NERDSpaceDelims=1

" Golang
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>r <Plug>(go-run)