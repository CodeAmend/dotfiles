" Set shell
set shell=/usr/bin/zsh


" Plugins
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'

Plug 'mileszs/ack.vim'

Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'chrisbra/Colorizer'
Plug 'chriskempson/base16-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'suy/vim-context-commentstring'
Plug 'styled-components/vim-styled-components'

Plug 'amadeus/vim-convert-color-to'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'css',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'python',
    \ 'html' ] }

call plug#end()

filetype plugin indent on

" Plugin setup
" augroup javascript_folding
"   au!
"   au FileType javascript setlocal foldmethod=syntax
" augroup END

" AUTOLOADZ
execute pathogen#infect()

" let g:clang_library_path='usr/lib64/libclan.so.8'
" let g:clang_user_options='-std=c++11'

" let g:ruby_host_prog='/usr/bin/neovim-ruby-host'
" let g:node_host_prog='/usr/bin/neovim-node-host'


" COLORS
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

let g:colorizer_auto_color = 1

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
set wildignore+=*/public/*
set wildignore+=*/.cache/*
set wildignore+=*/static/*
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

" Move around open buffers easily
nnoremap <C-h> <C-W><C-H>
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>

" Auto close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ` ``<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

" Close and indent <CR> brackets
inoremap "<CR> "<CR>"<ESC>O
inoremap '<CR> '<CR>'<ESC>O
inoremap `<CR> `<CR>`<ESC>O
inoremap {<CR> {<CR>}<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap (<CR> (<CR>)<ESC>O

" Brackets and quotes type over closing
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == '"' ? "\<Right>" : '"'
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" : "\'"
inoremap <expr> ` strpart(getline('.'), col('.')-1, 1) == "`" ? "\<Right>" : "\`"
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

" print the working directory
nnoremap <LEADER>p :echo expand('%')<CR>
nnoremap <LEADER>P :r !echo $(pwd)<CR>

nnoremap <ESC> :noh<CR>

" Use '%%' to search in folder of file opened
cabbr <expr> %% fnameescape(expand('%'))

" ALE settings
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\
\}

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" let g:UltiSnipsMappingsToIgnore = ['autocomplete']

""Underline currently edited line
"if !has("gui_running")
"    :autocmd InsertEnter * set cul
"    :autocmd InsertLeave * set nocul
"endif

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1

