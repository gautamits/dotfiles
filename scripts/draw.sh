#!/usr/bin/env bash
read -r X Y W H < <(slop -f "%x %y %w %h" -b 1 -t 0 -q)
# Width and Height in px need to be converted to columns/rows
# To get these magic values, make a fullscreen st, and 
#divide your screen width by ${tput cols}, height by ${tput lines} 
(( W /= 6 ))
(( H /= 14 ))
g=${W}x${H}+${X}+${Y}
#bspc rule -a st-256color -o state=floating
echo $g
if [ "$1" == "perl6" ]; then
    #st -g $g -e perl6
    termite --geometry $g floating
    #urxvt -g $g -name floating
else
    #st -g $g
    termite --geometry  $g floating
    # urxvt -g $g -name floating
fi
