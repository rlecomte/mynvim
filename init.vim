" prerequirement
" stack install fast-tags
" apt install fzf

execute pathogen#infect()

" syntax on
" filetype plugin indent on

" remap escape edit mode
inoremap <esc> <nop>
inoremap jk <esc>

" show line number
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" highlight word
" autocmd CursorMoved * exe printf('match Highlight /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" https://superuser.com/questions/450403/how-can-i-hide-the-insert-status-in-vim
set noshowmode

"copy to clipboard (+y)
set clipboard+=unnamedplus

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Tab specific option
set tabstop=8                   "A tab is 8 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=4               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces
set shiftround                  "Round indent to nearest shiftwidth multiple

autocmd FileType javascript setlocal ts=2 sw=2
autocmd FileType json setlocal ts=2 sw=2
autocmd FileType yaml setlocal ts=2 sw=2
autocmd FileType sql setlocal ts=2 sw=2

" ~~~~~~~~~~~~~~ BufOnly ~~~~~~~~~~~~~~

" delete all buffer but this one
nmap <C-n> :Bonly<CR>

" ~~~~~~~~~~~~~~ lightline ~~~~~~~~~~~~~~
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" ~~~~~~~~~~~~~~ buftabline ~~~~~~~~~~~~~~
set hidden
nnoremap <C-m> :bnext<CR>
nnoremap <C-l> :bprev<CR>

" ~~~~~~~~~~~~~~ fzf ~~~~~~~~~~~~~~
set rtp+=~/.fzf/

nmap <C-s> :Tags<CR>
nmap <C-p> :GFiles<CR>

" Search current word in tags
nmap <C-c> :call fzf#vim#tags(expand('<cword>'))<CR>

"~~~~~~~~~~~~~~ nerdtree ~~~~~~~~~~~~~~
nmap <F7> :NERDTree<CR>
nmap <C-f> :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close vim if the only window is nerdtree


" theme
set background=dark
colorscheme gruvbox 
