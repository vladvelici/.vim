set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'othree/html5.vim'
" CoVim
" Plugin 'FredKSchott/CoVim'

Plugin 'def-lkb/ocp-indent-vim'

call vundle#end()

filetype plugin indent on

" Line numbers
set nu

" Syntax highlight
syntax on

" OCaml
" let g:ocp_indent_vimfile = system("opam config var share")
" let g:ocp_indent_vimfile = substitute(g:ocp_indent_vimfile, '[\r\n]*$', '', '')
" let g:ocp_indent_vimfile = g:ocp_indent_vimfile . "/vim/syntax/ocp-indent.vim"

set rtp+=</Users/vlad/.vim/bundle/ocp-indent-vim>

" autocmd FileType ocaml exec ":source " . g:ocp_indent_vimfile
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
onoremap <silent> <Up> gk
inoremap <silent> <Up> <C-o>g<Up>
onoremap <silent> <Down> gj
inoremap <silent> <Down> <C-o>g<Down>
onoremap <silent> <home> g<home>
inoremap <silent> <home> <C-o>g<home>
onoremap <silent> <End> g<End>
inoremap <silent> <End> <C-o>g<End>

" Go more highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" Auto-close the preview window after autocompletion
autocmd CompleteDone * pclose

