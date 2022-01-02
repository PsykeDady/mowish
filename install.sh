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
	which dolphin > /dev/null 2> /dev/null
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
		sudo mkdir "${kservices_local_path:?}"
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
	dolphinService=$(printf "$dolphinService\n" "${info_install_dolphin_action_name:?}" "${info_install_dolphin_action_name:?}" "${organize_directory:?}")

	infomsg "${info_install_dolphin_print:?}"

	infomsg "$dolphinService" | sudo tee "${kservices_mowish_local_path:?}"
}

function nautilusScript(){
	which nautilus > /dev/null 2> /dev/null
	status=$?

	if (( status!=0 )); then 
		return 0; 
	fi

	infomsg "${info_install_ask_nautilus:?}"
	read -r confirm 

	if [[ $confirm =~ ${decline_no:?} ]]; then 
		return 0;
	fi

	infomsg "${info_install_nautilus_local_warning:?}"

	if [[ ! -d "${nautilus_scripts_path:?}" ]]; then 
		mkdir -p "${nautilus_scripts_path:?}"
		status=$?
		if ((status!=0)); then 
			return 255;
		fi
	fi

	nautilus_mowish_scripts_path="${nautilus_scripts_path:?}/${organize_directory:?}"

	if [[ -e "${nautilus_mowish_scripts_path:?}" ]]; then 
		infomsg "${info_install_nautilus_exists:?}"
		read -r confirm 
		if [[ $confirm =~ ${decline_no} ]]; then
			return 0 
		fi
	fi

	infomsg "cp -f \"$MOWISH_DIR/${nautilus_mowish_resource:?}\" \"${nautilus_mowish_scripts_path:?}\"\n"
	cp -f "$MOWISH_DIR/${nautilus_mowish_resource:?}" "${nautilus_mowish_scripts_path:?}"
	chmod +x "$nautilus_mowish_scripts_path"

	infomsg "${info_install_nautilus_ask_quit:=?}"

	read -r confirm

	if [[ $confirm =~ ${confirm_yes:?} ]]; then 
		nautilus -q
	else 
		infomsg "${info_install_nautilus_quit_cmd:?}"
	fi

	infomsg "nautilus -q"
}

function nemoAction(){
	which nemo > /dev/null 2> /dev/null
	status=$?

	if (( status!=0 )); then 
		return 0; 
	fi

	infomsg "${info_install_ask_nemo:?}"
	read -r confirm 

	if [[ $confirm =~ ${decline_no:?} ]]; then 
		return 0;
	fi

	if [[ ! -d "${nemo_action_local_path:?}" ]]; then 
		sudo mkdir "${nemo_action_local_path:?}"
		infomsg "mkdir \"${nemo_action_local_path:?}\""
		status=$?
		if ((status!=0)); then 
			return 255;
		fi
	fi

	if [[ -e "${nemo_action_mowish_local_path:?}" ]]; then 
		infomsg "${info_install_nemo_exists:?}"
		read -r confirm 
		if [[ $confirm =~ ${decline_no} ]]; then
			return 0 
		fi
	fi

	nemoAction="$(cat "$MOWISH_DIR/${nemo_action_resource_path:?}")"

	# shellcheck disable=2059
	nemoAction=$(printf "$nemoAction\n" "${organize_directory:?}" "${organize_directory:?}")

	infomsg "${info_install_nemo_print:?}"

	infomsg "$nemoAction" | sudo tee "${nemo_action_mowish_local_path:?}"
}

function elementaryContract(){
	which io.elementary.files > /dev/null 2> /dev/null 

	status=$?

	if (( status!=0 )); then 
		return 0; 
	fi

	infomsg "${info_install_ask_elementary:?}"
	read -r confirm 

	if [[ $confirm =~ ${decline_no:?} ]]; then 
		return 0;
	fi

	if [[ ! -d "${elementary_local_path:?}" ]]; then 
		sudo mkdir "${elementary_local_path:?}"
		infomsg "sudo mkdir \"${elementary_local_path:?}\""
		status=$?
		if ((status!=0)); then 
			return 255;
		fi
	fi

	if [[ -e "${elementary_mowish_local_path:?}" ]]; then 
		infomsg "${info_install_elementary_exists:?}"
		read -r confirm 
		if [[ $confirm =~ ${decline_no} ]]; then
			return 0 
		fi
	fi

	elementaryContract="$(cat "$MOWISH_DIR/${elementary_resource_path:?}")"

	# shellcheck disable=2059
	elementaryContract=$(printf "$elementaryContract\n" "${organize_directory:?}" "${organize_directory:?}")

	infomsg "${info_install_elementary_print:?}"

	infomsg "$elementaryContract" | sudo tee "${elementary_mowish_local_path:?}"
}

function thunarAction(){
	which thunar > /dev/null 2> /dev/null 

	status=$?

	if (( status!=0 )); then 
		return 0; 
	fi

	infomsg "${info_install_ask_thunar:?}"
	read -r confirm 

	if [[ $confirm =~ ${decline_no:?} ]]; then 
		return 0;
	fi

	infomsg "${info_install_thunar_local_warning:?}"

	if [[ ! -d "${thunar_local_path:?}" ]]; then 
		mkdir "${thunar_local_path:?}"
		infomsg "mkdir \"${thunar_local_path:?}\""
		status=$?
		if ((status!=0)); then 
			return 255;
		fi
	fi

	if [[ ! -e "${thunar_mowish_local_path:?}" ]]; then 
		infomsg "<actions>\n</actions>" > "${thunar_mowish_local_path:?}"
	fi

	if grep -q "mowish" "${thunar_mowish_local_path:?}"; then 

		infomsg "${info_install_thunar_exists:?}"
		read -r confirm 
		if [[ $confirm =~ ${decline_no} ]]; then
			return 0 
		fi

		nl=$(wc -l "$MOWISH_DIR/${thunar_resource_path:?}" | cut -f 1 -d ' ')
		nlf=$( cat -n "${thunar_mowish_local_path:?}" | grep mowish | awk '{print $1}' )
		nlmow=$( cat -n "$MOWISH_DIR/${thunar_resource_path:?}" | grep mowish | awk '{print $1}' )

		nlf=$((nlf-nlmow))

		infomsg "$(head -$nlf "${thunar_mowish_local_path:?}")\n$(tail -$((nl-nlf-nlmow-1)) "${thunar_mowish_local_path:?}")" | tee "${thunar_mowish_local_path:?}"

	fi
	nl=$(wc -l "${thunar_mowish_local_path:?}"| cut -d' ' -f1)

	thunarActions="$(head -$((nl-1)) "${thunar_mowish_local_path:?}")"
	thunarAction="$(cat "$MOWISH_DIR/${thunar_resource_path:?}")"

	# shellcheck disable=2059
	thunarAction=$(printf "$thunarAction\n" "${organize_directory:?}" "${organize_directory:?}")

	infomsg "${info_install_thunar_print:?}"

	infomsg "$thunarActions\n$thunarAction\n</actions>" | sudo tee "${thunar_mowish_local_path:?}"
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

exists=$(which mowish 2> /dev/null)
status=$?

if (( status==0 )); then 
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
nemoAction
elementaryContract
thunarAction

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