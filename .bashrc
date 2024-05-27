# ~/.bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

HISTSIZE=HISTFILESIZE
export PATH=$PATH:~/Desktop/scripts/bas
export MANPAGER="nvim +Man!"

alias ~scr='cd ~/.scripts'
alias ~des='cd ~/Desktop'
alias ~dow='cd ~/Downloads'
alias ~bac='cd ~/backup'
alias ~git='cd ~/.git_repo'

term(){ 
	nohup alacritty $* &
}
cmpl(){
	local flags=''
	case $1 in
		'-f') flags="$flags $2" ; shift 2;;
		'-m') ls *.c | entr -c 'make && ./a.cout' && return 0;;
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
	echo $1 | entr -c $cm; 	
}
crsc(){ 
	case $1 in
		'-M')	cat ~/.scripts/tmplat/make_temp  >> Makefile && nvim Makefile ;;
		'-m')	cat ~/.scripts/tmplat/make_temp  >> makefile && nvim makefile ;;
		'-p')	echo '#!/usr/bin/env python' >> $2 && chmod +x $2 && nvim $2; ;;
		'-b')	echo '#!/usr/bin/env bash' >> $2 && chmod +x $2 && nvim $2; ;;
		*)	echo '#!/usr/bin/env bash' >> $1 && chmod +x $1 && nvim $1 ;;
	esac
}

alias ed='nvim'
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias cp='cp -i'
alias ln='ln -v'
alias mkdir='mkdir -pv'

PS1='[\u@\h \W]\$ '
