# ~/.bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=HISTFILESIZE
export PATH=$PATH:~/Desktop/scripts/bas
export MANPAGER="nvim +Man!"

export scr="$HOME/.scripts"
export des="$HOME/Desktop"
export dow="$HOME/Downloads"
export bac="$HOME/backup"
export git="$HOME/.git_repo"

alias fcd='cd $(fzf --walker=dir,hidden,follow)'
alias fman=$'man $(man -k . |fzf --tiebreak=begin -m | awk \'{print $1 $2}\')'
alias fcmd="compgen -c | fzf | xargs man"
alias ed='nvim'
alias fed='nvim $(fzf)'
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias cp='cp -i'
alias ln='ln -v'
alias mkdir='mkdir -pv'


term(){ 
	nohup alacritty $* &
}
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
crsc(){ 
	case $1 in
		'-M')	cat ~/.scripts/tmplat/make_temp  >> Makefile && nvim Makefile	;;
		'-m')	cat ~/.scripts/tmplat/make_temp  >> makefile && nvim makefile	;;
		'-p')	echo '#!/usr/bin/env python' >> $2 && chmod +x $2 && nvim $2	;;
		'-b')	echo '#!/usr/bin/env bash' >> $2 && chmod +x $2 && nvim $2	;;
		*)	echo '#!/usr/bin/env bash' >> $1 && chmod +x $1 && nvim $1	;;
	esac
}

PS1='[\u@\h \W]\$ '
