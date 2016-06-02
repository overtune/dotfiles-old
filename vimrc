set nocompatible " Run in Vim mode
set number " Show line numbers
set hls " Hightligt search results
set nrformats= " We want decimal numbers, not octal
set history=200 " Store the last 200 commands
set timeoutlen=1000 " Set mapping delay to 1000 (standard)
set ttimeoutlen=0 " Set key code delay to 0.
set hidden " Enable hidden buffers, so we don't get a warning when running :bnext and have unsaved changes
set incsearch " Enable incsearch, which hihlight matches as you type
filetype plugin on " Enable plugins
runtime macros/matchit.vim "Adds % jump between tags and if/else amongst other. 

" Map to easier navigate buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

inoremap jk <esc>

" Use <leader>ev to edit vimrc.
nnoremap <leader>ev :tabedit $MYVIMRC<CR>

" Use ' to jump to mark with preserved column
nnoremap ' `

" Type %% to get current file path (usefull for example with the :edit command
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" https://github.com/tpope/vim-commentary
" http://github.com/tpope/vim-surround // See page 129.
