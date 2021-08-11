#!/bin/bash

# This file is part of "MOWISH" by PsykeDady
# released under GPLv3. Read LICENSE file or footer of mowi.sh file

function loadTranslation() {
	tdir="$MOWISH_DIR/${TRANSLATION_DIR:?}"
	translation_source="$tdir/${EN:?}"

	case $LANG in 
		"it"|"IT"|"it_IT"*) 
			translation_source="$tdir/${IT:?}"
		;;
	esac 

	# shellcheck disable=SC1091 disable=SC1090
	source "$translation_source"
}

function detectDolphinService(){
	if [[ -e "${kservices_mowish_local_path:?}" ]]; then
		infomsg "${info_uninstall_detected_dolphin_service:?} ${kservices_mowish_local_path:?}"

		return 1;
	fi

	return 0;
}

function detectNautilusScript(){
	if [[ -e  "${nautilus_scripts_path:?}/${organize_directory:?}" ]]; then 
		infomsg "${info_uninstall_detected_nautilus_script:?} ${nautilus_scripts_path:?}/${organize_directory:?}"

		return 1
	fi

	return 0;
}

function detectNemoAction(){
	if [[ -e  "${nemo_action_mowish_local_path:?}" ]]; then 
		infomsg "${info_uninstall_detected_nemo_action:?} ${nemo_action_mowish_local_path}"

		return 1
	fi

	return 0;
}

function detectElementaryContract(){
	if [[ -e  "${elementary_mowish_local_path:?}" ]]; then 
		infomsg "${info_uninstall_detected_elementary:?} ${elementary_mowish_local_path}"

		return 1
	fi

	return 0;
}

MOWISH_DIR="$(readlink "$0")"

if [ "$MOWISH_DIR" == "" ]; then 
	MOWISH_DIR="$(dirname "$0")"
else 
	MOWISH_DIR="$(dirname "$MOWISH_DIR")"
fi

if [[ "$MOWISH_DIR" == "." ]]; then 
	MOWISH_DIR=$PWD
elif [[ ! "$MOWISH_DIR" =~ /.* ]]; then 
	MOWISH_DIR=$PWD/$MOWISH_DIR
fi

CONSTANTS_FILE="$MOWISH_DIR/constants.sh"
UTILS_FILE="$MOWISH_DIR/utils.sh"

## SOURCES
# shellcheck disable=SC1091 disable=SC1090
source "${CONSTANTS_FILE:?}"
# shellcheck disable=SC1091 disable=SC1090
source "${UTILS_FILE:?}"

loadTranslation

infomsg "${info_uninstall_start:?}"

executable=$(which mowish 2> /dev/null)
status=$?

if ((status!=0)); then 
	# shellcheck disable=SC2059
	error "${info_uninstall_err_not_found:?}"
    exit 255
fi

infomsg "${info_uninstall_found_at:?} $executable"

original=$(readlink "$executable");

infomsg "${info_uninstall_link_resolved:?} $original"

installation_dir=$(dirname "$original")

infomsg "${info_uninstall_installation_dir:?} $installation_dir"

detectDolphinService
udolphin=$?

detectNautilusScript
unautilus=$?

detectNemoAction
unemo=$?

detectElementaryContract
uelementary=$?

infomsg "${info_uninstall_ask:?}"

read -r confirm 

if [[ "$confirm" =~ ${decline_no:?} ]]; then
    infomsg "${info_uninstall_stop:?}"
    exit 0
fi

infomsg "sudo rm \"$executable\""
sudo rm "$executable" 

status=$?
if (( status != 0 )) &&  [[ -e $executable ]]; then 
    error "${info_uninstall_err_bin:?}"
    exit 255
fi

infomsg "sudo rm -rf \"$installation_dir\""
sudo rm -rf "$installation_dir"

status=$?
if (( status != 0 )) &&  [[ -d $installation_dir ]]; then 
    error "${info_uninstall_err_bin:?}"
    exit 255
fi

if (( udolphin==1 )); then 
	infomsg "sudo rm \"${kservices_mowish_local_path:?}\""
	sudo rm "${kservices_mowish_local_path:?}"
	status=$?
	if (( status!=0 )); then 
		error "${info_uninstall_err_dolphin:?}"
    	exit 255
	fi
fi

if (( unautilus==1 )); then 
	infomsg "sudo rm \"${nautilus_scripts_path:?}/${organize_directory:?}\""
	sudo rm "${nautilus_scripts_path:?}/${organize_directory:?}"
	status=$?
	if (( status!=0 )); then 
		error "${info_uninstall_err_nautilus:?}"
    	exit 255
	fi
fi

if (( unemo==1 )); then 
	infomsg "sudo rm \"${nemo_action_mowish_local_path:?}\""
	sudo rm "${nemo_action_mowish_local_path:?}"
	status=$?
	if (( status!=0 )); then 
		error "${info_uninstall_err_nemo:?}"
    	exit 255
	fi
fi

if (( uelementary==1 )); then 
	infomsg "sudo rm \"${nemo_action_mowish_local_path:?}\""
	sudo rm "${nemo_action_mowish_local_path:?}"
	status=$?
	if (( status!=0 )); then 
		error "${info_uninstall_err_elementary:?}"
    	exit 255
	fi
fi

infomsg "${info_uninstall_done:?}"

exit 0
