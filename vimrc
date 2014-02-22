filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

set nu

autocmd FileType go autocmd BufWritePre <buffer> Fmt

nnoremap <C-h>     :tabprevious<CR>
nnoremap <C-j>     :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>

" .swp files in .vim/...
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

set copyindent
