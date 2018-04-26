" This. Is. Vim.
set nocompatible
" Dvorak remap
" - Movement Keys -> remap hjkl to htns
" - (gj and gk move by visual lines, if the line is wrapped for instance)
noremap h h
noremap t gj
noremap n gk
noremap s l
" - Replacing things we just mapped away
" - S goes to bottom of screen
noremap S L
" - j / J Jerk and replace a char / line
noremap j s
noremap J S
" - k / K keep searching thru search matches
noremap k n
noremap K N
" - l / L looks forward or backward to a
noremap l t
noremap L T
" - T puts lines together
noremap T J
" General Use
" - Encoding
set encoding=utf-8
" - Misc
let mapleader = ","               " set leader key to comma
syntax enable                     " show syntax highlighting
filetype plugin indent on
set autoindent                    " set auto indent
" Spaces. Not. Tabs (for the moment?)
set tabstop=2                     " set indent to 2 spaces
set shiftwidth=2
set expandtab                     " use spaces, not tab characters
set softtabstop=2                 " spaces per tab (if present)
" set relativenumber
set number                        " show line numbers
set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set list listchars=tab:»·,trail:· " show extra space characters
set nofoldenable                  " disable code folding
set clipboard=unnamed             " use the system clipboard
" Auto Complete and the like...
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
set wildignore+=node_modules/**
set omnifunc=syntaxcomplete#Complete
set complete=.,b,u,]
set nowrap
set backspace=indent,eol,start    " allow backspace over these...
set confirm                       " rather than fail b/c unsaved changes, raise a dialogue
set lazyredraw                    " dont redraw during complex operations...
set cmdheight=2
set mouse=a                       " enable mouse for all modes
set nostartofline                 " disables the very vi specific behavior of going back to the start of a line all the time
set showtabline=2                 " always show tab line
set showcmd                       " show partial commands on last line
set shell=bash                    " enable bash aliases from vim shell
set switchbuf=useopen             " when opening a file, jump to the open version - if there is one
" Split plane navigation, using leader key as ctrl + s will not work...
" nmap <silent> <leader>n :wincmd k<CR>
" nmap <silent> <leader>t :wincmd j<CR>
" nmap <silent> <leader>h :wincmd h<CR>
" nmap <silent> <leader>s :wincmd l<CR>
" More natural splitting behavior
set splitright
set splitbelow
au VimResized * :wincmd =         " auto rebalance windows on resizing
" - Allow mouse resizing in Tmux
if exists('$TMUX')
  set ttymouse=xterm2
endif
" Colors
colorscheme solarized
set background=light
" Airline
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 0 " switch off the powerline glyphs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
" Tmuxline
let g:tmuxline_powerline_separators = 0 " switch off the powerline glyphs
" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_typescript_checkers=['tsuquyomi']
let g:syntastic_solidity_checkers=['solc']
"let g:syntastic_python_checkers=['flake8']
" Vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
" - the defaults will not work with dvorak rempapping
nnoremap <silent> <leader>h :TmuxNavigateLeft<cr>
nnoremap <silent> <leader>t :TmuxNavigateDown<cr>
nnoremap <silent> <leader>n :TmuxNavigateUp<cr>
nnoremap <silent> <leader>s :TmuxNavigateRight<cr>
nnoremap <silent> <leader>p :TmuxNavigatePrevious<cr>
" FZF
set rtp+=/usr/local/opt/fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" Tsuquyomi
let g:tsuquyomi_disable_quickfix = 1 " we are going to let Syntastic do it.
" cleverTab -- read yer vim docs!
function! CleverTab()
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
" nerdCommenter
let g:NERDSpaceDelims = 1
l
