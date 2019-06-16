" Set shell
set shell=/usr/bin/zsh

" Plugins
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'

Plug 'wincent/command-t'
Plug 'mileszs/ack.vim'

Plug 'chriskempson/base16-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'justmao945/vim-clang'
Plug 'mattn/emmet-vim'

Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'

Plug 'sunaku/vim-dasht'
call plug#end()

" Plugin setup
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END

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

" Fullscreen - open current buffer in new tab
nnoremap tt :tab split<CR>

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

" Brackets and quotes type over closing
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == '"' ? "\<Right>" : '"'
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" : "\'"
inoremap <expr> ` strpart(getline('.'), col('.')-1, 1) == "`" ? "\<Right>" : "\`"
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"


" Move around open buffers easily
nnoremap <C-h> <C-W><C-H>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>

" print the working directory
nnoremap <LEADER>p :echo expand('%')<CR>
nnoremap <LEADER>P :r !echo $(pwd)<CR>

nnoremap <ESC> :noh<CR>

" Use '%%' to search in folder of file opened
cabbr <expr> %% fnameescape(expand('%'))

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"

let g:UltiSnipsMappingsToIgnore = ['autocomplete']

let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]


""" DASHT
" type in search
nnoremap <Leader>k :Dasht<Space>
" nnoremap <Leader><Leader>k :Dasht!<Space>

" word under cursor
nnoremap <silent> <Leader>K :call Dasht([expand('<cword>'), expand('<cWORD>')])<Return>
" nnoremap <silent> <Leader><Leader>K :call Dasht([expand('<cword>'), expand('<cWORD>')], '!')<Return>

let g:dasht_results_window = 'tabnew'
" let g:dasht_filetype_docsets['js'] = ['node']
""" END DASHT

"Underline currently edited line
if !has("gui_running")
    :autocmd InsertEnter * set cul
    :autocmd InsertLeave * set nocul
endif
