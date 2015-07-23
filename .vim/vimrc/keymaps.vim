:nmap \l :setlocal number!<CR>
:nmap \t :set invpaste paste?<CR>
:nmap \q :set invhlsearch hlsearch?<CR>

"paste mode
nnoremap <F2> :set invpaste paste?<CR>
nnoremap tp :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"folds
:nmap foldmanual :set foldmethod=manual<CR>
:nmap foldsyntax :set foldmethod=syntax<CR>
:nmap foldindent :set foldmethod=indent<CR>

"NerdTree
:nmap <C-o> :NERDTreeToggle<CR>

"map <C-o> :browse confirm e<Return>
map <C-C> :e %:r.cpp<CR>
map <C-H> :e %:r.h<CR>
map <C-I> :e %:r.hpp<CR>

"escape
imap jj <Esc>
map m :call cursor(0, len(getline('.'))/2)

"set auto change directory
nnoremap ta :set invautochdir autochdir?<CR>
