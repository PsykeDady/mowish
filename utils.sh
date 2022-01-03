#!/bin/bash

# This file is part of "MOWISH" by PsykeDady
# released under GPLv3. Read LICENSE file or footer of mowi.sh file


## print a info message
function infomsg() {
	echo -e "$*"
}

## print error 
function error (){
	echo -e "[ERR] : $*" > /dev/stderr
}

## delete thunar action, needed for install and uninstall
function deleteThunarAction(){

	nlf=$(awk  '
		BEGIN{
				mowish_section=0;
		}
		{
				if ( $0 ~ "mowish" ) {
						row_mowish=NR;
						mowish_section=1;
				}
				if( mowish_section==0 ) {
						if($0=="<action>")
								last_action=NR; 
				} else if(mowish_section==1) {
						if($0=="</action>") {
								mowish_section=2;
								last_action_end=NR;
						}
				}
		} 
		END {
				print((last_action-1)";"row_mowish";"last_action_end";"NR-last_action_end);
		}' "${thunar_mowish_local_path:?}")

		headuca=$(cut -d ';' -f1 <<< "$nlf");
		tailuca=$(cut -d ';' -f4 <<< "$nlf");

		headuca=$(head -"$headuca" "${thunar_mowish_local_path:?}");
		tailuca=$(tail -"$tailuca" "${thunar_mowish_local_path:?}");

		infomsg "$headuca\n$tailuca" | tee "${thunar_mowish_local_path:?}"
}