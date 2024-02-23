eval export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";


#
#
#
eval "$(starship init bash)"


#
#  alias
#
alias ll='ls -la'

alias v='nvim'
alias t='tmux'
alias e='exit'

# git
alias gl='git pull'
alias gs='git push'
alias gs='git status'
alias gm='git commit'
alias ga='git add'
alias lg='lazygit'

