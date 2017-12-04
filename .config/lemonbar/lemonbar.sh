#!/bin/bash

background='#326CEE'
foreground='#326CEE'
color0='#B2E9FF'
color8='#367C97'
color1='#E32535'
color9='#93353C'
color2='#00DD0C'
color10='#00850655'
color3='#4DD2B2'
color11='#359E75'
color4='#61D7FF'
color12='#255693'
color5='#6EB845'
color13='#618C49'
color6='#AB3CDF'
color14='#8E35B8'
color7='#8D8CE955'
color15='#5857A3'

HIGHLIGHT="$color0"
clock() {
	TIME=$(date "+%H:%M")
    DATE=$(date "+%a, %b %d ")
	echo -n "%{F$HIGHLIGHT}$(printf '%b' "\uf017")%{F-} $TIME  %{F$HIGHLIGHT}$(printf '%b' "\uf073")%{F-} $DATE"
}
volume() {
	VOL=$(amixer get Master | grep % | sed -n 1p | awk -F '[' '{print $2}' | awk -F ']' '{print $1}')
#    VOL=$(pactl list sinks | grep "Volume: front-left" | cut -d " " -f6)
	if [ $VOL = '0%' ]; then
		echo -n "%{F$HIGHLIGHT}$(printf '%b' "\uf026")%{F-} Mute"
	else
		echo -n "%{F$HIGHLIGHT}$(printf '%b' "\uf028")%{F-} $VOL"
	fi
}
wifi() {
    echo -e "%{F$HIGHLIGHT} \uf1eb %{F-}$(iw wlp1s0 link | grep 'SSID' | cut -c 8-)"
}
#Copied from /u/Dylan112
workspace() {
	workspacenext="A4:i3-msg workspace next_on_output:"
        workspaceprevious="A5:i3-msg workspace prev_on_output:"
        wslist=$(\
                wmctrl -d \
                | awk '/ / {print $2 $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20}' ORS=''\
                | sed -e 's/\s*  //g' \
                -e 's/\*[ 0-9A-Za-z]*[^ -~]*/  &  /g' \
                -e 's/\-[ 0-9A-Za-z]*[^ -~]*/%{F'$color10'}%{A:i3-msg workspace &:}  &  %{A}%{F'$color0'}/g' \
                -e 's/\*//g' \
                -e 's/ -/ /g' \
                )
        echo -n "%{$workspacenext}%{$workspaceprevious}$wslist%{A}%{A}"
}
windowtitle(){
	# Grabs focused window's title
	# The echo "" at the end displays when no windows are focused.
	TITLE=$(xdotool getactivewindow getwindowname 2>/dev/null | sed -n 1p || echo "")
	TITLECUT=$(xdotool getactivewindow getwindowname 2>/dev/null | sed -n 1p | sed 's/\///g;s/-//g;s/ /\\/g' | cut -c 1-6 || echo "")

	if [ "$TITLECUT" = "glenn@" ]; then
		echo "$(printf '%b' "\ue1d9") $(echo "$TITLE" | cut -c 15-50)"
	else
		echo "$TITLE" | cut -c 1-50
	fi
}
bat() {
    status=$(cat /sys/class/power_supply/BAT0/status)
    capacity=$(cat /sys/class/power_supply/BAT0/capacity)

    if [ "$status" == "Charging" ]; then
        echo -e "%{F$HIGHLIGHT} \uf240 %{F-}$capacity%"
    elif (($capacity == 100)); then
        echo -e "%{F$HIGHLIGHT} \uf240 %{F-}$capacity%"
    elif (($capacity > 82)); then
        echo -e "%{F$HIGHLIGHT} \uf241 %{F-}$capacity%"
    elif (($capacity > 62)); then
        echo -e "%{F$HIGHLIGHT} \uf241 %{F-}$capacity%"
    elif (($capacity > 32)); then
        echo -e "%{F$HIGHLIGHT} \uf242 %{F-}$capacity%"
    elif (($capacity > 0)); then
        echo -e "%{F$HIGHLIGHT} \uf243 %{F-}$capacity%"
    else
        echo -e "%{F$HIGHLIGHT} \uf240 %{F-}$capacity%"
    fi
}
while true; do
    echo "%{B$color7} $(clock) $(volume) $(bat) $(wifi) %{B-}%{c} $(workspace) %{r}%{B-} %{B$color10} $(windowtitle) %{B-}"
	sleep 2;
done |

 lemonbar -p -d -B "$color7" -F "$color0" -g 1834x24+45+0\
 -f mononoki:size=8\
 -f FontAwesome:size=9\
 eDP-1\
 | zsh
