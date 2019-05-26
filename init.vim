" prerequirement
" stack install fast-tags
" apt install fzf

execute pathogen#infect()

set updatetime=400

" remap escape edit mode
inoremap <esc> <nop>
inoremap jk <esc>

" show line number
set number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

set fileencoding=utf-8

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
set tabstop=4                   "A tab is 4 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=2               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces
"set shiftround                  "Round indent to nearest shiftwidth multiple
"
autocmd FileType javascript setlocal ts=2 sw=2
autocmd FileType json setlocal ts=2 sw=2
autocmd FileType yaml setlocal ts=2 sw=2
autocmd FileType sql setlocal ts=2 sw=2

"~~~~~~~~~~~~~~~ sort ~~~~~~~~~~~~~~~~~
map <C-i> :sort<CR>

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

" theme
set background=dark
colorscheme gruvbox 

" ~~~~~~~~~~~~~~ netrw ~~~~~~~~~~~~~~
let g:netrw_liststyle = 3 
let g:netrw_banner = 0
let netrw_browse_split = 4
let g:netrw_winsize = 20
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END
