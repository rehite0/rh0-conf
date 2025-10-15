#@~/.bashrc

#for login
if [[ $(tty) = '/dev/tty3' ]] then
	sudo chvt 2 && exit
fi

_imode='true' #true if running interactively
[[ $- != *i* ]] && _imode='false'
alias IM='$_imode && '

HISTSIZE=HISTFILESIZE
	export PATH="$PATH:$HOME/.scripts:$HOME/.local/bin:$HOME/.config/composer/vendor/bin"
	export PYTHONPATH=$PYTHONPATH:~/.scripts/pylibs
	export C_INCLUDE_PATH+=:~/.scripts/cutil
	export MANWIDTH=100
	export MANPAGER="nvim +Man!"
	export FCEDIT="nvim"
	export EDITOR="nvim"

	export scr="$HOME/.scripts"
	export des="$HOME/Desktop"
	export dow="$HOME/Downloads"
	export bac="$HOME/backup"
	export git="$HOME/.git_repo"
	[ -f "/home/rh0/.ghcup/env" ] && . "/home/rh0/.ghcup/env" # ghcup-env

IM	set -o vi
IM	shopt -s autocd

IM	alias g='git'
IM	alias ed='nvim'
IM	alias py='python'
IM	alias wcc='gcc @${HOME}/.ccflg'
IM	alias scs='sshot'
IM	alias fcd='cd $(fzf --walker=dir,hidden,follow)'
IM	alias fkill='kill $(ps -eF|fzf|awk '\''{print $2}'\'')'
IM	alias his='eval $(history |sort -rn|fzf --tiebreak=index|cut -f3- -d" ")'
IM	alias ls='ls --color=auto'
IM	alias ll='ls -lah'
IM	alias grep='grep --color=auto'
IM	alias cp='cp -i'
IM	alias ln='ln -v'
IM	alias rm='rm -v'
IM	alias mkdir='mkdir -pv'
IM	alias chmod='chmod -v'

IM	qot


sshot(){
	spectacle
	# local file=~/media/screen_shot/$(date +%s).png;
	# slurp | grim -t png -g - - | tee ${file} | wl-copy
	# notify-send -a grim 'screenshot taken!' "${file}"
}

IM \
dup(){
	nohup alacritty -e bash & 
	sleep 0.1
}
IM \
fman(){
	local pg="$(man -k . |fzf --tiebreak=begin -m|awk '{gsub(/[()]/,"");print $2 " " $1}')"
	if [[ "$pg" == "" ]]; then
		echo 'nothing selected!!'
	else
		man $pg
	fi
}

IM	S1='[\u@\h \W]\$ '

unalias IM
unset _imode

