set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

execute vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Vimjas/vim-python-pep8-indent'
Bundle "lepture/vim-jinja"
Plugin 'mitsuhiko/vim-python-combined'
Plugin 'preservim/tagbar'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'fisadev/FixedTaskList.vim'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/vim-monotone'
Plugin 'logico/typewriter'

execute vundle#end()

execute pathogen#infect()

syntax clear
syntax on

filetype indent plugin on

set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

set mouse=a



"theming


set rtp+=~/.vim/bundle/vim-minimap
let g:minimap_highlight='deniteStatusLineNumber'

set rtp+=~/.vim/bundle/oceanic-material

let g:oceanic_material_transparent_background = 1

set laststatus=2

let g:airline_detect_paste=1

let g:airline#extensions#tabline#enabled = 1

let g:airline_theme='minimalist'

colorscheme  shoji_shiro

hi Normal       ctermbg=NONE guibg=NONE
hi SignColumn   ctermbg=235 guibg=#262626
hi LineNr       ctermfg=grey guifg=grey ctermbg=NONE guibg=NONE
hi CursorLineNr ctermbg=NONE guibg=NONE ctermfg=178 guifg=#d7af00

let g:gitgutter_set_sign_backgrounds = 0

"whitespace highlights
"match ExtraWhitespace /\s\+$/
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()

"ALE
hi clear ALEErrorSign
hi clear ALEWarningSign
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '??'
hi Error    ctermfg=204 ctermbg=NONE guifg=#ff5f87 guibg=NONE
hi Warning  ctermfg=178 ctermbg=NONE guifg=#D7AF00 guibg=NONE
hi ALEError ctermfg=204 guifg=#ff5f87 ctermbg=52 guibg=#5f0000 cterm=undercurl gui=undercurl
hi link ALEErrorSign    Error
hi link ALEWarningSign  Warning

let g:ale_linters = {
            \ 'python': ['pylint'],
            \ 'javascript': ['eslint'],
            \ 'go': ['gobuild', 'gofmt'],
            \ 'rust': ['rls'],
	    \ 'cpp': ['cpp', 'cppcheck', 'cppclean', 'cpplint', 'flawfinder', 'gcc']
            \}
let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['autopep8'],
            \ 'javascript': ['eslint'],
            \ 'go': ['gofmt', 'goimports'],
            \ 'rust': ['rustfmt']
            \}
let g:ale_fix_on_save = 1

"airline

let g:airline#extensions#tabline#enabled = 1
"let g:airline_section_warning =
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffers_label = '%{strftime("%h %d %H:%M")}'

if (has('nvim'))
	let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if has('nvim')
	" Enable deoplete when InsertEnter.
	let g:deoplete#enable_at_startup = 0
	autocmd InsertEnter * call deoplete#enable()

	set belloff=""
	call deoplete#custom#source('_',  'max_menu_width', 0)
	call deoplete#custom#source('_',  'max_abbr_width', 0)
	call deoplete#custom#source('_',  'max_kind_width', 0)

	set hidden
	let g:LanguageClient_serverCommands = {
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ 'go': ['~/.go/bin/gopls']
        \ }
endif

"NERDtree
autocmd VimEnter * NERDTree | wincmd p

"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"    \ quit | endif

let g:ale_completion_autoimport = 1
let g:ale_change_sign_column_color = 1
let g:ale_completion_enabled = 1

"nertree tabs
let g:nerdtree_tabs_open_on_console_startup = 1

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_checkers = ['cpp', 'cppcheck', 'cppclean', 'cpplint', 'flawfinder', 'gcc']

let g:syntastic_cpp_remove_include_errors = 1

"vim-hug
"let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
"let $NVIM_PYTHON_LOG_LEVEL="DEBUG"

"deoplete
"let g:deoplete#enable_at_startup = 1
"set pyxversion=

function! PlayAA()
	silent! exec '!killall afplay &'
	silent! exec '!afplay ~/.vim/bundle/sounds/aquaticAmbience.aiff &'
	let s:oceanic_material_background = get(g:,'oceanic_material_background','ocean')
	let g:airline#extensions#tabline#buffers_label = '▶ Aquatic Ambience | %{strftime("%h %d %H:%M")}'
	bufdo! e
	redraw!
endfunction

function! PlayJRB()
	silent! exec '!killall afplay &'        
	silent! exec '!afplay ~/.vim/bundle/sounds/jollyRogerBay.aiff &'
	let s:oceanic_material_background = get(g:,'oceanic_material_background','ocean')
	let g:airline#extensions#tabline#buffers_label = '▶ Jolly Roger Bay | %{strftime("%h %d %H:%M")}'
	bufdo! e
	redraw!
endfunction

function! StopMusic()
	silent! exec '!killall afplay &'
	let g:oceanic_material_background = '#282c34'
        let g:airline#extensions#tabline#buffers_label = '%{strftime("%h %d %H:%M")}'
        bufdo! e
	redraw!
endfunction



let g:indent_guides_enable_on_vim_startup = 0
nmap <F6> :IndentGuidesToggle<CR>
nmap <F7> :TaskList<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>

nmap nt :NERDTree<CR>
nmap tt :wincmd l<CR>
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"tab width
set expandtab
set shiftwidth=4
set autoindent
set smartindent


"autocmd VimEnter * :Minimap
"
" Color\
