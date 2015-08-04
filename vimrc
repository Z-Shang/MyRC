" 
"███████╗  ██╗   ██╗██╗███╗   ███╗
"╚══███╔╝  ██║   ██║██║████╗ ████║
"  ███╔╝   ██║   ██║██║██╔████╔██║
" ███╔╝    ╚██╗ ██╔╝██║██║╚██╔╝██║
"███████╗██╗╚████╔╝ ██║██║ ╚═╝ ██║
"╚══════╝╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝
"
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif
set nocompatible

filetype off

let Plugin_List = [
            \ 'altercation/vim-colors-solarized', 
            \ 'bitc/vim-hdevtools',
            \ 'bling/vim-airline',
            \ 'clvv/a.vim', 
            \ 'digitaltoad/vim-jade',
            \ 'duganchen/vim-soy',
            \ 'eagletmt/ghcmod-vim',
            \ 'eagletmt/neco-ghc',
            \ 'fatih/vim-go',
            \ 'fholgado/minibufexpl.vim',
            \ 'guns/vim-clojure-static',
            \ 'honza/vim-snippets',
            \ 'jistr/vim-nerdtree-tabs',
            \ 'jpalardy/vim-slime',
            \ 'kchmck/vim-coffee-script',
            \ 'keith/swift.vim',
            \ 'kien/ctrlp.vim',
            \ 'kovisoft/slimv',
            \ 'Lokaltog/vim-easymotion',
            \ 'mbbill/undotree',
            \ 'nathanaelkane/vim-indent-guides',
            \ 'rking/ag.vim',
            \ 'scrooloose/nerdcommenter',
            \ 'scrooloose/nerdtree',
            \ 'scrooloose/syntastic',
            \ 'shougo/neocomplcache.vim',
            \ 'shougo/vimproc.vim',
            \ 'shougo/vimshell.vim',
            \ 'sirver/ultisnips',
            \ 'sjl/gundo.vim',
            \ 'terryma/vim-multiple-cursors',
            \ 'tomasr/molokai',
            \ 'tpope/vim-fugitive',
            \ 'tpope/vim-fireplace',
            \ 'tpope/vim-rails',
            \ 'Valloric/YouCompleteMe',
            \ 'vim-scripts/hlint',
            \ 'vim-scripts/tagbar',
            \ 'w0ng/vim-hybrid',
            \ 'gmarik/Vundle.vim']
" =========Bundle Managed By Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

for repo in Plugin_List
    Plugin repo
endfor
"Plugin 'guns/vim-sexp'
"Plugin 'tpope/vim-classpath'
"Plugin 'tpope/vim-dispatch'
"Plugin 'tpope/vim-leiningen'
"Plugin 'tpope/vim-projectionist'
"Plugin 'typedclojure/vim-typedclojure'
call vundle#end()

" =========For Japanese Support
set fileencodings=utf8,gbk,iso-2022-jp,euc-jp,cp932,default,latin1

syntax on
" size of a hard tabstop
set tabstop=4
" size of an "indent"
set shiftwidth=4
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set number
set relativenumber

"if has("vms")
set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

set background=dark
let g:hybrid_use_Xresources = 1
colorscheme molokai

map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

set t_Co=256
set cc=80

" =========Slimv
let g:slimv_python = 'python2'
let g:slimv_impl = 'sbcl'
"let g:slimv_swank_cmd = '! tmux new-window "sbcl --load /home/zshang/.vim/start-swank.lisp &"'
let g:lisp_rainbow = 1
let g:slimv_repl_syntax = 1

" =========Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:Syntastic_cpp_checkers = ['gcc']
"set error or warning signs
let g:syntastic_error_symbol = 'X'
let g:syntastic_warning_symbol = '!'
"whether to show balloons
let g:syntastic_enable_balloons = 1
map <silent> <leader>e :Errors<CR>
map <leader>s :SyntasticToggleMode<CR>
"let g:syntastic_auto_loc_list=1

" =========YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
"Make Syntastic works together with YCM
let g:ycm_show_diagnostics_ui = 0

" =========Misc Key Mappings
imap <C-k> <Esc>k
imap <C-l> <Esc>l
imap <C-h> <Esc>h
imap <C-j> <Esc>j
imap <C-\> lambda

nmap <C-l> :NERDTreeToggle<CR>
nmap <C-\> :TagbarToggle<CR>
nmap <tab> :IndentGuidesToggle<CR>

"imap <C-f> function

" =========Airline
set laststatus=2
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

" =========Indent Guides
set ts=4 sw=4 et
hi IndentGuidesEven ctermbg=1
hi IndentGuidesOdd  ctermbg=2
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" =========GHC-Mod
map <silent> tu :call GHC_BrowseAll()<CR>
map <silent> tw :call GHC_ShowType(1)<CR>

" =========HDevTools
au FileType haskell nnoremap <buffer> <C-t> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <leader>c :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <leader>t :HdevtoolsInfo<CR>

" =========Vim-Slime
let g:slime_target="tmux"
let g:slime_paste_file=tempname()

" =========PointFree
autocmd BufEnter *.hs set formatprg=pointfree

" =========Neco Ghc
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType haskell let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:necoghc_enable_detailed_browse=1

" =========gVIM
set guifont=SourceCodeProforPowerline\ 12
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" =========Gundo
nnoremap <C-u> :GundoToggle<cr>

