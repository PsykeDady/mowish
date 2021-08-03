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

executable=$(which mowish)
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

infomsg "${info_uninstall_done:?}"

exit 0
