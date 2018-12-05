#!/bin/bash
#kiran.vkvr@gmail.com
#https://github.com/Kiran-Bose/kbcm

if [[ -f /usr/bin/kbcm ]]
then
echo -e "kbcm is installed through package manager. You should uninstall through package manager."
else
	if command -v kbcm &>/dev/null; then
		echo -e "Are you sure you want to uninstall kbcm? (y/n)"
		read remopt
		case "$remopt" in
		y|Y)if [[ -f /usr/local/bin/kbcm ]]
		    then
		    sudo rm -vf /usr/local/bin/kbcm  
		    fi
		    if [[ -f /usr/local/bin/progress_bar ]]
		    then
		    sudo rm -vf /usr/local/bin/progress_bar  
		    fi
		    echo;;
		*)echo -e "You opted out from uninstalling kbcm";;
		esac
	else
	echo "kbcm not installed: Hence not removed"
	fi
fi
    
