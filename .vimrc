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
