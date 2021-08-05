#!/bin/bash

# This file is part of "MOWISH" by PsykeDady
# released under GPLv3. Read LICENSE file or footer of mowi.sh file

## VARIABLES

menu_help_msg="MOWISH (Make Order WIth baSH) \u00e8 un client che permette di mettere ordine nelle tue cartelle con bash!"
menu_help_msg=$menu_help_msg"\n""Uso:"
menu_help_msg=$menu_help_msg"\n""\nOrdina una cartella:"
menu_help_msg=$menu_help_msg"\n""\t$0 [percorso/cartella]"
menu_help_msg=$menu_help_msg"\n""Se non inserita una posizione viene automaticamente prelevata quella corrente"
menu_help_msg=$menu_help_msg"\n""Per seguire attivamente il progetto, vai su http://github.com/PsykeDady/movish"
export menu_help_msg

### CONFIRM DECLINE
export confirm_yes="^[Ss]$"
export decline_no="^[Nn]$"

### DIRECTORIES
export PICTURE_DIR="Immagini"
export MUSIC_DIR="Musica"
export VIDEO_DIR="Video"
export DOCUMENT_DIR="Documenti"
export SCRIPT_DIR="Codici"
export TEXT_DIR="Testo"
export BIN_DIR="Eseguibili"
export ARCHIVE_DIR="Archivi"
export UNKNOWN_DIR="Altri"


## ERRORS
export err_action_first="l'operazione va specificata prima di altri eventuali parametri"
export err_toomuch_parameters="altri parametri non ammessi con questa operazione"
export err_wrong_parameter_numbers="numero parametri errato"
export err_internal_error="Errore interno a funzione"
export err_others_not_directory="parametro indicato non \u00e8 una directory"

## DEBUG
export dbg_start_method="inizio metodo"
export dbg_parameter_msg="\tparametro"
export dbg_exit_value=" valore di uscita ";
export dbg_actual_op=" operazione attuale = ";
export dbg_actual_others=" altri parametri = ";
export dbg_others_empty="non \u00e8 stata indicata alcuna directory. Uso cartella corrente"
export dbg_others_not_slash="parametro indicato non contiene slash finale. Aggiunto"
export dbg_others_not_slash="parametro indicato non assoluto. Aggiunta pwd"
export dbg_others_not_slash_after="parametro indicato non ha slash finale. Aggiunta"
export dbg_end="\nUscita con stato OK!";

### DEBUG ORDER METHOD
export dbg_order_actual_file="file in analisi"
export dbg_order_is_directory="\u00e8 una cartella, salta."
export dbg_order_is_directory_recursive="\u00e8 una cartella, entrata ( flag di ricorsione abilitato) "
export dbg_order_recursive_level="livello di ricorsione="
export dbg_order_type="tipo file"

### DEBUG CREATE MOVE METHOD
export dbg_createMove_createdir="creo la cartella "


## INFO-LOG / OTHERS SCRIPT

### install
export info_install_start="Inizia l'installazione di MOWISH, seguiranno i log delle operazioni che vengono effettuate per installare il software. In caso di problemi aprire un ISSUE su github: http://github.com/PsykeDady/movish\n"
export info_install_found_mowish="Trovato mowish come eseguibile nel path: %s sovrascriverlo? [s/N]"
export info_install_not_overwrite="mowish non sovrascritto. Installazione interrotta"
export info_install_err_int="la cartella specificata non esiste. Errore interno contattare lo sviluppatore"
export info_install_err_cp="errore nella copia. Contatta lo sviluppatore inoltrando eventuali log"
export info_install_err_ln="errore nel link dell'eseguibile. Contatta lo sviluppatore inoltrando eventuali log"
export info_install_finish="Installazione Completata \u2713 \nPuoi avviare il comando con: "
export info_install_dir_pwd="La cartella di installazione \u00e8 il tuo percorso corrente. L'eliminazione potrebbe non andare a buon fine\n"
export info_install_ask_remove="\nEliminare la cartella di installazione [s/N]? "
export info_install_done_remove="Eliminata"
export info_install_failed_remove="Non sono riuscito ad eliminare la cartella."
export info_install_remove_no="Cartella preservata."
export info_install_man_remove="Puoi cancellarla tu stesso con:"


### uninstall
export info_uninstall_start="Inizia la rimozione di MOWISH, seguiranno i log delle operazioni che vengono effettuate per eliminare il software. In caso di problemi aprire un ISSUE su github: http://github.com/PsykeDady/movish\n"
export info_uninstall_err_not_found="Mowish non trovato nel tuo sistema. Uscita..."
export info_uninstall_found_at="Mowish trovato eseguibile in "
export info_uninstall_link_resolved="risoluzione collegamento simbolico come "
export info_uninstall_installation_dir="la cartella di installazione risulta essere"
export info_uninstall_ask="confermare disinstallazione? [S/n]"
export info_uninstall_err_bin="errore nella cancellazione eseguibile bin"
export info_uninstall_err_dir="errore nella cancellazione directory installazione"
export info_uninstall_done="Disinstallazione terminata \u2713"
export info_uninstall_stop="Disinstallazione interrotta"
