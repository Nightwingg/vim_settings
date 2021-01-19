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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mg979/vim-visual-multi'
Plug 'sheerun/vim-polyglot'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'lervag/vimtex'
call plug#end()

filetype plugin on
set splitbelow
set splitright

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
let g:airline#extensions#tabline#enabled = 1

set laststatus=2
" set showtabline=2

" true colours
set background=dark
set t_Co=256

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

colorscheme jellybeans

" confirme save
set confirm

:set fillchars+=vert:\|


" copy, cut and paste
vmap <C-c> "+y <ESC>
vmap <C-x> "+c <ESC>
vmap <C-v> c<ESC>"+p
nmap <C-v> "+p <cr>
imap <C-v> <ESC>"+p<CR>
"imap <C-v> <ESC> :set paste <bar> "+p <bar> set nopaste <bar> a <cr>
"inoremap <c-v> <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>mi`[=`]`ia
"nmap <c-v> <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>mi`[=`]`ia

" Save File
nmap <leader>w <Esc>:w<cr><Space>
nmap <leader>q <Esc>:q<cr><Space>

" No swap
set noswapfile
set autoindent
let $TMP="/tmp"
set smarttab

" Files
map <Leader>p :FZF<CR>

" buffer navigation
map <Leader>1 :bprevious<cr>
map <Leader>2 :bnext<cr>
map <leader>bd :bd<cr>

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
"set linebreak
"set showbreak=+++

" Tab size
set tabstop=2
set softtabstop=2

au BufNewFile,BufRead *.R,*.java,*.cpp,*.c,*.cs,*.rkt,*.h,*.html
    \ set shiftwidth=2 |
    \ set textwidth=90 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
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
"autocmd FileType python let b:coc_suggest_disable =1 
autocmd FileType r let b:coc_suggest_disable = 0
"autocmd BufEnter *.python :CocDisable
"autocmd BufLeave *.python :CocEnable
set shellcmdflag=/c
" Git bash like shell
"if has("win32")
  "let &shell='bash.exe'
  "let &shellcmdflag = '-c'
  "let &shellredir = '>%s 2>&1'
  "set shellquote= shellxescape=
  "" set noshelltemp
  "set shellxquote=
  "let &shellpipe='2>&1| tee'
"endif


" Floaterm Position
let g:floaterm_wintype = 'normal'
let g:floaterm_position = 'bottom'
let g:floaterm_height = 0.35
let g:floaterm_autoclose=0
let g:floaterm_autoinsert =v:true

" Floaterm 
nmap <silent>tt :FloatermNew <CR>
nmap <leader>ht :FloatermToggle<CR> jj<CR> :FloatermHide<CR>
nmap <C-t> :FloatermToggle<CR>

" autocomplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <S-Tab>: completion back
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<C-H>"

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
      \  'python':['autopep8', 'yapf']}

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetDirectories=['C:\\Users\\lzuni\\AppData\\Local\\nvim\\UltiSnips']
let g:UltiSnipsExpandTrigger="<C-s>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

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
