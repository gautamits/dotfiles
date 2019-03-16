#!/bin/bash
[[ -f `pwd`/ip.sh ]] && . `pwd`/ip.sh
query=""
for  domain in ${!IP[@]}; do query+="TRUE $domain ${IP[$domain]} "; done
servers=$(zenity --list --checklist --title="choose the servers to shuttl" \
	--separator=" " \
	--column "Pick" \
	--column "domain" \
	--column "ip" \
	--print-column=3 \
	--hide-column=3 \
	$query )
sshuttle --dns -e "ssh -i ~/workspace/amit.key" -r amit@sso.magicpin.in $servers
