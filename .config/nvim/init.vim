let mapleader =","
let maplocalleader=" "

" Plugins {{{
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'nanotech/jellybeans.vim'
Plug 'simnalamburt/vim-mundo'

Plug 'lervag/vimtex'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi-vim'

Plug 'plasticboy/vim-markdown'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
" }}}

nnoremap <F4> :update<CR>
nnoremap <F6> :MundoToggle<CR>
nnoremap <F7> :ALEFix<CR>
nnoremap <F8> :ALEDisableBuffer<CR>

" set termguicolors
augroup colors
  autocmd!
  autocmd ColorScheme jellybeans highlight Comment cterm=NONE
  highlight Conceal ctermbg=NONE
augroup END

" jellybeans {{{
colorscheme jellybeans
let g:airline_theme='jellybeans'
let g:jellybeans_use_gui_italics = 0
let g:jellybeans_overrides = {
      \ 'background': { 'guibg': '171717' },
      \}
" }}}

set showmatch
set ignorecase
set smartcase
set undofile
set linebreak

set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set number relativenumber
set splitbelow splitright

" set list
" set listchars=tab:‣\ ,trail:·,precedes:«,extends:»

set expandtab
set shiftwidth=4
set softtabstop=4

nnoremap <leader>o :setlocal spell! spelllang=en_gb,en_us<CR>
nnoremap <leader>d :read !date<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-p> :bprev<cr>
nnoremap <C-n> :bnext<cr>

nnoremap <leader>ev :edit $MYVIMRC<cr>

" augroups {{{
augroup default
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
  " r: Automatically insert the current comment leader after hitting <Enter> in Insert mode.
  " o: carry on comment in insert
  autocmd FileType * setlocal formatoptions-=r formatoptions-=o

  autocmd CompleteDone * silent! pclose!

  autocmd BufNewFile ~/notes/* setlocal spell
  autocmd FileType gitcommit setlocal spell
augroup END

augroup scripts
  autocmd!
  autocmd BufWritePost ~/bin/*.sh silent !chmod 700 %
  autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
augroup END

augroup javascript
  autocmd!
  autocmd FileType javascript,html,xml,xslt,json,yaml,css setlocal shiftwidth=2 softtabstop=2
  autocmd FileType html nnoremap <buffer> <LocalLeader>p i<p></p><left><left><left><left>
augroup END

augroup crontab
  autocmd!
  autocmd BufWritePost ~/.config/crontab,~/.crontab !crontab %
  autocmd FileType *crontab setlocal ft=crontab
  autocmd FileType crontab setlocal commentstring=#\ %s
  autocmd FileType matlab setlocal commentstring=%\ %s
augroup END

augroup vim
  autocmd!
  autocmd BufWritePost $MYVIMRC silent source $MYVIMRC
  autocmd FileType vim setlocal shiftwidth=2 softtabstop=2
  " autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup config_reload
  autocmd!
  autocmd BufWritePost *sxhkdrc !pkill -SIGUSR1 -x sxhkd
  autocmd BufWritePost *dunstrc !pkill dunst && setsid dunst
  autocmd BufWritePost *redshift.conf !pkill redshift && setsid redshift
augroup END

" latex
function TexAbbr() abort
  iabbr <buffer> lam \lambda
  iabbr <buffer> :l \lambda

  iabbr <buffer> theta \theta
  iabbr <buffer> :t \theta
  iabbr <buffer> :a \alpha
  iabbr <buffer> :o \omega
  iabbr <buffer> :tt \texttt
  iabbr <buffer> :b \textbf

  iabbr <buffer> :i \infty
endfunction
augroup tex
  autocmd!
  autocmd VimLeave *.tex !texclear %
  autocmd FileType *.tex setlocal spell
  autocmd FileType tex setlocal shiftwidth=1 softtabstop=1
  autocmd FileType tex call TexAbbr()
augroup END

augroup java
  autocmd!
  autocmd FileType java iabbr <buffer> pl System.out.println
augroup END

augroup cpp
  autocmd!
  autocmd BufRead *.h ALEDisableBuffer
augroup END
" }}}

" deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#custom#option#num_processes = 4
let g:loaded_python_provider = 0
let g:python3_host_prog = "/usr/bin/python3"
" }}}

" vimtex {{{
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
set conceallevel=1
let g:tex_conceal='abdmg'
" }}}

let g:asmsyntax = 'asm'

" ale {{{
" let g:ale_java_javac_options = '--module-path /usr/share/openjfx/lib --add-modules javafx.controls'

let g:ale_nasm_nasm_executable = 'yasm'
let g:ale_nasm_nasm_options = '-f elf64'

let g:ale_javascript_eslint_executable = 'npx'
let g:ale_javascript_eslint_options = 'eslint'

let g:ale_fixers = {
      \ 'json': ['fixjson', 'jq'],
      \ 'python': ['yapf', 'isort'],
      \ 'cpp': ['clang-format'],
      \ 'java': ['uncrustify'],
      \}
let g:ale_c_clangformat_options = '--style="{BasedOnStyle: llvm, IndentWidth: 4}"'
let g:ale_python_yapf_executable = 'yapf3'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0

" }}}

let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_folding_disabled = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories = ['mySnips', 'UltiSnips']

" Actually <C-/>
xnoremap <C-_> :Commentary<cr>
nnoremap <C-_> :Commentary<cr>

