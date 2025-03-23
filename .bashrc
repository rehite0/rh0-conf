# ~/.bashrc
#

#for login
if [[ $(tty) = '/dev/tty3' ]] then
	sudo chvt 2 && exit
fi

_imode='true' #true if running interactively
[[ $- != *i* ]] && _imode='false'
alias IM='$_imode && '

HISTSIZE=HISTFILESIZE
IM	export PATH=$PATH:~/.scripts:~/.local/bin
	export PYTHONPATH=$PYTHONPATH:~/.scripts/mylibs/pylibs
	export MANWIDTH=100
	export MANPAGER="nvim +Man!"
#	export CS="None"

	export scr="$HOME/.scripts"
	export des="$HOME/Desktop"
	export dow="$HOME/Downloads"
	export bac="$HOME/backup"
	export git="$HOME/.git_repo"

IM	alias maim='maim -sb 4 -c 1,0.5,0.5,0.9'
IM	alias scs='maim -s|tee ~/media/screen_shot/$(date +%s).png| xclip -selection clipboard -t image/png'
IM	alias fcd='cd $(fzf --walker=dir,hidden,follow)'
IM	alias fman='man -k . | fzf --tiebreak=begin -m | awk '\''{print $1 $2}'\''| xargs man'
IM	alias fcmd="compgen -c | fzf | xargs man"
IM	alias fkill='kill $(ps -eF|fzf|awk '\''{print $2}'\'')'
IM	alias ed='nvim'
IM	alias fed='nvim $(fzf)'
IM	alias his='eval $(history |sort -rn|fzf --tiebreak=index|cut -f3- -d" ")'
IM	alias ls='ls --color=auto'
IM	alias ll='ls -lah'
IM	alias grep='grep --color=auto'
IM	alias cp='cp -i'
IM	alias ln='ln -v'
IM	alias rm='rm -v'
IM	alias mkdir='mkdir -pv'
IM	alias chmod='chmod -v'
IM	alias py='python'

IM	qot

IM \
cmpl(){
	local flags=''
	case $1 in
		'-f') flags="$2" ; shift 2;;
		'-m') ls *.c | entr -cs 'make && ./a.out' ; return 0;;
	esac

	if [ -f $1 ] ; then
		case $1 in
			*.py)	local cm="python $flags $1"			;;
			*.c)	local cm="cc $flags $1 -o a.out && ./a.out"	;;
			*)	echo 'cannot cmpl' && return 1			;;
		esac
	else
		echo "not a valid file"
	fi
	echo $1 | entr -cs $cm; 	
}

IM \
crsc(){ 
	case $1 in
		'-M')	cat ~/.scripts/tmplat/make_temp  >> Makefile && nvim Makefile	;;
		'-m')	cat ~/.scripts/tmplat/make_temp  >> makefile && nvim makefile	;;
		'-p')	echo '#!/usr/bin/env python' >> $2 && chmod +x $2 && nvim $2	;;
		'-b')	echo '#!/usr/bin/env bash' >> $2 && chmod +x $2 && nvim $2		;;
		*)		echo '#!/usr/bin/env bash' >> $1 && chmod +x $1 && nvim $1		;;
	esac
}

IM	S1='[\u@\h \W]\$ '

unalias IM
unset _imode
