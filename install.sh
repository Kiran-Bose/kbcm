#!/bin/bash
#kiran.vkvr@gmail.com
#https://github.com/Kiran-Bose/kbcm

savepath=$(pwd)

#------------------------------------------------------------------------------------------------
function install_binaries ()
{
instlist=()
instsrch=$(pwd)
instdirchk=("$instsrch"/*)
	for check in "${instdirchk[@]}"
	do
	Q=$( echo "$check" | rev | cut -d '/' -f 1 | rev )
		if [[ -d "$check" ]] && [[ "$Q" == "kbcm-"* ]]
		then
		instlist+=( "$check" )
		fi
	done
	if [[ "${#instlist[@]}" != 0 ]]
	then
	echo -e "Installing..."
	i=0
		for item in "${instlist[0]}"/*
		do
			case "$item" in
			"${instlist[0]}"/kbcm) sudo cp -f "$item" /usr/local/bin && sudo chmod +x /usr/local/bin/kbcm &&
			i=$(($i+1));;
			"${instlist[0]}"/progress_bar) sudo cp -f "$item" /usr/local/bin && sudo chmod +x /usr/local/bin/progress_bar &&
			i=$(($i+1));;
			esac
		done
		case $i in
		0)echo -e "No files installed";;
		2)echo -e "Successfully installed binaries";;
		*)echo -e "Unknown error during installation";;
		esac
	else
	echo -e "No installables found"
	fi

}

#------------------------------------------------------------------------------------------------
checkInternet()
{
  ping -c2 github.com > /dev/null 2>&1 || { echo -e "Error: no active internet connection" >&2; return 1; }
}

#------------------------------------------------------------------------------------------------
if [[ -f /usr/bin/kbcm ]]
then
echo -e "kbcm is already installed through package manager. You should uninstall through package manager to proceed with this install"
else
	if command -v kbcm &>/dev/null; then
	echo -e "kbcm is already installed. Do you want to check for updates?(y/n)"
	read upch
		case $upch in
		y|Y)checkInternet || return 1
			    if [[ -f /usr/local/bin/progress_bar ]]; then
			    . /usr/local/bin/progress_bar 
			    else
			    echo 'Update Failed'
			    return 1
			    fi
		    upstreamversion=$(curl -A curl -s https://api.github.com/repos/kiran-bose/kbcm/tags | grep -Eo '"name":.*?[^\\]",'| head -1 | grep -Eo "[0-9.]+" )
		    if [[ $upstreamversion == "" ]]; then
    		    echo "Error: no active internet connection" >&2
    		    return 1
		    elif [[ $kbcmversion == "" ]]; then
		    echo "kbcm is installed with supreme. Cannot update due to conflict"
		    return 1
  		    else
	    		    if [[ "$upstreamversion" != "$kbcmversion" ]]; then
	      		    echo "Version $upstreamversion available"
			    echo -e "Do you wish to update? (y/n)"
			    read upans
				case $upans in
				y|Y)cd ~ || { echo 'Update Failed'; return 1; }
		    		    if [[ -d kbcm ]]
		    		    then
		    	            sudo rm -rf kbcm
		    		    fi
		    		    git clone https://github.com/kiran-bose/kbcm && echo "Done"
				    cd kbcm || { echo 'Update Failed'; return 1; }
				    install_binaries
					    if [[ -d "$savepath" ]]; then
					    cd
					    cd "$savepath"
					    fi;;
				esac
			    else
			    echo -e "No updates available for kbcm"
			    fi
		     fi;;
		esac
	else
	install_binaries
	fi
fi
