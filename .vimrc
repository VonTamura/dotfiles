" ---------------------------------------------------------------------------
" General
"---------------------------------------------------------------------------
set history=1000
filetype plugin indent on
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call plug#begin()
let mapleader = ","
" --------------------------------------------------------------------------
" Vundle
" --------------------------------------------------------------------------
"Instaler (Vundle)
"Plug 'VundleVim/Vundle.vim'

"Language
Plug 'sheerun/vim-polyglot' "multilenguage highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}  "require install coc marketplace
"Plug 'dense-analysis/ale'
"Plug 'editorconfig/editorconfig-vim'

"Typing
Plug 'mattn/emmet-vim' "Autocompletion html tags ( C-y-, ) 
Plug 'gregsexton/matchtag'	  " matching HTML tags (?)
Plug 'tpope/vim-surround' "Surround text visual mode:(S[)
Plug 'jiangmiao/auto-pairs'      " Insert or delete brackets, parens, quotes in pair
Plug 'jwhitley/vim-matchit'
"Plug 'rstacruz/sparkup', {'rtp': 'vim/'} "html faster

"Colors, interface, Themes
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'ericbn/vim-relativize' " line numbers
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline' " custom bars lineinfo
Plug 'ghifarit53/tokyonight-vim' "colorscheme
"Plug 'dracula/vim', { 'name': 'dracula' } "colorscheme
"Plug 'wadackel/vim-dogrun' "colorscheme
"Plug 'bluz71/vim-nightfly-guicolors' "colorscheme

"Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"Tools
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Lokaltog/vim-easymotion' 
Plug 'scrooloose/nerdcommenter' " Comment line <leader>cc
Plug 'ivalkeen/nerdtree-execute' "nerdtree execute option m, x current sistem app
Plug 'mbbill/undotree' "timelapse versions
Plug 'ap/vim-css-color'   "preview css-colors
Plug 'c9s/bufexplorer'
Plug 'vim-test/vim-test' "for runing code testing
"Plug 'turbio/bracey.vim'    "  liveView html construction :Bracey actives (install node, npm install --prefix server on plugin dir)

"All of your Plugs must be added before the following line
"call vundle#end()            " required
call plug#end()            " required

" ----------------------------------------------------------------------------
" Indent
" ----------------------------------------------------------------------------
"filetype indent on  
set colorcolumn=80
"Indent / tabs / spaces
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

"movement
set backspace=indent,eol,start

" ----------------------------------------------------------------------------
" Config 
" ----------------------------------------------------------------------------
let g:jsx_ext_required = 1
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
set wildmenu
set wildoptions=pum
"buffer hidden
set hidden

"Airline
let g:airline#extensions#tabline#enabled = 1


"FZF
let g:fzf_preview_window = ['right:40%', 'ctrl-/']

nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-t> :Rg<CR>

let g:fzf_action = {
  \ 'ctrl-s': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-t': 'vsplit',
  \ 'ctrl-o': ':r !echo'}

"Relativize
set number
set mouse+=a

"colorscheme
syntax on
set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
"colorscheme gruvbox_von
"colorscheme solarized8_light
"colorscheme dracula

"Search
:set hlsearch
:set incsearch

"NerdFont
set encoding=utf-8
scriptencoding utf-8
set undodir=~/.vim/undodir
set undofile
set noswapfile
set nobackup

"undotree config  persistent undo
if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif
" ---------------------------------------------------------------------------
"  Open URL on current line in browser
" ---------------------------------------------------------------------------

"function! Browser ()
"  let line0 = getline (".")
"  let line = matchstr (line0, "http[^ )]*")
"  let line = escape (line, "#?&;|%")
"  exec ':silent !open ' . "\"" . line . "\""
"endfunction
"map <F2> :call Browser ()<CR>

" ----------------------------------------------------------------------------
" NERDTree
" ----------------------------------------------------------------------------
" nnoremap <leader>nf :NERDTreeFind<cr>
nmap <C-n> :call NERDTreeToggleInCurDir()<cr>
" Open Nerdtree
let g:NERDTreeWinPos = "right"
let NERDTreeMapOpenInTab='\r'
"autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != '')
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
endfunction

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" ----------------------------------------------------------------------------
" Keymaping
" ----------------------------------------------------------------------------
"  Copy on clipboard
set clipboard=unnamed "copy on clipboard with yank (y)

" Open current file on chrome
nnoremap <F2> :!open %<CR><CR>

"undotree
nnoremap <F5> :UndotreeToggle<CR>

"figitive (git)
nmap <silent><leader>gb :G blame<CR>
nmap <silent><leader>gs :Git<CR>
nmap <silent><leader>gd :G diff<CR>
nmap <silent><leader>gl :G log<CR>
nmap <silent><leader>gc :Git commit<CR>
nmap <silent><leader>gP :Git push<CR>
nmap <silent><leader>gp :Git pull<CR>

"change between panes
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

"testing
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>

"new 
noremap <silent>\] :sp new<CR>
noremap <silent>\[ :vsp new<CR>

" ----------------------------------------------------------------------------
" Conquer of Completion
" ----------------------------------------------------------------------------
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"set signcolumn=yes

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

" Enable suggest.noselect for bug select first option in coc-config.json whit
" :CocConfig
let g:coc_global_extensions = [ 
      \ 'coc-eslint8',
      \ 'coc-prettier']


" For large archives =
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
