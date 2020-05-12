" Set shell
set shell=/usr/bin/zsh
set encoding=utf-8

" Enable folding
set foldmethod=indent
set foldlevel=99



" set exrc
" set secure

let g:ruby_host_prog='/home/mibru/.gem/ruby/2.7.0/bin/neovim-ruby-host'
let g:node_host_prog='/home/mibru/.nvm/versions/node/v12.13.1/bin/neovim-node-host'
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3.8'

" filetype plugin indent on
autocmd InsertLeave * write

execute pathogen#infect()

" Plugins
call plug#begin()
" Vim helpers
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'ryanoasis/vim-jsdoc'

" Syntax
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'chemzqm/vim-jsx-improve'
Plug 'suy/vim-context-commentstring'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'ianks/vim-tsx'
Plug 'neoclide/jsonc.vim'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'

" PYTHON
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'
Plug 'numirias/semshi'
Plug 'davidhalter/jedi'

" LaTex
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Autocomplete Servers Linters
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Tools
Plug 'mileszs/ack.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets'

" Color Stuff
Plug 'chriskempson/base16-vim'

call plug#end()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_additional_descriptions=1

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-python',
  \ 'coc-tsserver',
  \ 'coc-tslint-plugin',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-ultisnips',
  \ 'coc-git',
  \ 'coc-emmet',
  \ 'coc-yank',
  \ 'coc-pairs',
  \ 'coc-styled-components',
  \ ]
" \ 'coc-highlight'
" \ 'coc-eslint',

" identified as typescript react file, so add following
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
autocmd FileType typescript set indentexpr=

" Unnecessary Whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" Python simply fold
let g:SimpylFold_docstring_preview=1
let g:SimpylFold_docstring_preview=0
let g:SimpylFold_fold_docstring=1
let b:SimpylFold_fold_docstring=1
let g:SimpylFold_fold_import=1
let b:SimpylFold_fold_import=1

autocmd BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


let g:context#commentstring#table.xhtml = g:context#commentstring#table.html

let g:context#commentstring#table['javascript.jsx'] = {
			\ 'jsComment' : '// %s',
			\ 'jsImport' : '// %s',
			\ 'jsxStatment' : '// %s',
			\ 'jsxRegion' : '{/*%s*/}',
			\ 'jsxTag' : '{/*%s*/}',
			\}

let g:context#commentstring#table['typescript.jsx'] = {
			\ 'jsComment' : '// %s',
			\ 'jsImport' : '// %s',
			\ 'jsxStatment' : '// %s',
			\ 'jsxRegion' : '{/*%s*/}',
			\ 'jsxTag' : '{/*%s*/}',
			\}

let g:context#commentstring#table['typescript.tsx'] = {
			\ 'tsComment' : '// %s',
			\ 'tsImport' : '// %s',
			\ 'tsxStatment' : '// %s',
			\ 'tsxRegion' : '{/*%s*/}',
			\ 'tsxTag' : '{/*%s*/}',
			\}

let g:context#commentstring#table.vue = {
			\ 'javaScript'  : '//%s',
			\ 'cssStyle'    : '/*%s*/',
			\}



" " COLORS
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif


" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = \"<Tab>"
" let g:UltiSnipsJumpForwardTrigger = \"<Tab>"
" let g:UltiSnipsJumpBackwardTrigger = \"<S-Tab>"

" " let g:UltiSnipsMappingsToIgnore = ['autocomplete']

set hidden
set nobackup
set nowritebackup
" set cmdheight=2
set updatetime=200
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use tab for trigger completion with characters ahead and navigate.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" " position. Coc only does snippet and additional edit on confirm.
" if has('patch8.1.1068')
"   " Use `complete_info` if your (Neo)Vim version supports it.
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" " Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap keys for applying codeAction to the current line.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" " Introduce function text object
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" " Use <TAB> for selections ranges.
" " NOTE: Requires 'textDocument/selectionRange' support from the language server.
" " coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Mappings using CoCList:
" " Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" " SETS
set number
set relativenumber
set equalalways
set splitright
set splitbelow
set mouse=a

set path+=**
set wildignore+=*/node_modules/*
set wildignore+=*/__snapshots__/*
set wildignore+=*/public/*
set wildignore+=*/.cache/*
set wildignore+=*/static/*
set wildignore+=.git
set wildignore+=*.jpg
set wildignore+=*.png

" " Indent setup
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

" No ex mode
nnoremap Q <Nop>

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
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ` ``<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>

" " Close and indent <CR> brackets
" inoremap \"<CR> \"<CR>"<ESC>O
" inoremap '<CR> '<CR>'<ESC>O
" inoremap `<CR> `<CR>`<ESC>O
" inoremap {<CR> {<CR>}<ESC>O
" inoremap [<CR> [<CR>]<ESC>O
" inoremap (<CR> (<CR>)<ESC>O

" " print the working directory
nnoremap <LEADER>p :echo expand('%')<CR>
nnoremap <LEADER>P :r !echo $(pwd)<CR>

nnoremap <ESC> :noh<CR>

" " Use '%%' to search in folder of file opened
" cabbr <expr> %% fnameescape(expand('%'))
