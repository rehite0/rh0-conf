#!/usr/bin/env bash

sudo bash ./install.sh

#create dirs & file
_files="\
d:~/.t
	d:~/.t/spy
	f:~/.t/a
	f:~/.t/a.c
	f:~/.t/a.py
d:~/downloads
	d:~/downloads/br
d:~/media
	d:~/media/img
	d:~/media/vid
	d:~/media/mus
	d:~/media/gimp
	d:~/media/obs
	d:~/media/maim
	d:~/media/blender
d:~/backup
d:~/scripts
	d:~/scripts/bp
#:config
	#s:.bashrc
	#s:nvim
	#s:qtile
	#s:rofi
	#s:alacritty
	#s:autostart
	#s:.scripts
	#s:ly

"

for i in $_files ; do
	_type=$(echo $i |cut -d":" -f1)
	_name=$(echo $i |cut -d":" -f2)

	if [ $_type = 's'] ; then
		[ -L $_name ] || ln -s $(echo _name |cut -d">" -f2) $(echo _name |cut -d">" -f2)
	fi

	if [ $_type = 'd'] ; then
		[ -d $_name ] || mkdir $_name
	fi

	if [ $_type = 'f'] ; then
		[ -f $_name ] || touch $_name
	fi

done

