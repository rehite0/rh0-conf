#
# ~/.bashrc
#

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
cmpl() {
	if [ -f $1 ] ; then
		case $1 in
			*.py)	local cm="python $1"			;;
			*.c)	local cm="cc $1 -o a.out && ./a.out"	;;
			*)	echo 'cannot cmpl' && return 1		;;
		esac
	else
		echo "not a valid file"
	fi
	echo $1 | entr -c $cm; 	
}
#create a file set execute permisions to it and open it in nvim
crsc(){ echo "#!/usr/bin/env bash" >> $1 && chmod +x $1 && nvim $1;}

alias ed=nvim
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias cp='cp -i'
alias ln='ln -v'
alias mkdir='mkdir -pv'

PS1='[\u@\h \W]\$ '
