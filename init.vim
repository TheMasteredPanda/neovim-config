set number
set nocompatible
set tabstop=4
set expandtab
set shiftwidth=4
set timeoutlen=1000 
set ttimeoutlen=0
set noswapfile
set clipboard=unnamedplus

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
"Plug 'jiangmiao/auto-pairs'
call plug#end()

colorscheme gruvbox
set completeopt=menu,menuone,noselect

source ~/.config/nvim/configs/lsp-config.vim
luafile ~/.config/nvim/configs/cmp.config.lua


"sync open file with NERDTree
 " Check if NERDTree is open or active
function! IsNERDTreeOpen()		  
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
	NERDTreeFind
	wincmd p
  endif
endfunction


let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'*': [], 'python': ['black', 'trim_whitespace', 'isort']}
let g:ale_fix_on_save = 1
autocmd FileType python map <buffer> <F7> :call flake8#Flake8()<CR>
