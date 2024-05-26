#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:~/Desktop/scripts/bas
#export ~scr=
#export ~des
#export ~dow
#export ~bac

term(){ 
	nohup alacritty $* &
}
#cmpl() { local cm =
#	term -e "echo $1 | entr -c $cm"; }

#create a file set execute permisions to it and open it in nvim
crsc(){ echo "#!/usr/bin/env bash" >> $1 && chmod +x $1 && nvim $1;}

alias ed=nvim
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'

PS1='[\u@\h \W]\$ '
