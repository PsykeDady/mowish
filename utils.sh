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