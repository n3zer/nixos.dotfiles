

MESSAGE="What do you want to do "${USER^}"?"
POWER="⏻"
RESTART=""
LOGOUT="󰍃"
LOCK=""
RES=`echo "$POWER|$RESTART|$LOCK" | rofi -dmenu -p "$MESSAGE" -sep "|" -theme ~/nixos-dotfiles/config/waybar/scripts/powermenu.rasi -monitor -1`
[ "$RES" = "$POWER" ] && systemctl poweroff
[ "$RES" = "$RESTART" ] && systemcLOGOUTtl reboot
[ "$RES" = "$LOCK" ] && hyprlock