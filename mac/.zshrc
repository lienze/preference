
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

#commands for ll
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vi='/usr/local/Cellar/vim/8.1.1800/bin/vim'
#alias vim='/usr/local/Cellar/vim/8.1.1650/bin/vim'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# color of PS1
# PS1="\[\e[37;40m\][\[\e[32;40m\]\u\[\e[37;40m\]@\h \[\e[36;40m\]\w\[\e[37;40m\]]\[\e[0m\]$ "
# autoload -U colors && colors
PS1="%{$fg[green]%}%n@%{$fg[magenta]%}%(?..%?%1v)%m:%{$reset_color%}%{$fg[cyan]%}%~ "
# PS1="%{%F{red}%}%n%{%f%}@%{%F{blue}%}%m %{%F{yellow}%}%~ %{$%f%}%% "

PATH=$PATH:/usr/local/go/bin
PATH=$PATH:~/dev/gitstats
export GOPATH=~/gopkg
GO111MODULE=on

function proxy_on(){
	export http_proxy=http://127.0.0.1:1087
	export https_proxy=http://127.0.0.1:1087
	echo -e "proxy on success!"
}

function proxy_off(){
	unset http_proxy
	unset https_proxy
	echo -e "proxy off success!"
}
