" ===VUNDLE AND PLUGINS===
call plug#begin('~/.vim/plugged')

" Yoland's vim plugins
Plug 'ervandew/supertab'
Plug 'vim-scripts/buftabs' "tabs on the bottom
Plug 'henrik/vim-indexed-search' "show which result it is
Plug 'ctrlpvim/ctrlp.vim' "open file with <c-l>
Plug 'Valloric/YouCompleteMe' " auto complete
Plug 'scrooloose/nerdcommenter' " <leader>cc to comment
Plug 'scrooloose/nerdtree' "<c-n> to open the directory
Plug 'scrooloose/syntastic' " check syntacs for languages
Plug 'vim-airline/vim-airline' " one line status bar on bottom
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'fisadev/vim-isort'
Plug 'severin-lemaignan/vim-minimap' " minimap
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'maksimr/vim-jsbeautify'
Plug 'einars/js-beautify'
Plug 'Glench/Vim-Jinja2-Syntax' " jinja2 syntax support
Plug 'vim-scripts/LanguageTool'
Plug 'lfv89/vim-interestingwords' " highlight multiple words at the same time
Plug '~/.vim/bundle/taglist.vim'
Plug '~/.vim/bundle/vimwiki'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()

" ===SETTINGS===
"syntax and color theme
syntax enable
set t_Co=256
colorscheme solarized
let g:airline_theme='solarized'
set background=light

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
nnoremap <C-S-a> :CtrlPMixed<CR>
" " <leader>pp open buffer
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

" map <c-p> to :FZF
nnoremap <c-p> :FZF<CR>

" map <leader>es to Airline whitespace toggle
nnoremap <Leader>ed :AirlineToggleWhitespace<CR>
" map <leader>sc to Syntastic check
nnoremap <Leader>ec :SyntasticToggleMode<CR>

" map <leader>ec to toggle Eclim disalbe/enable
nnoremap <Leader>ee :call EclimToggle()<CR>

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

autocmd VimEnter * call EclimSoftDisable()

" ctrlp can't find file adhoc fix
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_map = '<c-l>'
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = 'ij'

let g:ctrlp_max_files = 100
let g:ctrlp_max_depth=3


"" ctrlp show hidden file:
let g:ctrlp_show_hidden = 0

" disable syntax and whitespace check
let g:syntastic_check_on_wq = 0
let g:aireline#extensions#whitespace#enable = 0

" set EclimJavaSearch result action:
let g:EclimJavaSearchSingleResult = 'edit'

" set airline bar to show whether Eclim is avaible
let g:airline_section_b = '%{IsEclimOk()}'
let g:airline_section_z = airline#section#create([':%3v'])
let g:airline#extensions#eclim#enabled = 1
let g:airline#extension#default#section_truncate_width = {
    \ 'b': 80,
    \ 'x': 100,
    \ 'y': 100,
    \ 'warning': 40,
    \ 'error': 40,
    \ }

let g:airline#extensions#branch#format = 0

autocmd FileType c,cpp,java,python,vimwiki autocmd BufWritePre <buffer> %s/\s\+$//e

" enable airline tab extension
let g:airline#extensions#tabline#enabled = 1

"" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" Let YCM work with Eclim
let g:EclimCompletionMethod = 'omnifunc'

" Language tool jar location
let g:languagetool_jar='$HOME/bin/languagetool/languagetool-commandline.jar'

let g:syntastic_python_checker_args='--ignore=E111'
let g:syntastic_python_flake8_args='--ignore=E111,E129,E501'

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

" Wild ignore files
set wildignore+=*/.git/*,*/.idea/*,*/.DS_Store,*/system-settings/bin/*

"" Light and dark mode
" colorscheme solarized
" let g:airline_theme='solarized'
" set background=light
" colorscheme Tomorrow-Night-Eighties
" let g:airline_theme='base16_mocha'
" set background=dark


