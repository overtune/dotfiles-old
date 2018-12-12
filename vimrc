"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Defaults
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible " Run in Vim mode
set encoding=utf-8
scriptencoding utf-8
set guifont=Menlo:h13
set linespace=4



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob("~/.vim/autoload/plug.vim"))
	execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins (handled with Plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
	" Plug 'altercation/vim-colors-solarized' " Great colorscheme
	Plug 'joshdick/onedark.vim' " A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme.
	" Plug 'kien/ctrlp.vim' " Fast file lookup
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
	Plug 'pangloss/vim-javascript', { 'for': 'javascript' }  " Better javascript support for Vim
	Plug 'mxw/vim-jsx' " Reactjs plugin
	Plug 'elzr/vim-json' " Json plugin
	Plug 'heavenshell/vim-jsdoc' " JSDoc plugin
	Plug 'chr4/nginx.vim' " Nginx syntax plugin
	" Plug 'alvan/vim-closetag'
	" Plug 'Townk/vim-autoclose'
	" Plug 'Raimondi/delimitMate' " Autoclose plugin
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-abolish'
	" Plug 'tpope/vim-vinegar'
	Plug 'MarcWeber/vim-addon-mw-utils' " Snipmate dependency
	Plug 'tomtom/tlib_vim' " Snipmate dependency
	Plug 'SirVer/ultisnips' " UltiSnips
	Plug 'honza/vim-snippets' " Snipmate snippets
	Plug 'Galooshi/vim-import-js' "Auto import js.

	function! BuildYCM(info)
		" info is a dictionary with 3 fields
		" - name:   name of the plugin
		" - status: 'installed', 'updated', or 'unchanged'
		" - force:  set on PlugInstall! or PlugUpdate!
		if a:info.status == 'installed' || a:info.force
			!./install.py
		endif
	endfunction

	Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') } " Autocomplete
	" cd ~/.vim/plugged/YouCompleteMe && ./install.py
	Plug 'ervandew/supertab' " Supertab
	Plug 'mattn/emmet-vim' " Emmet
	" Plug 'vim-multiple-cursors' " Multiple cursors (we have a bug where
	" first space press enters insert mode)
	Plug 'mileszs/ack.vim' " Search with the silver searcher
	Plug 'mustache/vim-mustache-handlebars' " Handlebars plugin
	Plug 'scrooloose/nerdtree' " Nerd tree
	Plug 'jeetsukumaran/vim-buffergator' "Buffergator
	Plug 'easymotion/vim-easymotion' "Easymotion
	Plug 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air
	Plug 'leafgarland/typescript-vim' " Typescript support
	Plug 'vimwiki/vimwiki' " Vimwiki
	Plug 'Quramy/tsuquyomi' " Typescript
	Plug 'prettier/vim-prettier', {'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html', 'hbs', 'handlebars'] }
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	" Plug 'neilagabriel/vim-geeknote' " Integration with geeknote
	" https://github.com/VitaliyRodnenko/geeknote
call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number " Show line numbers
set hls " Hightligt search results
set scrolloff=10 " Start scrolling before we reach bottom
set autoread " Reload files changed outside vim
" set cursorline " Highlight current line
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
set laststatus=2 " Else doesn't vim-airline appear until I create a new split
set clipboard=unnamed " Set the default clipboard to the systems clipboard.
set synmaxcol=300 " Disable syntax highlightning for rows larger than 300 cols.
filetype plugin on " Enable plugins
runtime macros/matchit.vim "Adds % jump between tags and if/else amongst other. 



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup and swap files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set space as the leader
let mapleader = "\<Space>"

" Update :E to explore (emmet plugin causes problem otherwise)
"cabbrev E Explore

" Map to easier navigate buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
 
" Shortcut to rapidly toggle 'set list'
nmap <leader>l :set list!<CR>

" jj for Esc
imap jj <Esc>

" <C-s> mutes the search highlights (and redraws the screen)
nnoremap <silent> <leader>s :<C-u>nohlsearch<CR><C-l>

" Use <leader>ev to edit vimrc.
nnoremap <leader>ev :e $MYVIMRC<CR>
autocmd FileType vim nmap <buffer> <leader>r :source $MYVIMRC<CR>

" Use ' to jump to mark with preserved column
nnoremap ' `

" Don't use cursor keys.
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

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

" Use leader q to quit
nnoremap <Leader>q :q<CR>

" Use leader e to explore
map <Leader>e :NERDTreeToggle<CR>
" nnoremap <Leader>e :Explore<CR>

" Use leader to go to typescript definition and show references
autocmd FileType typescript nmap <buffer> <Leader>d :TsuquyomiDefinition<CR>
autocmd FileType typescript nmap <buffer> <Leader>D :TsuquyomiReferences<CR>
autocmd FileType typescript nmap <buffer> <Leader>r <Plug>(TsuquyomiRenameSymbolC)

" Easier window switching
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

inoremap <c-k> <Up>
inoremap <c-j> <Down>
inoremap <c-h> <Left>
inoremap <c-l> <Right>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI and theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

if &term =~ '256color'
	" Disable Background Color Erase (BCE) so that color schemes
	" work properly when Vim is used inside tmux and GNU screen.
	set t_ut=
endif

" Colorscheme
syntax enable " Enable syntax highlighing
let &t_Co=256 " Use 256 colors if available
" let g:solarized_termtrans=1
" let g:solarized_termcolors=256
set background=dark 		" Dark background
" colorscheme solarized " Use solarized colorscheme
silent! colorscheme onedark



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx,*.handlebars,*.hbs"
" let delimitMate_matchpairs ="(:),[:],{:}"
let g:jsx_ext_required = 0 " Enable vim-jsx plugin to be run on .js files aswell
let g:jsdoc_access_descriptions = 2 "turn on access tags like @<private|public>
let g:jsdoc_underscore_private = 1 " turn on detecting underscore starting functions as private convention
let g:vim_json_syntax_conceal = 0 " turn off qoute concealing for the vim-json plugin
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}
let g:user_emmet_leader_key=','
" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:ctrlp_custom_ignore = 'node_modules\|dist\|DS_Store\|git\|dojotoolkit\|build\'

" Ack/ag
if executable('ag')
	 let g:ackprg = 'ag --vimgrep'

	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor\ --ignore-dir=node_modules

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	" let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'

	" ag is fast enough that CtrlP doesn't need to cache
	" let g:ctrlp_use_caching = 0

	" bind K to grep word under cursor
	nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
 endif

" Buffergator
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'
nmap <leader>jj :BuffergatorMruCyclePrev<cr>
nmap <leader>kk :BuffergatorMruCycleNext<cr>


" NERDTree
let g:NERDTreeWinSize=40

" FZF
map <c-p> :FZF <CR>

" VimWiki
let g:vimwiki_list = [{'path': '~/wiki/', 'path_html': '~/wiki_html', 'syntax': 'markdown', 'ext': '.md' }]

" Vim go
let g:go_fmt_command = "goimports"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Relative line numbers toggle function
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
" set relativenumber " Set relative numbers as default
" Toggle relative linenumbers with ctrl+n
nnoremap <C-n> :call NumberToggle()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommand Groups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup markdown
au! BufRead ~/wiki/index.md !git --git-dir ~/wiki/.git pull
au! BufWritePost ~/wiki/* !cd ~/wiki;git add "%";git commit -m "Auto commit of %:t." "%";git push
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use iA Writer to preview markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:setupMarkdownPreview()
  nnoremap <leader>P :silent !open -a Markoff.app '%:p'<cr>
endfunction

au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkdownPreview()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Notes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" autoindent
" https://github.com/Valloric/YouCompleteMe
" smartcase " Turns on smart casesensitive. When searching with lower case, the search is case insensitive, when searching with upper case, the search is case sensitive.
" :so % " Reload vimrc
" https://github.com/ggreer/the_silver_searcher/blob/master/README.md
" https://robots.thoughtbot.com/faster-grepping-in-vim
" http://softwareas.com/a-simple-way-to-speed-up-vim-ctrl-p-plugin-delegate-to-ag/
" https://github.com/sheerun/vim-polyglot
