# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt appendhistory autocd beep
bindkey -e
# End of lines configured by zsh-newuser-install
export PS1="[%* - %D] %d %% "
# Aliases
alias clr="clear"
alias clean="clear"
alias gapt="git add ."
alias gst="git status"
alias gc="git commit -m"
alias gp="git push"
alias psuh="push"
alias statsu="status"
alias intsall="install"
alias zsh_aliases="sudo vim ~/.zshrc"
alias postgres="sudo -u postgres psql"
alias cls="clear"
alias cdi="cd ~/IdeaProjects/"
alias cdr="cd ~/IdeaProjects/RandomKatas/"
alias cdg="cd ~/git/"
alias ag="sudo apt-get install"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias i3config='vim ~/.config/i3/config'
alias i3lockconfig='vim ~/.bin/scripts/i3lockcolor.sh'
alias touchpadon='synclient TouchpadOff=0'
alias touchpadoff='synclient TouchpadOff=1'
alias gcl='gcloud compute ssh christopher-genesis-vm'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# Environment Variables
export NODE_ENV='development'
# The following lines were added by compinstall
zstyle :compinstall filename '/home/cengels/.zshrc'
source ~/.zplug/init.zsh
autoload -Uz compinit
compinit
# End of lines added by compinstall
zle_highlight=(default:bold)

# Powerline
if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/cengels/google-cloud-sdk/path.zsh.inc' ]; then source '/home/cengels/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/cengels/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/cengels/google-cloud-sdk/completion.zsh.inc'; fi
