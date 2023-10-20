set hlsearch
set path+=**
set wildignore+=**/node_modules/** 
set wildignore+=**/vendor/** 
set wildignorecase
set fileignorecase
set wildmenu
set nowrap
set ignorecase
set smartcase
set expandtab 
set autoindent
set shiftwidth=2      
set tabstop=2
set path=$PWD/**
set number
set suffixesadd+=.js 
set suffixesadd+=.php 
set termguicolors
set noswapfile
set autowrite
set autochdir
set mouse=a
set sidescroll=1
set breakindent
set breakindentopt=sbr
" I use a unicode curly array with a <backslash><space>
"set showbreak=↪>\
"set guitablabel=\[%N\]\ %t\ %M


set grepprg=grep\ -nrI\ --exclude-dir=target\ --exclude-dir=tmp\ --exclude-dir=log\ --exclude="*.min.js"\ --exclude="*.log"\ $*\ /dev/null



call plug#begin()
" ES2015 code snippets (Optional)
Plug 'epilande/vim-es2015-snippets'
" React code snippets
Plug 'epilande/vim-react-snippets'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tomlion/vim-solidity'
Plug 'preservim/NERDTree'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/ap/vim-css-color'
Plug 'wakatime/vim-wakatime'
Plug 'jwalton512/vim-blade'
Plug 'jacoborus/tender.vim'
Plug 'rosenfeld/rgrep.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


call plug#end()

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd WinNew * wincmd L
autocmd BufNewFile,BufRead *.blade.php set filetype=blade

let g:NERDTreeMapActivateNode = 'go'
let g:NERDTreeMapPreview = 'o'
let g:vim_jsx_pretty_colorful_config = 1 
let g:UltiSnipsExpandTrigger="<C-l>"

"" ctr+n will open and close NERDTree
nnoremap <C-N> :NERDTreeToggle<CR>
"" <leader> + o will open NERDTree in the file your editing
nnoremap <leader>o :NERDTreeFind<CR>


let $FZF_DEFAULT_COMMAND = 'find .'
nnoremap <leader>f :Files<CR>
nnoremap <leader>a :Ag<CR>

if (has("termguicolors"))
 set termguicolors
endif

syntax enable
"colorscheme tender

let g:lightline = { 'colorscheme': 'tender' }

set grepprg=grep\ -nrI\ --exclude-dir=target\ --exclude-dir=tmp\ --exclude-dir=log\ --exclude="*.min.js"\ --exclude="*.log"\ $*\ /dev/null --exclude="node_modules/*" --exclude="vendor/*"
:
" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
" gf to create new file if not exist
noremap <leader>gf :e <cfile><cr>



" ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>



set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}

set syntax=mine

" lightline
let g:lightline = {
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
  \     [ 'blame' ]
  \   ],
  \ },
  \ 'component_function': {
  \   'blame': 'LightlineGitBlame',
  \ }
\ }

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction


" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
set pastetoggle=<F2>

#Spell checking and automatic wrapping at the recommended 72 columns to you commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

