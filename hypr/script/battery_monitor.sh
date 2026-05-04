#!/usr/bin/env bash


while true; do
	state=$(upower -i $(upower -e|grep 'BAT') \
		| grep 'state:'|awk '{print $2}')
	percent=$(upower -i $(upower -e|grep 'BAT') \
		| grep 'percentage:'|awk '{print substr($2,1,length($2)-1)}')
	icon=$(upower -i $(upower -e|grep 'BAT') \
		| grep 'icon-name:'|tr "'" " " | awk '{print $2}' )

	if [[ $state == 'discharging' ]]; then
		if (( percent < 25 ));then
			notify-send -a 'System'\
				-u normal -t 300 -i "${icon}"\
				"Battery Low" "Level: ${percent}%"
			sleep 900
		elif (( percent < 10 ));then
			notify-send -a 'System'\
				-u critical -t 1000 -i "${icon}"\
				"Battery very Low" "Level: ${percent}%"
			brightnessctl -s set 10
			sleep 300
		else
			notify-send -a 'System'\
				-u normal -t 300 -i "${icon}"\
				"running in battery" "Level: ${percent}%"
			sleep 1200
		fi
	else
		sleep 1200;
	fi
done
