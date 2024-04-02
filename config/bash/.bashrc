#
#  .bashrc
#
HISTIGNORE="ls:cd:pwd"

#
# environment variables
#
export XDG_CONFIG_HOME="$HOME"/.config

export WORKSPACE="$HOME"/workspace
export DOTFILES="$WORKSPACE/dotfiles"
export SCRIPTS="$DOTFILES/scripts"

PATH="${PATH:+${PATH}:}"$SCRIPTS":~/.local/bin:/opt/nvim-linux64/bin" # appending
export PATH

export EDITOR=nvim

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
if command -v eza &>/dev/null; then
	alias ls='eza'
	alias ll='eza -alhg'
	alias tree='eza --tree'
fi
if command -v exa &>/dev/null; then
	alias ls='exa'
	alias ll='exa -alhg'
	alias tree='exa --tree'
fi

# cat
if command -v bat &>/dev/null; then
	alias cat='bat'
fi
if command -v batcat &>/dev/null; then
	alias cat='batcat'
fi

alias cd='z'
alias ..="cd .." # one back
alias ~='cd ~'   # cd home dir
alias -- -='z -' # cd last dir in

alias rmr='rm -r'
alias rmrf='rm -rf'

alias reload='source ~/.bashrc'
alias tslog='tail -f /var/log/syslog'

alias x='exit'
alias c='clear'
alias v='nvim'
alias t='tmux'
alias f='fuck'
alias h='history'

# git
alias gp='git pull'
alias gpush='git push'
alias gs='git status'
alias gcommit='git commit'
alias gm='git merge'
alias ga='git add'
alias gc='git checkout'
alias gb='git branch'
alias gf='git fetch'
alias lg='lazygit'

#
#
#
backup() { cp "$@" "$@".backup_$(date +%Y%m%d-%H%M%S); }
extract() {
	case $1 in
	*.tar.gz) tar xvzf $1 ;;
	*.tar.bz2) tar xvjf $1 ;;
	*.zip) unzip $1 ;;
	*) echo "unknown format!" ;;
	esac
}
