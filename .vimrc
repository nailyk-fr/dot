syn on
set nu
set tabstop=4
set shiftwidth=4
set noexpandtab
hi Comment ctermfg=LightBlue
set ignorecase
set smartcase
set mouse=
 

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif


set nocompatible        " Use Vim defaults (much better!)
set bs=indent,eol,start         " allow backspacing over everything in insert mode


" Highlight tabs
set listchars=tab:>-,trail:-
set list

" Display column guides
augroup ColorcolumnOnlyInInsertMode
        autocmd!
        autocmd InsertEnter * setlocal colorcolumn=51,81,121
        autocmd InsertLeave * setlocal colorcolumn=0
augroup END
" highlight ColorColumn ctermbg=235
highlight ColorColumn ctermbg=235
 
"highlight search
set hlsearch
hi Search cterm=NONE ctermfg=grey ctermbg=blue
 
" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  """"filetype plugin indent on
 
  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
 
" && (@% =~ '.git/COMMIT_EDITMSG')
    autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$")
      \    && &ft !~# 'commit'
      \           && expand("%") !~ "git-rebase-todo"
      \           && expand("%") !~ "COMMIT_EDITMSG"
      \           && expand("%") !~ "ADD_EDIT.patch"
      \           && expand("%") !~ "addp-hunk-edit.diff"
      \|   exe "normal! g`\"" | endif
 
  augroup END
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
endif " has("autocmd")
 
set background=dark
 
" Always keep 2 lines above and bellow the cursor
set scrolloff=2
 
" Show persistent status line
set laststatus=2
" Emulate standard status line with 'ruler' set
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %p%%
highlight StatusLine ctermfg=DarkBlue ctermbg=White
 
" Shortcut to toggle relative numbers
map <C-n> :set relativenumber!<CR>
 
 
 
 
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

