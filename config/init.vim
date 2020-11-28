syntax on
set ruler               " Show the line and column numbers of the cursor.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.
set noerrorbells                " No beeps
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup            	" Don't create annoying backup files
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set autoindent
set tabstop=2 shiftwidth=4 expandtab
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).
set nospell             " disable spellcheck
set guicursor=i:ver25-iCursor
set mouse=a
set completeopt=menuone,noinsert,noselect " Set completeopt to have a better completion experience
set shortmess+=c                  " Avoid showing message extra message when using completion

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  " set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  set listchars=tab:>\ ,extends:>,precedes:<,nbsp:+
endif


" Plugins here
call plug#begin('~/.config/nvim/plugged')
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'scrooloose/nerdtree'
  Plug 'vwxyutarooo/nerdtree-devicons-syntax'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'ekalinin/Dockerfile.vim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-lua/diagnostic-nvim'
  Plug 'tomasiser/vim-code-dark'
  Plug 'elixir-editors/vim-elixir'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tpope/vim-fugitive' " Git stuff
call plug#end()

lua <<EOF
  local nvim_lsp = require 'lspconfig'
  nvim_lsp.tsserver.setup{on_attach=require'completion'.on_attach}
  nvim_lsp.solargraph.setup{on_attach=require'completion'.on_attach}
  nvim_lsp.elixirls.setup{on_attach=require'completion'.on_attach}

  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
      enable = true,
      disable = { "elixir" }
    },
  }
EOF

let g:airline_theme = 'codedark'
let g:airline_powerline_fonts=1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'

let g:airline#extensions#lsp#enabled = 1
let airline#extensions#lsp#error_symbol = 'E:'
let airline#extensions#lsp#warning_symbol = 'W:'
let airline#extensions#lsp#show_line_numbers = 1
let airline#extensions#lsp#open_lnum_symbol = '(L'
let airline#extensions#lsp#close_lnum_symbol = ')'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'

let g:NERDTreeMouseMode=3
let g:NERDTreeMinimalUI = 1
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeWinSize = 31
let g:NERDTreeChDirMode = 2
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeCascadeOpenSingleChildDir = 1

" No Python
let g:loaded_python_provider = 0
let g:python_host_prog = ''

let g:session_autoload = 'yes'
let g:session_default_to_last = 1

" Find elixir files and give them elixir filetype
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir

" Use LSP omni-completion in elixir files.
autocmd FileType elixir setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Leader key is like a command prefix.
nnoremap <SPACE> <Nop>
let mapleader=' '
let maplocalleader='\'

source ~/.config/nvim/keys.vim

colorscheme codedark

" If split in given direction exists - jump, else create new split
function! JumpOrOpenNewSplit(key, cmd, fzf) " {{{
  let current_window = winnr()
  execute 'wincmd' a:key
  if current_window == winnr()
    execute a:cmd
    if a:fzf
      Files
    endif
  else
    if a:fzf
      Files
    endif
  endif
endfunction " }}}

function! CloseSplitOrDeleteBuffer() " {{{
  if winnr("$") > 1
    execute 'bd!'
  else
    execute 'q!'
  endif
endfunction " }}}

function! CloseSplitOrDeleteBufferSafe() " {{{
  if winnr('$') > 1
    wincmd c
  else
    execute 'bdelete'
  endif
endfunction " }}}
