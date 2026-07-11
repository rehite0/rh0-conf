
local start_list={
	"dbus-update-activation-environment --systemd --all"
	,"systemctl --user start hyprland-session.target"
	,"systemctl --user start dms"
	,"systemctl --user start hyprpolkitagent"
	,"systemctl --user start hypridle"
	,"~/.config/hypr/script/battery_monitor.sh"
	,"kdeconnectd"
	,"emacs --daemon"
}
local shutdown_list={}

hl.on("hyprland.start", function ()
	for i in start_list do
		hl.exec_cmd(i)
	end
end)
hl.on("hyprland.shutdown", function ()
	for i in shutdown_list do
		hl.exec_cmd(i)
	end
end)
hl.on('config.reloaded',function()
	hl.notification.create{
		text='config reloaded'
		,timeout=300 }
end)
-- exec = notify-send -t 300 -a "System" "hyprland" "config reloaded" 
