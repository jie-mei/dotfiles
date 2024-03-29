" Remote tree explorer.

if exists('g:check_vundle_plugin')
  Plugin 'netrw.vim'
  finish
endif


" behave like NERDTree.
let g:netrw_winsize = -28     " Absolute width of netrw window.
let g:netrw_banner = 0        " Do not display info on the top of window.
let g:netrw_liststyle = 3     " Apply tree-view.
let g:netrw_browse_split = 4  " Use the previous window to open file.
let g:netrw_sort_sequence = '[\/]$,*'
                " Sort is affecting only: directories on the top, files below.

" :Lexplore opens it on left side, :Lexplore! on the right
com! -nargs=* -bar -bang -complete=dir Lexplore 
      \ call netrw#Lexplore(<q-args>, <bang>0)
fun! Lexplore(dir, right)
  if exists("t:netrw_lexbufnr")
  " close down netrw explorer window
  let lexwinnr = bufwinnr(t:netrw_lexbufnr)
  if lexwinnr != -1
    let curwin = winnr()
    exe lexwinnr."wincmd w"
    close
    exe curwin."wincmd w"
  endif
  unlet t:netrw_lexbufnr

  else
    " open netrw explorer window in the dir of current file
    " (even on remote files)
    let path = substitute(exists("b:netrw_curdir")? b:netrw_curdir : expand("%:p"), '^\(.*[/\\]\)[^/\\]*$','\1','e')
    exe (a:right? "botright" : "topleft")." vertical ".((g:netrw_winsize > 0)? (g:netrw_winsize*winwidth(0))/100 : -g:netrw_winsize) . " new"
    if a:dir != ""
      exe "Explore ".a:dir
    else
      exe "Explore ".path
    endif
    setlocal winfixwidth
    let t:netrw_lexbufnr = bufnr("%")
  endif
endfun
