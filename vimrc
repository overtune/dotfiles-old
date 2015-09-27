 " Johan Runesson


" Base {{{
	set nocompatible		" be iMproved, required

	" Source the vimrc file after saving it
	if has("autocmd")
		autocmd bufwritepost .vimrc source $MYVIMRC
	endif
"}}}

" Plugins {{{
	" Load vim-plug
	if empty(glob("~/.vim/autoload/plug.vim"))
		execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
	endif

	" Plug start
	call plug#begin('~/.vim/plugged')

	" Plugins
	Plug 'docunext/closetag.vim' " For inserint html close tags
	Plug 'scrooloose/nerdtree' " File-tree
	"Plug 'itchyny/lightline.vim' " A nice and simple statusbar
	Plug 'bling/vim-airline' " A nice and simple statusbar
	Plug 'tpope/vim-surround' " For changing surroundings
	Plug 'tpope/vim-repeat' " Helper plugin for surround
	Plug 'kien/ctrlp.vim' " Fast file lookup
	Plug 'ervandew/supertab' " Autocomplete text like in Textmate
	Plug 'digitaltoad/vim-jade', { 'for': 'jade' }  " Jade syntax support
	Plug 'pangloss/vim-javascript', { 'for': 'javascript' }  " Better javascript support for Vim
	Plug 'altercation/vim-colors-solarized' " Great colorscheme.

	function! Installjshint(info)
		if a:info.status == 'installed' || a:info.force
			!sudo npm install -g jshint
		endif
	endfunction
	Plug 'scrooloose/syntastic', { 'do': function('Installjshint') } " Syntax checking

	call plug#end()
" }}}

" Plugin config {{{
	" Airline: Enable the list of buffers
	let g:airline#extensions#tabline#enabled = 1

	" Airline: Show just the filename
	let g:airline#extensions#tabline#fnamemod = ':t'

	" Airline: Show statusline all the time
	set laststatus=2
" }}}

" Shortcuts {{{
	let mapleader=","		" leader is comma
	" turn off search highlight
	nnoremap <leader><space> :nohlsearch<CR>
	" jk is escape
	inoremap jk <esc>
	" Shortcut to rapidly toggle `set list`
	nmap <leader>l :set list!<CR>
	" Toggle folds
	nnoremap <Space> za
	" Toggel NERDTree
	map <C-n> :NERDTreeToggle<CR>
	" Map tab to ctrl-p for autocomplete
	"imap <Tab> <C-P>
	" type ',s' to save the buffers etc. Reopen where you were with Vim with 'vim -S'
	nnoremap <leader>s :mksession<CR>
	" type,evto edit the Vimrc
	nnoremap <leader>ev :tabedit $MYVIMRC<CR>
	" Easy bindings for its various modes
	nmap <leader>bb :CtrlPBuffer<cr>
	nmap <leader>bm :CtrlPMixed<cr>
	nmap <leader>bs :CtrlPMRU<cr>
" }}}

" Colors {{{
	syntax enable 			" Syntax highlightning on
	let &t_Co=256
	let g:solarized_termcolors=256
	let g:solarized_termtrans=1
	set background=dark 		" Dark background
	colorscheme solarized 		" Use solarized colorscheme
" }}}

" UI Config {{{
	set number 			" Show line numbers
	set showcmd 			" Show command in bottom bar
	set cursorline 			" Highlight current line
	set listchars=tab:▸\ ,eol:¬	" Change charachters for invisibles
	"set lazyredraw 		" Redraw only when we need to
	let NERDTreeShowHidden=1	" Show hidden files in NERDtree.
	let b:javascript_fold=1
" }}}

" Searching {{{
	set incsearch 			" Search as you type
	set hlsearch 			" Highlight matches
" }}}

" Movement {{{
	" move to beginning/end of line
	nnoremap B ^
	nnoremap E $
" }}}

" Syntastic {{{
	" Recommended settings
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
"}}}

" Help {{{
	" c - Change
	" r - Replace 
	"
	" zR - Opens all folds
	" zM - Closes all folds
	" zf - Create fold
	"
	" gt - go to next tab
	" gT - go to previous tab
	" {i}gt - go to tab in position i
	"
	" Vip - Select css selector etc"{{{"}}}
	" vep - Copy word (Visual select to the End and Put).
	"
	" CTRL + h - back one character
	" CTRL + w - back one word
	" CTRL + u - back to the beginning of the line.
	"
	" CTRL + F - Page down
	" CTRL + B - Page up
	"
	" CTRL + V - Start Visual select block mode. Select and type I for
	" inserting text, A for appending  text.
	" http://vim.wikia.com/wiki/Inserting_text_in_multiple_line
	"
	" CTRL + P - Opens ctrlp
	" CTRL + v - Opens ctrlp file in vertical split
	" CTRL + x - Opens ctrlp file in horizontal split
	" CTRL + t - Opens ctrlp file in new tab
	"
	" gf - Goto File
	" CTRL + o - Go back to previous file
	"
	" Search and replace
	" :%s/word/replacement/gc - Search global and ask for confirmation
 "}}}


" vim:foldmethod=marker:foldlevel=0
