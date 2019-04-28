#!/bin/bash
[[ -f ~/ip.sh ]] && . ~/ip.sh
query=""
for  domain in ${!IP[@]}; do query+="TRUE $domain ${IP[$domain]} "; done
servers=$(zenity --list --checklist --title="choose the servers to shuttl" \
	--separator=" " \
	--column "Pick" \
	--column "domain" \
	--column "ip" \
	--width=500 \
	--height=500 \
	--print-column=3 \
	--hide-column=3 \
	$query )
sshuttle  --dns -e "ssh -i ~/workspace/amit.key" -r amit@sso.magicpin.in $servers
