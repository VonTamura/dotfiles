" ---------------------------------------------------------------------------
" General
"---------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" --------------------------------------------------------------------------
" Vundle
" --------------------------------------------------------------------------
"Default
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}


"Typing
"Plugin 'vim-ruby/vim-ruby'
Plugin 'elixir-lang/vim-elixir'
Plugin 'tpope/vim-surround' "Surround text visual mode:(S[)
Plugin 'mattn/emmet-vim' "Autocompletion html tags ( C-y-, ) 
Plugin 'gregsexton/matchtag'	  " matching HTML tags (?)
Plugin 'jiangmiao/auto-pairs'      " Insert or delete brackets, parens, quotes in pair

"Colors and Themes
"Plugin 'dracula/vim', { 'name': 'dracula' }
"Plugin 'bluz71/vim-nightfly-guicolors'
Plugin 'wadackel/vim-dogrun'
Plugin 'flazz/vim-colorschemes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vwxyutarooo/nerdtree-devicons-syntax'

"Git
Plugin 'airblade/vim-gitgutter'

"Tools
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}  "require install coc marketplace
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline' " custom bars lineinfo
Plugin 'ericbn/vim-relativize' " line numbers
Plugin 'Lokaltog/vim-easymotion' 
Plugin 'scrooloose/nerdcommenter' " Comment line <leader>cc
Plugin 'ivalkeen/nerdtree-execute' "nerdtree execute option m, x current sistem app
Plugin 'turbio/bracey.vim'    "  liveView html construction :Bracey actives (install node, npm install --prefix server on plugin dir)
Plugin 'mbbill/undotree' "timelapse versions

"Personal Plugins
"set rtp+=/usr/local/opt/fzf "fzf complement (?)
"Plugin 'scrooloose/syntastic'  " check youre syntax errors
"Plugin 'kien/ctrlp.vim'
"Plugin 'sonicpi.vim'          " Syntax highlighting for sonic pi and ruby files
"Plugin 'othree/yajs.vim'
"Plugin 'pangloss/vim-javascript'

"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ----------------------------------------------------------------------------
" Indent
" ----------------------------------------------------------------------------
"filetype indent on  
set colorcolumn=80

" ----------------------------------------------------------------------------
" Config 
" ----------------------------------------------------------------------------
"Airline
let g:airline#extensions#tabline#enabled = 1

"FZF
let g:fzf_preview_window = ['right:40%', 'ctrl-/']

nnoremap <silent> <C-f> :Files<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-o': ':r !echo'}

""Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
"let g:syntastic_Ruby_exec = 'path/to/ruby/executable'
"let g:syntastic_javascript_checkers = ['standard']
"let g:syntastic_html_tidy_exec = 'tidy5'
""javascript syntax
"let g:javascript_plugin_flow = 1


"Relativize
set number
set mouse+=a

"colorscheme
syntax on
colorscheme dogrun 

"Search
:set hlsearch
:set incsearch

"NerdFont
set encoding=utf-8

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

" ----------------------------------------------------------------------------
