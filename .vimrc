"vundle stuffs
set nocompatible "be iMproved
set rtp+=~/.vim/bundle/Vundle.vim
filetype off                

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'sickill/vim-monokai'
Plugin 'elixir-editors/vim-elixir'
Plugin 'inkarkat/vim-ingo-library'
Plugin 'inkarkat/vim-mark'
Plugin 'Valloric/YouCompleteMe'
Plugin 'dyng/ctrlsf.vim'
Plugin '907th/vim-auto-save'

call vundle#end()          
filetype plugin indent on 

set splitbelow "set new window to open below
set background=dark 
set number
set ruler
set autoread
set backspace=indent,eol,start
set hlsearch
set autoindent
set cursorline

syntax on
syntax enable
"colorscheme monokai
colorscheme spaceway

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> vv <C-w>v
nnoremap <silent> + :exe "resize +2"<CR>
nnoremap <silent> - :exe "resize -2"<CR>
inoremap <silent> <Esc> <C-O>:stopinsert<CR>

" define i key to be pressed twice and return to normal mode
:imap ii <Esc>

set tags=tags

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_extensions = ['line']
let g:ctrlp_regexp_search = 1
let g:ctrlp_working_path_mode = 'ra'
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif

nnoremap <C-F> :CtrlSF<CR>
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_auto_close = {"normal" : 1, "compact": 1}
let g:ctrlsf_auto_focus = {"at": "start"}

"enable auto save
let g:auto_save = 1
let g:auto_save_silent = 1

"easy tab navigation
nnoremap H gT
nnoremap L gt
