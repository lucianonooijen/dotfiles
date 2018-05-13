" Pathogen
execute pathogen#infect()

" General stuff
" colorscheme monokai_pro
colorscheme monokai
filetype on
highlight LineNr ctermfg=grey
syntax on
set noshowmode
set encoding=utf-8
set number
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set ruler
set showmatch
set showmode
set laststatus=2

" Shit to make Vim smarter
set nocompatible
set si
set t_Co=256
set foldenable

" Set word count
let g:airline#extensions#wordcount#enabled = 1  
let g:airline_left_sep=''
let g:airline_right_sep=''

" 4 space indent
filetype plugin indent on
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Prettier
let g:prettier#config#tab_width = 4
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#jsx_bracket_same_line = 'true'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" Nerdtree
" autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Misc plugin settings
" let g:indent_guides_enable_on_vim_startup = 1
let g:syntastic_javascript_checkers=['eslint']

" Js Beautify
map <c-b> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-b> :call JsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-b> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-b> :call JsxBeautify()<cr>
autocmd FileType html noremap <buffer> <c-b> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-b> :call CSSBeautify()<cr>
