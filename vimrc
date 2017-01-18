" ===VUNDLE AND PLUGINS===
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Yoland's vim plugins
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/buftabs' "tabs on the bottom
Plugin 'henrik/vim-indexed-search' "show which result it is
Plugin 'kien/ctrlp.vim' "open file with <c-p>
Plugin 'Valloric/YouCompleteMe' " auto complete
Plugin 'scrooloose/nerdcommenter' " <leader>cc to comment
Plugin 'scrooloose/nerdtree' "<c-n> to open the directory
Plugin 'scrooloose/syntastic' " check syntacs for languages
Plugin 'vim-airline/vim-airline' " one line status bar on bottom
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'fisadev/vim-isort'
Plugin 'severin-lemaignan/vim-minimap' " minimap
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'Glench/Vim-Jinja2-Syntax' " jinja2 syntax support
Plugin 'vim-scripts/LanguageTool'
Plugin 'lfv89/vim-interestingwords' " highlight multiple words at the same time

Plugin 'taglist.vim'
Plugin 'vimwiki'
"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ===SETTINGS===
"syntax and color theme
syntax enable
set t_Co=256
"Light theme
colorscheme solarized
set background=light
"Dark theme
" colorscheme Tomorrow-Night-Eighties
" set background=dark
" indentation
set ai
set si
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" allow buffer switch without saving
set hidden
" wrap text
set wrap
" highlight search
set hlsearch
set incsearch
" show line number
set number
" have airline on all time
set laststatus=2
" paste toggle
set pastetoggle=<f5>
" disable preview window
set completeopt-=preview

" ===KEY MAPPING===
" tab switching
nnoremap <C-left> :bprev<CR>
nnoremap <C-right> :bnext<CR>
noremap <f1> :bprev<CR>
noremap <f2> :bnext<CR>
"toggle nerd tree
map <C-n> :NERDTreeToggle<CR>
" stop highlight
nnoremap <silent> <C-h> :set hlsearch!<CR>
" copy current filename or path
noremap <silent> <F4> :let @"=expand("%:p")<CR>
" <c-[> open recent files
nnoremap <C-l> :CtrlPMRU<CR>
" <leader>pp open buffer
nnoremap <leader>bb :CtrlPBuffer<CR>
" map <leader>f to find file in NERDTree
nnoremap <Leader>f :NERDTreeFind<CR>
" map <leader>tt toggle taglist
nnoremap <Leader>tt :TlistToggle<CR>
nnoremap <Leader>ty :TlistOpen<CR>3<C-w>h
" avoid using <Esc> key to enter normal mode
inoremap jj <Esc>
cnoremap jj <Esc>
onoremap jj <Esc>

" map <leader>es to Airline whitespace toggle
nnoremap <Leader>ed :AirlineToggleWhitespace<CR>
" map <leader>sc to Syntastic check
nnoremap <Leader>ec :SyntasticToggleMode<CR>


" map <leader>bf to show buffers
" map <leader>jkhl to change to windows
nnoremap <Leader>h :bprev<CR>
nnoremap <Leader>l :bnext<CR>

" map <Leader>n to cnext
nnoremap <Leader>n :cnext<CR>
nnoremap <Leader>p :cprevious<CR>

" map cmap readlink to readlink -f of the current file
command! Readlink execute "echo expand('%:p')"

" map <C-W><C-E> to open a new buffer in current window
nnoremap <C-w><C-e> :enew<CR>

" map <Leader>d to creating done for a wiki line
nmap <Leader>d ^f f]la<s><Esc>A</s><Esc>

" === END OF KEYMAP ===

" For file folding
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Vim 80 character warning
" highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
" match OverLength /\%81v.\+/
set cc=80

" ctrlp can't find file adhoc fix
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = 'ij'

" ctrlp show hidden file:
let g:ctrlp_show_hidden = 0

" disable syntax and whitespace check
let g:syntastic_check_on_wq = 0
let g:aireline#extensions#whitespace#enable = 0

let g:airline#extensions#branch#format = 0

autocmd FileType c,cpp,java,python,vimwiki autocmd BufWritePre <buffer> %s/\s\+$//e

" enable airline tab extension
let g:airline#extensions#tabline#enabled = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Language tool jar location
let g:languagetool_jar='$HOME/bin/languagetool/languagetool-commandline.jar'

"Set js and html tat to 2 char
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=2 sts=2 sw=2 cc=80
autocmd Filetype java setlocal cc=100
autocmd Filetype jinja setlocal ts=2 sts=2 sw=2
autocmd Filetype text setlocal ts=2 sts=2 sw=2 cc=80

" Add argument (can be negative, default 1) to global variable i.
" Return value of i before the change.
function! Incr(...)
  let result = g:i
  let g:i += a:0 > 0 ? a:1 : 1
  return result
endfunction

" Map so visual mode's search find selected text
vnoremap // y/<C-R>"<CR>
