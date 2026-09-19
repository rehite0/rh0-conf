
local start_list={
	"systemctl --user start dms"
	,"systemctl --user start emacs"
	,"systemctl --user start hypridle"
	,"dbus-update-activation-environment --systemd --all"
	,"systemctl --user start hyprland-session.target"
	,"systemctl --user start hyprpolkitagent"
	,"~/.config/hypr/script/battery_monitor.sh"
}
local shutdown_list={}

hl.on("hyprland.start", function ()
	for i,v in ipairs(start_list) do
		hl.exec_cmd(v)
	end
end)
hl.on("hyprland.shutdown", function ()
	for i,v in ipairs(shutdown_list) do
		hl.exec_cmd(v)
	end
end)
hl.on('config.reloaded',function()
	hl.notification.create{
		text='config reloaded'
		,timeout=3000 }
end)
