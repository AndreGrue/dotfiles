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

PATH="${PATH:+${PATH}:}"$SCRIPTS":~/.local/bin:/opt/nvim-linux64/bin" # appending
export PATH

#
#
#
eval "$(starship init bash)"
eval "$(thefuck --alias)"
eval "$(zoxide init bash)"

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#
#  alias
#
#alias ll='ls -la'
alias ls='eza'
alias ll='eza -alh'
alias tree='eza --tree'

alias cat='bat'

alias cd='z'
alias ..="cd .." # one back
alias ~='cd ~'   # cd home dir
alias ret='z -'  # cd last dir in

alias reload='source ~/.bashrc'

alias e='exit'
alias c='clear'
alias v='nvim'
alias t='tmux'
alias f='fuck'
alias h='history'

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
