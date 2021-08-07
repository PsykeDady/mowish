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

function dolphinService(){
	which dolphin > /dev/null
	status=$?

	if (( status!=0 )); then 
		return 0; 
	fi

	infomsg "${info_install_ask_dolphin:?}"
	read -r confirm 

	if [[ $confirm =~ ${decline_no:?} ]]; then 
		return 0;
	fi

	if [[ ! -d "${kservices_local_path:?}" ]]; then 
		mkdir "${kservices_local_path:?}"
		status=$?
		if ((status!=0)); then 
			return 255;
		fi
	fi

	if [[ -e "${kservices_mowish_local_path:?}" ]]; then 
		infomsg "${info_install_dolphin_exists:?}"
		read -r confirm 
		if [[ $confirm =~ ${decline_no} ]]; then
			return 0 
		fi
	fi

	dolphinService="$(cat "$MOWISH_DIR/${kservices_resource_path:?}")"

	# shellcheck disable=2059
	dolphinService=$(printf "$dolphinService\n" "${info_install_dolphin_action_name:?}" "${info_install_dolphin_action_name:?}" "${info_install_dolphin_menu_name:?}")

	infomsg "${info_install_dolphin_print:?}"

	echo "$dolphinService" | tee "${kservices_mowish_local_path:?}"
}

function nautilusScript(){
	which nautilus > /dev/null
	status=$?

	if (( status!=0 )); then 
		return 0; 
	fi

	infomsg "${info_install_ask_nautilus:?}"
	read -r confirm 

	if [[ $confirm =~ ${decline_no:?} ]]; then 
		return 0;
	fi

	if [[ ! -d "${nautilus_scripts_path:?}" ]]; then 
		mkdir "${nautilus_scripts_path:?}"
		status=$?
		if ((status!=0)); then 
			return 255;
		fi
	fi

	nautilus_mowish_scripts_path="${nautilus_scripts_path:?}/${info_install_nautilus_menu:?}"

	if [[ -e "${nautilus_mowish_scripts_path:?}" ]]; then 
		infomsg "${info_install_nautilus_exists:?}"
		read -r confirm 
		if [[ $confirm =~ ${decline_no} ]]; then
			return 0 
		fi
	fi

	infomsg "cp -f \"$MOWISH_DIR/${nautilus_mowish_resource:?}\" \"${nautilus_mowish_scripts_path:?}\"\n"
	cp -f "$MOWISH_DIR/${nautilus_mowish_resource:?}" "${nautilus_mowish_scripts_path:?}"

	infomsg "${info_install_nautilus_ask_quit:=?}"

	read -r confirm

	if [[ $confirm =~ ${confirm_yes:?} ]]; then 
		nautilus -q
	else 
		infomsg "${info_install_nautilus_quit_cmd:?}"
	fi

	infomsg "nautilus -q"


}

MOWISH_DIR="$(readlink "$0")"

if [ "$MOWISH_DIR" == "" ]; then 
	MOWISH_DIR="$(dirname "$0")"
else 
	MOWISH_DIR="$(dirname "$MOWISH_DIR")"
fi

if [[ "$MOWISH_DIR" == "." ]]; then 
	MOWISH_DIR="$PWD"
elif [[ ! "$MOWISH_DIR" =~ /.* ]]; then 
	MOWISH_DIR="$PWD"/"$MOWISH_DIR"
fi

CONSTANTS_FILE="$MOWISH_DIR/constants.sh"
UTILS_FILE="$MOWISH_DIR/utils.sh"

## SOURCES
# shellcheck disable=SC1091 disable=SC1090
source "${CONSTANTS_FILE:?}"
# shellcheck disable=SC1091 disable=SC1090
source "${UTILS_FILE:?}"

loadTranslation

infomsg "${info_install_start:?}"

exists=$(which mowish)
status=$?

if ((status==0)); then 
	# shellcheck disable=SC2059
	infomsg "$(printf "${info_install_found_mowish:?}" "$exists")"
	read -r confirm
	if [[ ! "$confirm" =~ ${confirm_yes:?} ]]; then
		infomsg "${info_install_not_overwrite:?}";
		exit 0
	fi
	infomsg "sudo rm -rf /usr/share/mowish"
	sudo rm -rf /usr/share/mowish
	infomsg "sudo rm \"$exists\""
	sudo rm "$exists" 
fi



infomsg "MOWISH_DIR=${MOWISH_DIR:?}"

if [[ ! -d ${MOWISH_DIR:?} ]]; then 
	error "${info_install_err_int:?}"
	exit 255
fi

infomsg "sudo cp -rf \"${MOWISH_DIR:?}\" /usr/share/mowish"

sudo cp -rf "${MOWISH_DIR:?}" /usr/share/mowish
status=$?
if [[ ! -d /usr/share/mowish ]] || (( status != 0 )); then 
   error "${info_install_err_cp:?}"
   exit 255;
fi

infomsg "sudo ln -sf /usr/share/mowish/mowi.sh /usr/bin/mowish" 

sudo ln -sf /usr/share/mowish/mowi.sh /usr/bin/mowish
status=$?

if [[ ! -e /usr/bin/mowish ]] || (( status != 0 )); then 
   error "${info_install_err_ln:?}"
   exit 255;
fi

infomsg "${info_install_finish:?}"
infomsg "mowish -h"

dolphinService
nautilusScript

infomsg "${info_install_ask_remove:?}"
read -r confirm

if [[ "$confirm" =~ ${confirm_yes:?} ]];then 
	if [[ "$PWD" == "${MOWISH_DIR:?}" ]] || [[ "." == "${MOWISH_DIR:?}" ]]; then
		infomsg "${info_install_dir_pwd:?}"
		infomsg "cd .."
		cd ..
	fi
	infomsg "rm -rf \"${MOWISH_DIR:?}\""
	rm -rf "${MOWISH_DIR:?}"
	status=$?
	
	if [[ -d "${MOWISH_DIR:?}" ]] || (( status != 0 )); then 
		error "${info_install_failed_remove:?}"
		error "${info_install_man_remove:?}"
		infomsg "rm -rf \"${MOWISH_DIR:?}\""
	else 
		infomsg "${info_install_done_remove:?}"
	fi
else 
	infomsg "${info_install_remove_no:?}"
	infomsg "${info_install_man_remove:?}"
	infomsg "rm -rf \"${MOWISH_DIR:?}\""
fi


exit 0