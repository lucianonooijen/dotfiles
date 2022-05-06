let mapleader =" "

call plug#begin()

" General
Plug 'editorconfig/editorconfig-vim'
Plug '/usr/local/opt/fzf'

" Layout
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim' " Distraction free writing

" Functionality  additions
Plug 'mkitt/tabline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'lucianonooijen/vimling' "<leader><leader>d will toggle dead keys
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'terryma/vim-expand-region'
Plug 'junegunn/fzf.vim'
Plug 'kdheepak/lazygit.nvim'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'chr4/nginx.vim'
Plug 'elzr/vim-json'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'maksimr/vim-jsbeautify'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Snippets
Plug 'SirVer/ultisnips'
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

call plug#end()

" Load Pathogen for plugins:
    execute pathogen#infect()
    execute pathogen#helptags()

" General stuff
    colorscheme monokai
    filetype on
    highlight LineNr ctermfg=grey
    syntax on
    set noshowmode
    set encoding=utf-8
    set number
    set relativenumber
    set wildmenu
    set showcmd
    set hlsearch
    set ignorecase
    set smartcase
    set backspace=indent,eol,start
    set autoindent
    set autoread
    set ruler
    set showmatch
    set showmode
    set laststatus=2
    set mouse=nicr

" Shit to make Vim smarter
    set nocompatible
    set si
    set t_Co=256
    set foldenable

" Set word wrap
    set formatoptions=1
    set lbr

" 4 space indent
    filetype plugin indent on
    set smartindent
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab

" Set correct highlighting for some filetypes
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.jsx
    autocmd BufNewFile,BufRead .eslintrc set filetype=json
    autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.groff,*.1 set filetype=groff

" Indicate line 80 and beyond 120
    let &colorcolumn="80,".join(range(120,999),",")

" Allows you to save files you opened without write permissions via sudo
    cmap w!! w !sudo tee %

" Show indentation guides
    set listchars=tab:→_,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
    noremap <Leader>i :set list<cr>
    noremap <Leader>h :set list!<cr>

" Git bindings
    noremap <Leader>g :Git<cr>
    noremap <Leader>c :Git commit<cr>
    noremap <Leader>b :Git blame<cr>
    noremap <Leader>d :Gdiff<cr>

" NeoSnippet
    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)
    xmap <C-k> <Plug>(neosnippet_expand_target)

" Status line plugin
    if !has('gui_running')
        set t_Co=256
    endif
    let g:airline_theme='powerlineish'
    let g:airline_left_sep=''
    let g:airline_right_sep=''
    let g:airline#extensions#wordcount#enabled = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#formatter = 'unique_tail'

" Auto close brackets
    "inoremap " ""<left>
    "inoremap ' ''<left>
    "inoremap ` ``<left>
    "inoremap ( ()<left>
    "inoremap () ()
    inoremap (<CR> (<CR>)<ESC>O
    "inoremap [ []<left>
    inoremap [<CR> [<CR>]<ESC>O
    "inoremap { {}<left>
    inoremap {<CR> {<CR>}<ESC>O

" Copy to and paste from clipboard
    noremap <Leader>y "+y
    noremap <Leader>p "+p

" Disable ex-mode
    nnoremap Q <nop>

" Keys for tab management
    nnoremap <C-t> :tabnew<cr>
    nnoremap <Leader><Left> :tabprevious<cr>
    nnoremap <Leader><Right> :tabnext<cr>
    nnoremap <Leader><Up> :tabfirst<cr>
    nnoremap <Leader><Down> :tablast<cr>

" Key remaps
    map <C-n> :NERDTreeToggle<CR>
    nnoremap F :FZF<cr>
    nnoremap ! :!
    map <c-j> <Plug>(expand_region_expand)
    map <c-k> <Plug>(expand_region_shrink)

" Nerdtree
    let NERDTreeShowHidden=1

" Goyo plugin makes text more readable when writing prose:
    map <F10> :Goyo<CR>
    map <leader>f :Goyo<CR>
    inoremap <F10> <esc>:Goyo<CR>a

" Golang specific
    function! s:build_go_files()
        let l:file = expand('%')
        if l:file =~# '^\f\+_test\.go$'
            call go#test#Test(0, 1)
        elseif l:file =~# '^\f\+\.go$'
            call go#cmd#Build(0)
        endif
    endfunction
    autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
    autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
    autocmd FileType go nmap <leader>t <Plug>(go-test)
    autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
    autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
    autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
    autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
    autocmd FileType go setlocal foldmethod=expr foldexpr=getline(v:lnum)=~'^\s*'.&commentstring[0]
    let g:go_list_type = "quickfix"    " error lists are of type quickfix
    let g:go_fmt_command = "goimports" " automatically format and rewrite imports
    let g:go_auto_sameids = 1          " highlight matching identifiers

" Prettier
    let g:prettier#config#tab_width = 4
    let g:prettier#config#single_quote = 'true'
    let g:prettier#config#trailing_comma = 'all'
    let g:prettier#config#jsx_bracket_same_line = 'true'

" coc.nvim
    let g:coc_global_extensions = [
        \ 'coc-tsserver',
        \ 'coc-json',
        \ 'coc-prettier',
        \ 'coc-rls',
        \ 'coc-pairs',
        \ 'coc-highlight',
        \ 'coc-yaml',
        \ 'coc-docker',
        \ 'coc-go',
        \ ]
    "  function! s:show_documentation()
    "      if (index(['vim','help'], &filetype) >= 0)
    "          execute 'h '.expand('<cword>')
    "      else
    "          call CocAction('doHover')
    "      endif
    "  endfunction
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>coc :CocList commands<cr>
    nmap <silent> <leader>dd <Plug>(coc-definition)
    nmap <silent> <leader>dr <Plug>(coc-references)
    nmap <silent> <leader>di <Plug>(coc-implementation)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    nmap <leader>rn <Plug>(coc-rename)

    command! -nargs=0 Format :call CocActionAsync('format') " Add `:Format` command to format current buffer.
    command! -nargs=? Fold :call   CocAction('fold', <f-args>) " Add `:Fold` command to fold current buffer.
    command! -nargs=0 OR   :call   CocActionAsync('runCommand', 'editor.action.organizeImport') " Add `:OR` command for organize imports of the current buffer.

" Turn off some stuff we don't need
    let g:loaded_ruby_provider = 0
    let g:loaded_perl_provider = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""" FROM LUKE SMITH """""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
    set splitbelow
    set splitright

" Shortcutting split navigation, saving a keypress:
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l

" Open the selected text in a split (i.e. should be a file).
    map <leader>o "oyaW:sp <C-R>o<CR>
    xnoremap <leader>o "oy<esc>:sp <C-R>o<CR>
    vnoremap <leader>o "oy<esc>:sp <C-R>o<CR>

" Replace all is aliased to S.
    nnoremap S :%s//g<Left><Left>

" Interpret .md files, etc. as .markdown
    let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Get line, word and character counts with F3:
    map <F3> :!wc <C-R>%<CR>

" Spell-check set to F6:
    map <F6> :setlocal spell! spelllang=en_us,nl<CR>

" Use urlview to choose and open a url:
    "  :noremap <leader>u :w<Home>silent <End> !urlview<CR>

" Copy selected text to system clipboard (requires xclip installed):
    " vnoremap <C-c> "cy<esc>:!echo -n '<C-R>c' \|<space>xclip<CR><enter>

" Enable Goyo by default for mutt writting
    " Goyo's width will be the line limit in mutt.
    autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=72
    autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo

" Enable autocompletion:
    "  set wildmode=longest,list,full
    "  set wildmenu

" Automatically deletes all tralling whitespace on save.
    autocmd BufWritePre * %s/\s\+$//e

" Disables automatic commenting on newline:
    "  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" For normal mode when in terminals (in X I have caps mapped to esc, this replaces it when I don't have X)
    "  inoremap jw <Esc>
    "  inoremap wj <Esc>
