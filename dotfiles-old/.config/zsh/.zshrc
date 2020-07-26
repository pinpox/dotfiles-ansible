# Prevents grep options deprecation message
unset GREP_OPTIONS

HISTFILE=~/.config/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000

# History search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

export SUDO_ASKPASS="/home/binaryplease/.local/bin/passsudo"
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"

# To load zsh plugins, if new plugins are added:
# antibody bundle < ~/.zsh_plugins > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.fzf.colors ] && source ~/.fzf.colors

for file in ~/.config/zsh/*.zsh; do
	source $file
done

compdef config="git"

export GPG_TTY=$(tty)
SSH_AUTH_SOCK=/run/user/1000/gnupg/S.gpg-agent.ssh; export SSH_AUTH_SOCK;

# Other prompt sympols for copy/paste ▸ ▪ ◼ ❱ ❭ ➙ ➫ ➸ ⟫
PURE_PROMPT_SYMBOL='✱'

# Colors
# wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors
eval $(dircolors -b $HOME/.dircolors)

[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi

