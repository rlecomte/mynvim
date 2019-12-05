" prerequirement
" stack install fast-tags
" apt install fzf

execute pathogen#infect()

set updatetime=400
" show line number
set number
set fileencoding=utf-8
set noshowmode
"copy to clipboard (+y)
set clipboard+=unnamedplus
set termguicolors
set t_Co=256
" Tab specific option
set tabstop=4                   "A tab is 4 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=2               "Insert 4 spaces when tab is pressed
set shiftwidth=4                "An indent is 4 spaces

" remap escape edit mode
inoremap <esc> <nop>
inoremap jk <esc>

map <C-i> :sort<CR>

" delete all buffer but this one
nmap <C-n> :Bonly<CR>

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" theme
set background=dark
colorscheme gruvbox

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd FileType javascript setlocal ts=2 sw=2
autocmd FileType json setlocal ts=2 sw=2
autocmd FileType yaml setlocal ts=2 sw=2
autocmd FileType sql setlocal ts=2 sw=2

" netrw
augroup ProjectDrawer
  autocmd!
  nmap <C-f> :Explore<CR>
augroup END

source plugin/fzf.vim
source plugin/buftabline.vim
source plugin/lightline.vim
