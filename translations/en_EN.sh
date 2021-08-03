#!/bin/bash

# This file is part of "MOWISH" by PsykeDady
# released under GPLv3. Read LICENSE file or footer of mowi.sh file

## VARIABLES

menu_help_msg="MOWISH (Make Order WIth baSH) is a script bash which make order in yours directory categorizing every file inside"
menu_help_msg=$menu_help_msg"\n""Use:"
menu_help_msg=$menu_help_msg"\n""\nOrder and catergorizing only and every files:"
menu_help_msg=$menu_help_msg"\n""\t$0 [path/dir]"
menu_help_msg=$menu_help_msg"\n""If no path is passed, working directory is used"
menu_help_msg=$menu_help_msg"\n""To follow the project, go to http://github.com/PsykeDady/movish"
export menu_help_msg

### DIRECTORIES
export PICTURE_DIR="Images"
export MUSIC_DIR="Music"
export VIDEO_DIR="Video"
export DOCUMENT_DIR="Documents"
export SCRIPT_DIR="Scripts"
export TEXT_DIR="Text Files"
export BIN_DIR="Binary"
export ARCHIVE_DIR="Archives"
export UNKNOWN_DIR="Others"


## ERRORS
export err_action_first="operations go specified before others params"
export err_toomuch_parameters="others parameters not allowed with this operation"
export err_wrong_parameter_numbers="wrong parameter numbers"
export err_internal_error="Internal unknown error"
export err_others_not_directory="speicified parameter is not a directory"

## DEBUG
export dbg_start_method="method start"
export dbg_parameter_msg="\tparameter"
export dbg_exit_value=" exit value= ";
export dbg_actual_op=" actual operation = ";
export dbg_actual_others=" others parameter = ";
export dbg_others_empty="No directory specified. Using working directory"
export dbg_others_not_slash="directory is not in absolute form. Updated with pwd"
export dbg_others_not_slash_after="Indicated dir has not / at the end. Added"
export dbg_end="\nexit with OK status!";

### DEBUG ORDER METHOD
export dbg_order_actual_file="look for file"
export dbg_order_is_directory="is directory. skip"
export dbg_order_type="file type"

### DEBUG CREATE MOVE METHOD
export dbg_createMove_createdir="create dir "

