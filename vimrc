set nocompatible " Run in Vim mode

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
	execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" Plug start
call plug#begin('~/.vim/plugged')
	Plug 'altercation/vim-colors-solarized' " Great colorscheme
	"Plug 'scrooloose/nerdtree' " File-tree
	Plug 'kien/ctrlp.vim' " Fast file lookup
	Plug 'pangloss/vim-javascript', { 'for': 'javascript' }  " Better javascript support for Vim
	Plug 'mxw/vim-jsx' " Reactjs plugin
	Plug 'elzr/vim-json' " Json plugin
	Plug 'heavenshell/vim-jsdoc' " JSDoc plugin
	"Plug 'jelera/vim-javascript-syntax'
	Plug 'alvan/vim-closetag'
	Plug 'Townk/vim-autoclose'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'MarcWeber/vim-addon-mw-utils' " Snipmate dependency
	Plug 'tomtom/tlib_vim' " Snipmate dependency
	Plug 'garbas/vim-snipmate' " Snipmate 
	Plug 'honza/vim-snippets' " Snipmate snippets
call plug#end()

" Setup
set number " Show line numbers
set hls " Hightligt search results
set scrolloff=10 " Start scrolling before we reach bottom
set autoread " Reload files changed outside vim
set cursorline " Highlight current line
set nrformats= " We want decimal numbers, not octal
set listchars=tab:▸\ ,eol:¬ " Change charachters for invisibles
set tabstop=4 " Set a tabsize of 4 spaces
set autoindent " Keep indentation from previous line
set smartindent " Automatically inserts indentation in some cases
set shiftwidth=4
set history=200 " Store the last 200 commands
set timeoutlen=1000 " Set mapping delay to 1000 (standard)
set ttimeoutlen=0 " Set key code delay to 0.
set hidden " Enable hidden buffers, so we don't get a warning when running :bnext and have unsaved changes
set incsearch " Enable incsearch, which hihlight matches as you type
set pastetoggle=<f5> " Toggle the paste option with the F5 key.
set wrap " this enables visual wrapping
set textwidth=0 wrapmargin=0 " this turns off physical line wrapping (ie: automatic insertion of newlines)
filetype plugin on " Enable plugins
runtime macros/matchit.vim "Adds % jump between tags and if/else amongst other. 

" Set space as the leader
let mapleader = "\<Space>"

" Map to easier navigate buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
 
" Shortcut to rapidly toggle 'set list'
nmap <leader>l :set list!<CR>

" <C-l> mutes the search highlights (and redraws the screen)
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Map jk to <esc>
inoremap jk <esc>

" Use <leader>ev to edit vimrc.
nnoremap <leader>ev :tabedit $MYVIMRC<CR>

" Use ' to jump to mark with preserved column
nnoremap ' `

" Type %% to get current file path (usefull for example with the :edit command
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Remap ctrl-n to ctrl-space (for autocomplete)
if has("gui_running")
	inoremap <C-Space> <C-n>
else
	if has("unix")
		inoremap <Nul> <C-n>
	else
	endif
endif

" Use leader w to save file
nnoremap <Leader>w :w<CR>

" Easier mapping for access system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Colorscheme
syntax enable " Enable syntax highlighing
let &t_Co=256 " Use 256 colors if available
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark 		" Dark background
colorscheme solarized " Use solarized colorscheme

" Plugin config
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx"
let g:jsx_ext_required = 0 " Enable vim-jsx plugin to be run on .js files aswell
let g:jsdoc_access_descriptions = 2 "turn on access tags like @<private|public>
let g:jsdoc_underscore_private = 1 " turn on detecting underscore starting functions as private convention
let g:vim_json_syntax_conceal = 0 " turn off qoute concealing for the vim-json plugin

" Notes
" autoindent
" https://github.com/Valloric/YouCompleteMe
" smartcase " Turns on smart casesensitive. When searching with lower case, the search is case insensitive, when searching with upper case, the search is case sensitive.
" :so % " Reload vimrc
