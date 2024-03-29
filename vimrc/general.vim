
""""""""""""""""""""""""""""""""""" General """"""""""""""""""""""""""""""""""""

" Behavior support.
behave mswin                     " Set mouse behave to be Ms-Windows.
if g:is_mac && has('gui_running')
	source $VIMRUNTIME/macmap.vim  " Allow mappping with command-key.
elseif g:is_mswin
  source $VIMRUNTIME/mswin.vim   " Allow using CTRL-X, CTRL-C and CTRL-V.
  if has('mouse')
    set mouse=a                  " Allow using mouse in all modes.
  endif
  au GUIEnter * simalt ~x
endif

set history=200  " The number of history is remembered.

if has("wildmenu")
  set wildmenu  " Command-line completion operates in an enhanced mode.
  set wildmode=longest:full,full
endif

set backspace=indent,eol,start whichwrap+=<,>,[,]

" Disable auto backup.
set nobackup
set noswapfile
set nowritebackup

" Automatic read the latest modification into buffer.
if exists("&autoread")
	set autoread
endif

" Disable error beep and flash
set noerrorbells
set vb t_vb=

if g:is_mac
  set visualbell  " error bell when click ESC in normal mode. (default close)
endif


""""""""""""""""""""""""""""""""""" Encoding """""""""""""""""""""""""""""""""""

" Set file encoding.
if has('multi_byte')
  set encoding=utf-8
  set fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,chinese,cp936,gbk,big5,latin-1
  if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double  " Double width the Unicode characters.
  endif
  set nobomb
endif

" Set fonts.
if has('gui_running')
  if g:is_mac
    set guifont=Inconsolata\ for\ Powerline:h12,Inconsolata:h12
  else
    set guifont=Inconsolata\ for\ Powerline\ 10,Inconsolata\ 10
  endif
endif


"""""""""""""""""""""""""""""""""" Preference """"""""""""""""""""""""""""""""""

let g:tex_flavor = "latex"
let g:tex_conceal = ""
