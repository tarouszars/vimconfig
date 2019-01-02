set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

 call vundle#begin()
	" let Vundle manage Vundle, required
 	Plugin 'VundleVim/Vundle.vim'
 	Plugin 'christoomey/vim-tmux-navigator'
 	Plugin 'ctrlpvim/ctrlp.vim'
	Plugin 'FelikZ/ctrlp-py-matcher'
	Plugin 'vim-airline/vim-airline'
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable 

set autoread                          " Auto reload changed files
set wildmenu                          " Tab autocomplete in command mode
set backspace=indent,eol,start        " http://vi.stackexchange.com/a/2163
set clipboard=unnamed                 " Clipboard support (OSX)
set laststatus=2                      " Show status line on startup
set splitright                        " Open new splits to the right
set splitbelow                        " Open new splits to the bottom
set lazyredraw                        " Reduce the redraw frequency
set ttyfast                           " Send more characters in fast terminals
set nowrap                            " Don't wrap long lines
set listchars=extends:→               " Show arrow if line continues rightwards
set listchars+=precedes:←             " Show arrow if line continues leftwards
set nobackup nowritebackup noswapfile " Turn off backup files
set noerrorbells novisualbell         " Turn off visual and audible bells
set noexpandtab shiftwidth=0 tabstop=2            " Two spaces for tabs everywhere
set history=500
set ignorecase smartcase              " Search queries intelligently set case
set incsearch                         " Show search results as you type
set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape
set showcmd                           " Show size of visual selection
set hidden
set relativenumber


let mapleader = ","
nnoremap <leader>re :execute "edit " . $MYVIMRC<CR>
nnoremap <leader>rs :execute "source " . $MYVIMRC<CR>
nnoremap <leader>rn :if exists("g:syntax_on") <CR> syntax off <CR> set relativenumber <CR> else <CR> set relativenumber <CR> syntax enable<CR> endif<CR><CR>
nnoremap <leader>h :set hlsearch! <CR>
nnoremap <Leader>f :set nomore<Bar>:ls<Bar>:set more<CR>:b<Space>

nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_match_window = 'results:100,max:15,min:15'
let g:ctrlp_reuse_window = 'quickfix'

"-------------------------------------------------------------------------------
" Interface
"-------------------------------------------------------------------------------

set number            " Enable line numbers
set scrolloff=5       " Leave 5 lines of buffer when scrolling
set sidescrolloff=10  " Leave 10 characters of horizontal buffer when scrolling

"-------------------------------------------------------------------------------
" Colors & Formatting
"-------------------------------------------------------------------------------

colorscheme onedark	
set background=dark

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Use The Silver Searcher for Search instead of grep
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :silent<CR>:grep! "\b<C-R><C-W>\b"<CR>:copen 20<CR>
" nnoremap K :silent<CR>:grep! "\b<C-R><C-W>\b"<CR>:only<CR>:vert bo copen 100<CR>

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
nnoremap gj :cn<CR>
nnoremap gk :cp<CR>


