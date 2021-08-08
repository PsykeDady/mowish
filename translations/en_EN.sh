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

### CONFIRM DECLINE
export confirm_yes="^[Yy]$"
export decline_no="^[Nn]$"

### DIRECTORIES
export PICTURE_DIR="Pictures"
export MUSIC_DIR="Music"
export VIDEO_DIR="Video"
export DOCUMENT_DIR="Documents"
export SCRIPT_DIR="Scripts and Codes"
export TEXT_DIR="Text Files"
export BIN_DIR="Binary"
export ARCHIVE_DIR="Archives"
export DISK_IMAGE_DIR="Disk Images"
export PACKAGES_DIR="Packages"
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


## INFO-LOG / OTHERS SCRIPT

### install
export info_install_start="Start of installation of MOWISH, operations log will be printed on output with every istruction that script will do. In case of problems or bugs open an ISSUE on github: http://github.com/PsykeDady/movish\n"
export info_install_found_mowish="mowish found as executable on path: %s. Overwrite? [y/N]"
export info_install_not_overwrite="mowish will be not overwrited. Installation stopped"
export info_install_err_int="specified directory not exists. Internal error, please send report to dev"
export info_install_err_cp="Error occurred during copy. Please send report to dev"
export info_install_err_ln="Error occurred during link executable. Please send report to dev"
export info_install_finish="Installation done \u2713 \nYou can use script with: "
export info_install_dir_pwd="The directory of this installation script is same of your current working directory. Deleting it can fail\n"
export info_install_ask_remove="\nDeleting directory of installation script? [y/N] "
export info_install_done_remove="Deleted"
export info_install_failed_remove="I can't delete the directory"
export info_install_remove_no="Directory not deleted by choise."
export info_install_man_remove="You can delete when you want by write:"


### uninstall
export info_uninstall_start="Start of uninstallation of MOWISH, operations log will be printed on output with every istruction that script will do. In case of problems or bugs open an ISSUE on github: http://github.com/PsykeDady/movish\n"
export info_uninstall_err_not_found="Mowish not found in this system. Exit..."
export info_uninstall_found_at="Mowish founded on "
export info_uninstall_link_resolved="resolved symbolic link as "
export info_uninstall_installation_dir="Installation directory is"
export info_uninstall_ask="Confirm deleting? [Y/n]"
export info_uninstall_err_bin="error on executable deleting"
export info_uninstall_err_dir="error on directory deleting"
export info_uninstall_done="Uninstall done \u2713"
export info_uninstall_stop="Uninstall stopped"
