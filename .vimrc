let mapleader =" "

call plug#begin('~/.vim/plugged')

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

" Searching
Plug 'junegunn/fzf.vim'
Plug 'Shougo/denite.nvim'

" Functionality  additions
Plug 'scrooloose/nerdcommenter'
Plug 'jreybert/vimagit' " :Magit
Plug 'lucianonooijen/vimling' "<leader><leader>d will toggle dead keys
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'terryma/vim-expand-region'

" Syntax
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'sheerun/vim-polyglot'
Plug 'chr4/nginx.vim'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'maksimr/vim-jsbeautify'

" Snippets
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Completion, 'run pip3 install --user pynvim', then ':UpdateRemotePlugins'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 0
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Archive to maybe use later (again)
" Plug 'vim-syntastic/syntastic'
" Plug 'w0rp/ale'

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
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
    autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.groff,*.1 set filetype=groff

" Indicate line 80 and beyond 120
    let &colorcolumn="80,".join(range(120,999),",")

" Allows you to save files you opened without write permissions via sudo
    cmap w!! w !sudo tee %

" Switch between indent modes
    noremap <Leader>it :set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab<cr>
    noremap <Leader>is :set tabstop=4 softtabstop=4 shiftwidth=4 expandtab<cr>

" Show indentation guides
    set listchars=tab:→_,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
    noremap <Leader>i :set list<cr>
    noremap <Leader>h :set list!<cr>

" Git bindings
    noremap <Leader>g :Gstatus<cr>
    noremap <Leader>c :Gcommit<cr>
    noremap <Leader>b :Gblame<cr>
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

" Prettier
    let g:prettier#config#tab_width = 4
    let g:prettier#config#single_quote = 'true'
    let g:prettier#config#trailing_comma = 'all'
    let g:prettier#config#jsx_bracket_same_line = 'true'

" Denite
    nmap ; :Denite buffer -split=floating -winrow=1<CR>
    nmap <leader>t :Denite file/rec -split=floating -winrow=1<CR>
    nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>
    nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
    call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#var('buffer', 'date_format', '')
    let s:denite_options = {'default' : {
        \ 'auto_resize': 1,
        \ 'prompt': 'λ:',
        \ 'direction': 'rightbelow',
        \ 'winminheight': '10',
        \ 'highlight_mode_insert': 'Visual',
        \ 'highlight_mode_normal': 'Visual',
        \ 'prompt_highlight': 'Function',
        \ 'highlight_matched_char': 'Function',
        \ 'highlight_matched_range': 'Normal'
        \ }}
    " Loop through denite options and enable them
    function! s:profile(opts) abort
      for l:fname in keys(a:opts)
        for l:dopt in keys(a:opts[l:fname])
          call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
        endfor
      endfor
    endfunction

" Youcompleteme
    let g:loaded_youcompleteme = 1 " Disable by default

" Nerdtree
    let NERDTreeShowHidden=1

" Js Beautify
    map <c-z> :call JsBeautify()<cr>
    autocmd FileType javascript noremap <buffer>  <c-z> :call JsBeautify()<cr>
    autocmd FileType json noremap <buffer> <c-z> :call JsonBeautify()<cr>
    autocmd FileType jsx noremap <buffer> <c-z> :call JsxBeautify()<cr>
    autocmd FileType html noremap <buffer> <c-z> :call HtmlBeautify()<cr>
    autocmd FileType css noremap <buffer> <c-z> :call CSSBeautify()<cr>

" COC.nvim config
    let g:coc_global_extensions = [
        \ 'coc-tsserver', 'coc-eslint', 'coc-json', 'coc-prettier', 'coc-css',
        \ 'coc-python', 'coc-rls', 'coc-pairs', 'coc-html', 'coc-yank',
        \ 'coc-jest', 'coc-ccls', 'coc-tslint', 'coc-highlight', 'coc-phpls',
        \ 'coc-yaml', 'coc-docker', 'coc-go', 'coc-import-cost',
        \ 'coc-marketplace',
        \ ]
    vmap <leader>f <Plug>(coc-format-selected)
    nmap <leader>coc :CocList commands<cr>
    nmap <silent> <leader>dd <Plug>(coc-definition)
    nmap <silent> <leader>dr <Plug>(coc-references)
    nmap <silent> <leader>di <Plug>(coc-implementation)
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()


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

" Open file as suckless sent presentation
    map <leader>s :!sent<space><C-r>% 2>/dev/null &<CR><CR>

" View an image for a suckless sent presentation:
    map <leader>v $F@ly$:!feh --scale-down --auto-zoom --image-bg black <c-r>" &<CR><CR>

" Open the selected text in a split (i.e. should be a file).
    map <leader>o "oyaW:sp <C-R>o<CR>
    xnoremap <leader>o "oy<esc>:sp <C-R>o<CR>
    vnoremap <leader>o "oy<esc>:sp <C-R>o<CR>

" Replace all is aliased to S.
    nnoremap S :%s//g<Left><Left>

" Open corresponding.pdf
    map <leader>P :!mupdf <c-r>%<backspace><backspace><backspace>pdf &<CR><CR>

" Compile document
    map <leader>C :!compiler <c-r>%<CR>

" Interpret .md files, etc. as .markdown
    let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Make calcurse notes markdown compatible:
    autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown

" Readmes autowrap text:
    " autocmd BufRead,BufNewFile *.md set tw=79

" Get line, word and character counts with F3:
    map <F3> :!wc <C-R>%<CR>

" Spell-check set to F6:
    map <F6> :setlocal spell! spelllang=en_us,nl<CR>

" Use urlview to choose and open a url:
    :noremap <leader>u :w<Home>silent <End> !urlview<CR>

" Copy selected text to system clipboard (requires xclip installed):
    " vnoremap <C-c> "cy<esc>:!echo -n '<C-R>c' \|<space>xclip<CR><enter>

" Goyo plugin makes text more readable when writing prose:
    map <F10> :Goyo<CR>
    map <leader>f :Goyo<CR>
    inoremap <F10> <esc>:Goyo<CR>a

" Enable Goyo by default for mutt writting
    " Goyo's width will be the line limit in mutt.
    autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=72
    autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo

" Enable autocompletion:
    set wildmode=longest,list,full
    set wildmenu

" Automatically deletes all tralling whitespace on save.
    autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new
" material:
    autocmd BufWritePost ~/.scripts/folders,~/.scripts/configs !bash ~/.scripts/shortcuts.sh

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
    autocmd VimLeave *.tex !texclear

" Disables automatic commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Navigating with guides
    "inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
    "vnoremap <leader> <Esc>/<++><Enter>"_c4l
    "map <leader><Tab> <Esc>/<++><Enter>"_c4l "inoremap ;gui <++>

" For normal mode when in terminals (in X I have caps mapped to esc, this replaces it when I don't have X)
    inoremap jw <Esc>
    inoremap wj <Esc>

 "____        _                  _
"/ ___| _ __ (_)_ __  _ __   ___| |_ ___
"\___ \| '_ \| | '_ \| '_ \ / _ \ __/ __|
 "___) | | | | | |_) | |_) |  __/ |_\__ \
"|____/|_| |_|_| .__/| .__/ \___|\__|___/
              "|_|   |_|

"""PHP/HTML
    autocmd FileType php,html inoremap ;b <b></b><Space><++><Esc>FbT>i
    autocmd FileType php,html inoremap ;i <em></em><Space><++><Esc>FeT>i
    autocmd FileType php,html inoremap ;h1 <h1></h1><Enter><Enter><++><Esc>2kf<i
    autocmd FileType php,html inoremap ;h2 <h2></h2><Enter><Enter><++><Esc>2kf<i
    autocmd FileType php,html inoremap ;h3 <h3></h3><Enter><Enter><++><Esc>2kf<i
    autocmd FileType php,html inoremap ;p <p></p><Enter><Enter><++><Esc>02kf>a
    autocmd FileType php,html inoremap ;a <a<Space>href=""><++></a><Space><++><Esc>14hi
    autocmd FileType php,html inoremap ;e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
    autocmd FileType php,html inoremap ;ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
    autocmd FileType php,html inoremap ;li <Esc>o<li></li><Esc>F>a
    autocmd FileType php,html inoremap ;ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
    autocmd FileType php,html inoremap ;im <table<Space>class="image"><Enter><caption align="bottom"></caption><Enter><tr><td><a<space>href="pix/<++>"><img<Space>src="pix/<++>"<Space>width="<++>"></a></td></tr><Enter></table><Enter><Enter><++><Esc>4kf>a
    autocmd FileType php,html inoremap ;td <td></td><++><Esc>Fdcit
    autocmd FileType php,html inoremap ;tr <tr></tr><Enter><++><Esc>kf<i
    autocmd FileType php,html inoremap ;th <th></th><++><Esc>Fhcit
    autocmd FileType php,html inoremap ;tab <table><Enter></table><Esc>O
    autocmd FileType php,html inoremap ;gr <font color="green"></font><Esc>F>a
    autocmd FileType php,html inoremap ;rd <font color="red"></font><Esc>F>a
    autocmd FileType php,html inoremap ;yl <font color="yellow"></font><Esc>F>a
    autocmd FileType php,html inoremap ;dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
    autocmd FileType php,html inoremap ;dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
    "autocmd FileType php,html inoremap -- &ndash;
    "autocmd FileType php,html inoremap --- &mdash;

"MARKDOWN
    autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
    autocmd Filetype markdown,rmd inoremap ;n ---<Enter><Enter>
    autocmd Filetype markdown,rmd inoremap ;b ****<++><Esc>F*hi
    autocmd Filetype markdown,rmd inoremap ;s ~~~~<++><Esc>F~hi
    autocmd Filetype markdown,rmd inoremap ;e **<++><Esc>F*i
    autocmd Filetype markdown,rmd inoremap ;h ====<Space><++><Esc>F=hi
    autocmd Filetype markdown,rmd inoremap ;i ![](<++>)<++><Esc>F[a
    autocmd Filetype markdown,rmd inoremap ;a [](<++>)<++><Esc>F[a
    autocmd Filetype markdown,rmd inoremap ;1 #<Space><Enter><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap ;2 ##<Space><Enter><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap ;3 ###<Space><Enter><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap ;l --------<Enter>
    autocmd Filetype markdown map <F5> :!pandoc<space><C-r>%<space>--pdf-engine=xelatex<space>-o<space><C-r>%.pdf<Enter><Enter>
    autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
    autocmd Filetype rmd inoremap ;r ```{r}<CR>```<CR><CR><esc>2kO
    autocmd Filetype rmd inoremap ;p ```{python}<CR>```<CR><CR><esc>2kO

    vmap <expr> ++ VMATH_YankAndAnalyse()
    nmap ++ vip++

    vnoremap K xkP`[V`]
    vnoremap J xp`[V`]
    vnoremap L >gv
    vnoremap H <gv

    map <enter><enter> yi[:e <c-r>"<cr>

