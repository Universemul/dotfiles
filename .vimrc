set nocompatible " be iMproved, required
set termguicolors
filetype off " required
filetype plugin indent on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugin Vundle

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'preservim/nerdtree'
Plugin 'itchyny/vim-gitbranch'
Plugin 'itchyny/lightline.vim'
Plugin 'google/vim-searchindex'
Plugin 'wincent/ferret'

call vundle#end()

filetype plugin indent on
syntax on
set cursorline
let g:gruvbox_contrast_dark="hard"
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

" open NERDTree where to file is located
function! NTFinderP()
       "" Check if NERDTree is open
       if exists("t:NERDTreeBufName")
           let s:ntree = bufwinnr(t:NERDTreeBufName)
       else
           let s:ntree = -1
       endif
       if (s:ntree != -1)
           "" If NERDTree is open, close it.
           :NERDTreeClose
       else
           "" Try to open a :Rtree for the rails project
           if exists(":Rtree")
               "" Open Rtree (using rails plugin, it opens in project dir)
               :Rtree
           else
               "" Open NERDTree in the file path
               :NERDTreeFind
           endif
       endif
endfunction

" Key mapping
"map <C-n> :NERDTreeToggle<CR>
map <C-n> :call NTFinderP()<CR>

" Config lightline
set noshowmode
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
  

" Generic config
set number
set wrap " wrap lines
set showmatch " highlight matching () {} or []
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set autoindent
set hlsearch
set incsearch
