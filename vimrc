set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


call vundle#end()

Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'

filetype plugin indent on

" Line numbers
set nu

" Syntax highlight
syntax on

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
fu! DisableBr()
  set wrap
  set linebreak
  set nolist  " list disables linebreak
  set textwidth=0
  set wrapmargin=0
  set fo-=t
endfu
" Disable line breaks for all file types
:au BufNewFile,BufRead *.* call DisableBr()

" Navigation between soft lines
map <silent> <Up> gk
imap <silent> <Up> <C-o>gk
map <silent> <Down> gj
imap <silent> <Down> <C-o>gj
map <silent> <home> g<home>
imap <silent> <home> <C-o>g<home>
map <silent> <End> g<End>
imap <silent> <End> <C-o>g<End>

