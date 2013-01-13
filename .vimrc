"./configure --with-features=BIG --enable-pythoninterp=yes --enable-multibyte=yes --enable-cscope=yes
"./configure --enable-pythoninterp=yes --enable-multibyte=yes --enable-gui=auto

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General system wide setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme/colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme zenburn "my favourite
"colorscheme desert  "my other favourite
colorscheme desert256

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tabs/spaces
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
"set expandtab

" Basic options
"set encoding=utf-8
set scrolloff=4 "always show 4 lines above and beyond cursor pos
set ruler
set autoindent
set showmode
set showcmd
set hidden
set novb
set history=1000 "How many lines of history to remember
set undolevels=1000
set number "line numbers
set whichwrap+=<,>,[,] " arrow keys wraps to next/previous line
set backspace=indent,eol,start
set laststatus=2 "always show status line
" Maki GUI File Open use current directory
set browsedir=buffer
set nowrap
set modeline
"set relativenumber
" set foldmethod=marker
"no visualbell or beep, just silence
set novb
set noeb
set vb t_vb=

"Backups
set nobackup
set noswapfile
"set backupdir=~/.vim/tmp/backup// " backups
"set directory=~/.vim/tmp/swap//   " swap files
"set backup                        " enable backups

" Leader
let mapleader = ","

" searching
set incsearch "incremental search
set ignorecase "clever search
set smartcase
set showmatch
set hlsearch
"set gdefault
map <leader><space> :noh<cr>

" Show whitespace
set list listchars=tab:»·,trail:·,extends:#

" colorscheme (terminal)
syntax on
set background=dark
"colorscheme desert
" Search for terminal is ugly
"hi Search term=standout ctermfg=0 ctermbg=3
"colorscheme solarized

" NERD Tree
map <F2> :NERDTreeToggle<cr>
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$']

" Use the damn hjkl keys
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>

" And make them fucking work, too.
nnoremap j gj
nnoremap k gk

" Easy buffer navigation
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l
map <leader>w <C-w>v<C-w>l
map <C-PageDown> :bn<CR>
map <C-PageUp> :bp<CR>

" Fuck you, help key.
"set fuoptions=maxvert,maxhorz
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Clean whitespace
map <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Yankring
nnoremap <silent> <F3> :YRShow<cr>
nnoremap <silent> <leader>y :YRShow<cr>

nmap <leader>m :make<cr>

" Save when losing focus
"au FocusLost * :wa

" pastekey
set pastetoggle=<F4>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" font
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guifont=proggycleanTT\ 12
"set guifont=monospace\ 8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ecs is so far far avay...
imap <silent> jj <esc>

" open new file dialog ,b
map ,b :browse confirm e<cr>

"make it easy to update/reload_vimrc
:nmap ,s :source $VIM/_vimrc
:nmap ,v :e $HOME/.vimrc 

"search for visually highlighted text
:vmap // y/<C-R>"<CR>

"Pressing F5 lists all buffer, just type number
map <F5> :ls<CR>:e #

"first level heading
map H1 yypVr=o
"second level heading
map H2 yypVr-o
"third level heading
map H3 yypVr^o
"map h3 :s/\(.*\)/-\1-/<cr>o

"toggle menu on or off for gui-version
map <silent> <S-F3> :if &guioptions =~# 'T' <Bar>
                        \set guioptions-=T <Bar>
                        \set guioptions-=m <Bar>
                     \else <Bar>
                        \set guioptions+=T <Bar>
                        \set guioptions+=m <Bar>
                     \endif<CR>

"cycle through buffers
map <C-Tab> <ESC>:bn<CR>
map <C-S-Tab> <ESC>:bp<CR>

"scroll with line in center
map <C-Up> <ESC>0kzz
map <C-Down> <ESC>0jzz

map <F6> <Esc>:setlocal spell spelllang=en_us<CR>
map <F7> <Esc>:setlocal nospell<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
" (thanks Douglas Potts)
map ,cd :cd %:p:h<CR>

" pull full path name into paste buffer for attachment to email etc
nnoremap <F9> :let @*=substitute(expand("%:p"), "/", "\\", "g")<cr>

" remove trailing whitespace
nnoremap <silent> <F12> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

map <F10> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tabs spaces
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Think "little tabs" and "big tabs":
map ,t <Esc>:set expandtab tabstop=4 shiftwidth=4<CR>
map ,T <Esc>:set noexpandtab tabstop=8 shiftwidth=8<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au FileType python source c:/program files/vim/vimfiles/scripts/python.vim
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
let python_highlight_all=1

"turn off all beeping and flashing
set noeb vb t_vb=
au GUIEnter * set vb t_vb=

"latex stuff
"map l1 69I%j2I%<ESC>dd2p69I%<ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" good command to know
" ====================
" :echo $VIM
" :echo $HOME
" :%s/\s\+$//   remove whitespace @ end of line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer mangement
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iabbrev EMP Ericsson Mobile Platforms

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spelllang=en_us
set spellsuggest=5

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Baloons
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set ballooneval
"set balloondelay=400
"set balloonexpr=FoldSpellBalloon()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
