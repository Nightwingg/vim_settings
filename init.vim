call plug#begin('~/AppData/Local/nvim/plugged')
" below are some vimplugins for demonstration purpose.
" add the plugin you want to use here.
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Navegar entre tabs
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" air line
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cdelledonne/Vim-CMake'
Plug 'mg979/vim-visual-multi'
Plug 'sheerun/vim-polyglot'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'lervag/vimtex'
Plug 'jiangmiao/auto-pairs'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

filetype plugin on
set splitbelow
set splitright

" Salir modo insert
inoremap jj <ESC>
tnoremap jj <C-\><C-n>

" Relative numbers
set relativenumber

" Enable folding
set foldmethod=indent
set foldlevel=99

" No check spell
au BufNew,BufRead  * set nospell

" Files
map <Leader>p :Files<CR>
map <Leader>ob :Buffers<cr>

" Errors
nmap <silent> sd :CocList diagnostics<CR>

" Terminal
nmap <c-t> :!start cmd <CR><CR>

"Leader
let mapleader="\<Space>"

"sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
set hidden
 
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

highlight Comment cterm=italic gui=italic

syntax on

" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme = 'purify'
let g:airline#extensions#tabline#enabled = 1
 

set laststatus=2

" true colours
set background=dark
set t_Co=256

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

colorscheme purify 

" confirme save
set confirm
:set fillchars+=vert:\|

" copy, cut and paste
vmap <C-c> "+y <ESC>
vmap <C-x> "+c <ESC>
vmap <C-v> c<ESC>"+p
nmap <C-v> "+p <cr>
imap <C-v> <ESC>"+p<CR>

" Save File
nmap <leader>w <Esc>:w<cr><Space>

" No swap
set noswapfile
set autoindent
let $TMP="/tmp"
set smarttab

" Files
map <Leader>p :FZF<CR>

" buffer navigation
map <Leader><Tab> :bnext<cr>
map <Leader><s-Tab> :bprevious <cr>
map <leader>bd :bd<cr>
map <leader>q :bd<cr>
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" tab navigation
map <Leader>h :tabprevious<cr>
map <Leader>l :tabNext<cr>

" buffers
map <Leader>ob :Buffers<cr>

" NerdTree
map <C-b> :NERDTreeToggle<CR>

" Set column limit
set textwidth=85
set wrapmargin=2
set numberwidth=6
set wrap

" Tab size
set tabstop=2
set softtabstop=2

au BufNewFile,BufRead *.R,*.java,*.cpp,*.c,*.cs,*.rkt,*.h,*.html
    \ set shiftwidth=2 |
    \ set textwidth=90 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set tabstop=2|
    \ set softtabstop=2

au BufNewFile, BufRead *.py set tabstop=4 | set softtabstop=4 | set shiftwidth=4

" Autoindent
set autoindent

" Faster scrolling
nnoremap <silent> <C-e> 10<C-e>
nnoremap <silent> <C-y> 10<C-y>

" Space in end
set scrolloff=10

" Go to
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh <Plug>(coc-float-hide)
inoremap <C-P> <C-\><C-O>:call CocActionAsync('showSignatureHelp')<cr>

" Multilin 
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n

" Diagnostic
set shellcmdflag=/c

" autocomplete
set completeopt-=preview
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<C-H>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" autocomplete tab
set previewheight=50

" Disable ale
let g:ale_linters_explicit = 1

" Hightlight polyglot
let g:python_highlight_all = 0
let g:python_highlight_space_errors = 0

" Format code
nmap <leader>kf :ALEFix <CR> 
let g:ale_fixers = {'r': ['styler'],
      \  'python':['autopep8', 'yapf'],
      \  'cpp':['clang-format']}

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetDirectories=['C:\\Users\\lzuni\\AppData\\Local\\nvim\\UltiSnips']
let g:UltiSnipsExpandTrigger="<C-s>"

" Latex
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer = 'SumatraPDF' 
"let g:vimtex_view_general_options_latexmk='-reuse-instance'
let g:vimtex_compiler_progname='nvr'
let g:vimtex_view_general_options
                \ = '-reuse-instance -forward-search @tex @line @pdf'
                \ . ' -inverse-search "' . exepath(v:progpath)
                \ . ' --servername ' . v:servername
                \ . ' -syntex=1'
                \ . ' --remote-send \"^<C-\^>^<C-n^>'
                \ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
                \ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
                \ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'

" Run
" run code
augroup compileandrun
    autocmd!
    "autocmd filetype python nnoremap <f6> :w <bar> :!python3 % <cr>
    "autocmd filetype cpp nnoremap <f6> :w <bar> !g++ -std=c++11 % <cr> :vnew <bar> :te "a.exe" <cr><cr>
  autocmd filetype cpp nnoremap <f6> :!start cmd /K "g++ -std=c++11 % & a.exe & echo. & pause & exit" <cr><cr>
  autocmd filetype python nnoremap <f6> :!start cmd /K "pypy3 % & echo. & pause & exit" <cr><cr>
  "autocmd filetype python nnoremap <f6> :w <bar> :!pypy3 "%" <cr>
augroup END

