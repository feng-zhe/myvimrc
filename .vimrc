set encoding=utf-8
" not compatible to vi
set nocompatible

"line numbers
set nu

"highlighting
syntax on

"autoload file type specific settings
filetype plugin indent on

"indent
set autoindent
"set smartindent " because of python comment issue
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" nerdtree size
let g:NERDTreeWinSize=45

" fix an issue on mac
set backspace=2

" so that vim will read local .vimrc
set exrc
set secure

" Plugins
call plug#begin('~/.vim/plugged')
" General
Plug 'micha/vim-colors-solarized'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
" react dev specific
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
call plug#end()

" solarized colorscheme
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

" Disable the highlight rescan only when I enter js/ts files.
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" key maps
map <c-f> :call JsxBeautify()<cr>
map <C-n> :NERDTreeToggle<CR>
