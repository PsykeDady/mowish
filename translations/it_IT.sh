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
export err_others_not_directory="parametro indicato non /u00e8 una directory"

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
export dbg_order_type="tipo file"

### DEBUG CREATE MOVE METHOD
export dbg_createMove_createdir="creo la cartella "

