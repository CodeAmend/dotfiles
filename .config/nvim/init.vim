" Set shell
" set shell=/bin/bash

" Plugins
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'chriskempson/base16-vim'
Plug 'wincent/command-t'
Plug 'mileszs/ack.vim'
Plug 'justmao945/vim-clang'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'sunaku/vim-dasht'
" Plug 'mattn/emmet-vim'
" Plug 'Valloric/YouCompleteMe'
call plug#end()

" AUTOLOADZ
execute pathogen#infect()

let g:clang_library_path='usr/lib64/libclan.so.8'
let g:clang_user_options='-std=c++11'

let g:ruby_host_prog='/usr/bin/neovim-ruby-host'
let g:node_host_prog='/usr/bin/neovim-node-host'


" COLORS
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" set t_Co=256
 " set background=dark
" syntax enable
" hi Normal guibg=NONE ctermbg=NONE
" colorscheme zenburn



" SETS
set number
set relativenumber
set splitbelow
set splitright
set equalalways
set mouse=a

set path+=**
set wildignore+=*/node_modules/*
set wildignore+=*/__snapshots__/*
set wildignore+=.git
set wildignore+=*.jpg,*.png

" Indent setup
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab 

autocmd InsertLeave * write

" Ignore case unless caps used
set ignorecase
set smartcase


" LEADER
let mapleader="\<Space>"

" toggle previous buffer 
nnoremap <Leader><Leader> <C-^>


" Disable arrows in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable arrows in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Auto close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" Close and indent <CR> brackets
inoremap "<CR> "<CR>"<ESC>O
inoremap ";<CR> "<CR>";<ESC>O
inoremap '<CR> '<CR>'<ESC>O
inoremap ';<CR> '<CR>';<ESC>O
inoremap `<CR> `<CR>`<ESC>O
inoremap `;<CR> `<CR>`;<ESC>O

inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap [;<CR> [<CR>];<ESC>O
inoremap (<CR> (<CR>)<ESC>O
inoremap (;<CR> (<CR>);<ESC>O

" brackets and quotes type over closing
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == '"'   ? "\<Right>"   : '"'
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" : "\'"
inoremap <expr> ` strpart(getline('.'), col('.')-1, 1) == "`" ? "\<Right>" : "\`"

" Move around open buffers easily
nnoremap <C-h> <C-W><C-H>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>

" print the working directory
nnoremap <LEADER>p :echo expand('%')<CR>
nnoremap <LEADER>P :r !echo $(pwd)<CR>

" Use '%%' to search in folder of file opened
cabbr <expr> %% fnameescape(expand('%'))

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


"Underline currently edited line
if !has("gui_running")
    :autocmd InsertEnter * set cul
    :autocmd InsertLeave * set nocul
endif
