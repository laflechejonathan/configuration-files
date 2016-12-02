" set guioptions -=T
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')

Plug 'Sass'
Plug 'Solarized'
Plug 'The-NERD-tree'
Plug 'Valloric/ListToggle'
Plug 'Valloric/YouCompleteMe'
Plug 'ag.vim'
Plug 'commentary.vim'
Plug 'ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'fugitive.vim'
Plug 'gmarik/Vundle.vim'
Plug 'matchit.zip'
Plug 'scrooloose/syntastic'
Plug 'sexy-railscasts'
Plug 'surround.vim'
Plug 'unimpaired.vim'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'isRuslan/vim-es6'

" All of your Plugins must be added before the following line
call plug#end()

set background=dark
colorscheme Tomorrow-Night-Eighties
"filetype plugin indent on    " required

" Configure NERDTree
set autochdir
let NERDTreeChDirMode=2
let NERDTreeIgnore = ['\.pyc$']
nnoremap <C-n> :NERDTreeToggle .<CR>


" Configure status line
set statusline=%F       "filepath
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set laststatus=2

" close stupid buffer after AutoComplete
autocmd CompleteDone * pclose

" enable jshint for linting
let g:syntastic_javascript_checkers = ['eslint']

" SilverSearcher should always search from project root
let g:ag_working_path_mode="r"

" I'm an old man, make that font bigger
set guifont=Menlo:h13

" Setup indentation
set smartindent
set tabstop=4
set softtabstop=4    "This controls tab in insert mode if softtabstop == tabstop: it uses tabs
set shiftwidth=4
set expandtab
autocmd FileType make setlocal noexpandtab  " makefiles use tabs
set backspace=2 " make backspace work like most other apps

" Syntastic only runs when asked, with Ctrl-s
" NOTE - maybe one day when we chill the 20,000 line files, can re-enable this
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['python'],'passive_filetypes': ['javascript'] } 
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_always_populate_loc_list = 1
" nnoremap <C-s> :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" sometimes you just want everything to fuck off
function FuckOff()
	:only
	:tabo
endfunction
command FuckOff execute "call FuckOff()"

" for some reason commentary decided it doesn't understand python?
autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType sh setlocal commentstring=#\ %s
autocmd FileType htmldjango setlocal commentstring={#%s\ #}


" use project root
let g:ag_working_path_mode="r"

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

let g:ctrlp_working_path_mode = 'ra'


" Clever Hack so that lnext/lprev work with only 1 item
function! <SID>LocationPrevious()                       
  try                                                   
    lprev                                               
  catch /^Vim\%((\a\+)\)\=:E553/                        
    llast                                               
  endtry                                                
endfunction                                             

function! <SID>LocationNext()                           
  try                                                   
    lnext                                               
  catch /^Vim\%((\a\+)\)\=:E553/                        
    lfirst                                              
  endtry                                                
endfunction                                             

nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>                                        
nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>

syntax on
