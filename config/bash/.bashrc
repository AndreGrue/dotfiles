#
#  .bashrc
#


#
# environment variables 
#
export XDG_CONFIG_HOME="$HOME"/.config

export WORKSPACE="$HOME"/workspace
export DOTFILES="$WORKSPACE/dotfiles"
export SCRIPTS="$DOTFILES/scripts"


PATH="${PATH:+${PATH}:}"$SCRIPTS # appending
export PATH

#
#
#
eval "$(starship init bash)"


#
#  alias
#
alias ll='ls -la'
alias ..="cd .."

alias e='exit'
alias c='clear'
alias v='nvim'
alias t='tmux'

# git
alias gl='git pull'
alias gp='git push'
alias gs='git status'
alias gt='git commit'
alias gm='git merge'
alias ga='git add'
alias gc='git checkout'
alias gb='git branch'
alias lg='lazygit'

