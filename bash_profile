if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Custom colors
export LS_COLORS=$LS_COLORS:'di=1;33:ln=90'

if [ -d "$HOME/.linuxbrew" ]; then
  PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
  LIBRARY_PATH="$HOME/.linuxbrew/lib:$LIBRARY_PATH"
  MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
  INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
fi

if [ -d ~/.virtualenv ]; then
  PATH="$HOME/.virtualenv/bin:$PATH"
fi

if [ -d "$HOME/.conda" ]; then
  PATH="$HOME/.conda/bin:$PATH"
fi

if [ -d "$HOME/.cargo" ]; then
  PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d "$HOME/.nltk_data" ]; then
  NLTK_DATA="$HOME/.nltk_data:$NLTK_DATA"
  export NLTK_DATA
fi

if [ "$(uname)" == 'Linux' ]; then
  export LIBRARY_PATH
  export INFOPATH
fi
export MANPATH
export PATH
export PYTHONPATH

# Run tiddlywiki
if [ -d "$HOME/Dropbox/wiki" ]; then
  if ! pgrep node &>/dev/null; then
    nohup tiddlywiki "$HOME/Dropbox/wiki" --server > /dev/null &
  fi
fi

if [ -f "$HOME/.bash_local" ]; then
  source "$HOME/.bash_local"
fi

# vim:ft=sh
