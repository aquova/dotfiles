" Austin Bricker vimrc

set background=dark
let &t_Co=256 " Enables true color in Terminal
colorscheme onedark

" Enables Pathogen plugin helper
execute pathogen#infect()

syntax enable           " Turn on syntax highlighting
set encoding=utf-8

set tabstop=4           " Num of spaces in tab
set softtabstop=4       " Num of spaces in tab when editing
set shiftwidth=4        " Indenting with '>'
set expandtab           " Tabs are spaces
set breakindent         " Word wrap indents to prior indent spot

set number              " Shows line numbers
set showcmd             " Shows most recent command

set cursorline          " Highlights current line
filetype indent on      " Load filetype-specific indent files

set wildmenu            " Visual autocomplete for command menu
set lazyredraw          " Only redraw when needed

set showmatch           " Highlight matching [{()}]

set incsearch           " Search as characters are entered
set hlsearch            " Highlight matches

set hidden              " Allows switching buffers without saving
set nostartofline       " Keeps cursor in same column when switching buffers

set mouse=a             " Enables the mouse in terminal Vim
set backspace=2         " Makes backspace behave as expected
set conceallevel=0      " All text is shown
set notimeout           " Removes timeout on leader key

set splitright          " Opens new vertical splits on the right
set splitbelow          " Opens new horizontal splits below

set guioptions=         " Removes all scrollbars

set diffopt=vertical    " Open Vimdiff operations in vertical windows

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Moves vertically by visual line, not literal
nnoremap j gj
nnoremap k gk

" Remaps beginning/end of line
nnoremap B ^
vnoremap B ^
nnoremap E $
vnoremap E $

nnoremap J :bp<CR>
nnoremap K :bn<CR>

" Now remap gJ to the old J function
nnoremap gJ J <CR>

" jk is escape
inoremap jk <esc>

" Easily add empty lines
nnoremap [<space> :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space> :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" Set leader to ,
let mapleader=","

" Loads vimrc bindings
nnoremap <leader>sv :source $MYVIMRC<CR>

" Center text after jumping to beginning/end of window
nnoremap L L<bar>zz <CR>
vnoremap L L<bar>zz <CR>
nnoremap H H<bar>zz <CR>
vnoremap H H<bar>zz <CR>

" Replace typing :noh
nnoremap <leader><space> :noh<CR>

" % is annoying
nnoremap <tab> %
vnoremap <tab> %

" Set Y to be the same as y$
nnoremap Y y$
vnoremap Y y$

" Modified version of bd that doesn't delete window splits
command! Bd bp|bd #

" Create function that removes trailing whitespace
fun! RemoveWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

" Can remove whitespace by calling ':RemoveWhitespace'
command! RemoveWhitespace call RemoveWhitespace

" Can call RemoveWhitespace with Leader-w
:noremap <Leader>w :call RemoveWhitespace()<CR>

" Calls RemoveWhitespace when buffer is written
autocmd BufWritePre * :call RemoveWhitespace()

" Hex edit
nmap <Leader>he :%!xxd<CR> :set filetype=xxd<CR>

" Hex return
nmap <Leader>hr :%!xxd -r<CR> :set binary<CR> :set filetype=<CR>

" Disable error beeping
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Change cursor type in different modes
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[1 q\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\e[4 q\<Esc>\\"
else
    let &t_SI = "\e[6 q" " Insert mode
    let &t_EI = "\e[1 q" " Normal mode
    let &t_SR = "\e[4 q" " Replace mode
endif

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[1 q"
augroup END

" Change cursor color to match airline tab color
" Made for the One Dark color scheme

" Default Colors for CursorLine (Normal mode)
highlight Cursor guibg=#98c379

" Change Color when entering Insert Mode, revert when leaving
autocmd InsertEnter * highlight  Cursor guibg=#61afef
autocmd InsertLeave * highlight  Cursor guibg=#98c379

" Vim plugin configs:
" Enables vim-airline buffer list by default
let g:airline#extensions#tabline#enabled = 1
" Custom tabline settings
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'Buf: %{bufnr("%")}'

" Commenting codes for commentary.vim:
autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType ruby setlocal commentstring=#\ %s
autocmd FileType html setlocal commentstring=<!--\ %s\ -->
autocmd FileType vim setlocal commentstring=\"\ %s
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType htmldjango setlocal commentstring=<!--\ %s\ -->
autocmd FileType pico8 setlocal commentstring=--\ %s
autocmd FileType lua setlocal commentstring=--\ %s
autocmd FileType arduino setlocal commentstring=//\ %s
autocmd FileType make setlocal commentstring=#\ %s
autocmd FileType coffee setlocal commentstring=#\ %s
autocmd FileType asm setlocal commentstring=;\ %s
autocmd FileType sh setlocal commentstring=#\ %s
autocmd FileType applescript setlocal commentstring=--\ %s
autocmd FileType rust setlocal commentstring=//\ %s

" Set syntax highlighting for unknown file extension
autocmd BufNewFile,BufRead *.tic set syntax=lua
autocmd BufNewFile,BufRead *.command set syntax=sh
autocmd BufNewFile,BufRead *.cr set syntax=ruby

" Different tab behavior for different filetype
autocmd FileType pico8 setlocal shiftwidth=1 tabstop=1 softtabstop=1
autocmd FileType make setlocal noexpandtab

" Turn off indentLine for markdown and json as it overrides conceallevel
autocmd FileType markdown let g:indentLine_enabled=0
autocmd FileType json let g:indentLine_enabled=0

" Airline tab theme settings
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
set guifont=Roboto\ Mono\ for\ Powerline:h11

let g:airline_left_sep='▓▒░'
let g:airline_right_sep='░▒▓'

" Fixes messed up symbols with powerline tab font
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

nnoremap <leader>u :UndotreeToggle<CR>
