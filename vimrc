filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
set nu

autocmd FileType go autocmd BufWritePre <buffer> Fmt

set runtimepath+=$HOME/Projects/vimfiles/rtp

" OCaml
let g:ocp_indent_vimfile = system("opam config var share")
let g:ocp_indent_vimfile = substitute(g:ocp_indent_vimfile, '[\r\n]*$', '', '')
let g:ocp_indent_vimfile = g:ocp_indent_vimfile . "/vim/syntax/ocp-indent.vim"

autocmd FileType ocaml exec ":source " . g:ocp_indent_vimfile
" autocmd FileType ocaml autocmd BufWritePre <buffer> call OcpIndentBuffer()
autocmd FileType ocaml command! -buffer Fmt call OcpIndentBuffer()

" au BufRead,BufNewFile *.ml,*.mli compiler ocaml

" Tabs
nnoremap <C-h>     :tabprevious<CR>
nnoremap <C-j>     :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>

" .swp files in .vim/...
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Indentation
set copyindent
set softtabstop=4
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab

" visual spacing
set list
set listchars=tab:▸\ ,trail:•,extends:❯,precedes:❮
set showbreak=↪\

" searching
set hlsearch
set incsearch
nnoremap <CR> :noh<CR><CR>

" this enables "visual" wrapping
set wrap linebreak nolist

" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0
set wrapmargin=0

" visual wrapping and no line break for all filetypes
" http://superuser.com/a/256850/187715
" Disable annoying auto line break
fu! local:disableBr()
  set wrap
  set linebreak
  set nolist  " list disables linebreak
  set textwidth=0
  set wrapmargin=0
  set fo-=t
endfu
" Disable line breaks for all file types
:au BufNewFile,BufRead *.* call local:disableBr()

" Navigation between soft lines
map <silent> <Up> gk
imap <silent> <Up> <C-o>gk
map <silent> <Down> gj
imap <silent> <Down> <C-o>gj
map <silent> <home> g<home>
imap <silent> <home> <C-o>g<home>
map <silent> <End> g<End>
imap <silent> <End> <C-o>g<End>

" autocomplete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" open omni completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
" open user completion menu closing previous if open and opening new menu without changing the text
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .
            \ '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'


autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
