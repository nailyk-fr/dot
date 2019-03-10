syn on
set nu
set tabstop=4
set shiftwidth=4
set noexpandtab
"set background=dark
hi Comment ctermfg=LightBlue
set ignorecase
set smartcase
set mouse=

" Highlight tabs
set listchars=tab:>-,trail:-
set list

if ( has("autocmd") )
  if ( ! (@% =~ 'COMMIT_EDITMSG' ))
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif
  endif
endif

" Display column guides
set colorcolumn=81,121
highlight ColorColumn ctermbg=235

"highlight search
set hlsearch
hi Search cterm=NONE ctermfg=grey ctermbg=blue

