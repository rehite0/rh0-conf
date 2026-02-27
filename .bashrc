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
	export SUDO_ASKPASS="/usr/bin/ksshaskpass"

	export scr="$HOME/.scripts"
	export des="$HOME/Desktop"
	export dow="$HOME/Downloads"
	export bac="$HOME/backup"
	export git="$HOME/.git_repo"
	export prg="$HOME/Desktop/program"
	[ -f "/home/rh0/.ghcup/env" ] && . "/home/rh0/.ghcup/env" # ghcup-env

IM	eval "$(direnv hook bash)"

IM	set -o vi
IM	shopt -s autocd

IM	alias :e='nvim'
IM	alias :c='fc'
IM	alias :q='exit'
IM	alias :n='dup'
IM	alias :g='git'
IM	alias edp='nvim +Man!'
IM	alias py='python'
IM	alias wcc='gcc @${HOME}/.ccflg'
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

IM	alias code='flatpak run com.visualstudio.code'
IM	alias fvivi='flatpak run com.vivaldi.Vivaldi'
IM	alias flatseal='flatpak run com.github.tchx84.Flatseal'

IM	qot	#my script to print quots

sshot(){
	spectacle
	# local file=~/media/screen_shot/$(date +%s).png;
	# slurp | grim -t png -g - - | tee ${file} | wl-copy
	# notify-send -a grim 'screenshot taken!' "${file}"
}
if [[ $_imode == 'true' ]] ; then 
dup(){
	nohup alacritty -e bash &>/dev/null &
	disown
}
fman(){
	local pg="$(man -k . |fzf --tiebreak=begin -m|awk '{gsub(/[()]/,"");print $2 " " $1}')"
	if [[ "$pg" == "" ]]; then
		echo 'nothing selected!!'
	else
		man $pg
	fi
}
fpy(){
	if [[ ! -e /tmp/pydoc ]]; then
		#too slow
		pydoc -k . 1>/tmp/pydoc 2>/dev/null
	fi
	local pg="$(cat /tmp/pydoc |fzf --tiebreak=begin -m |cut -d' ' -f1)"
	echo "$pg"
	if [[ "$pg" == "" ]]; then
		echo 'nothing selected!!'
	else
		pydoc $pg
	fi
}
qb(){
	nohup qutebrowser $@ &>/dev/null &
	disown
}
fi

IM	S1='[\u@\h \W]\$ '

unalias IM
unset _imode

