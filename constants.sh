#!/bin/bash

# This file is part of "MOWISH" by PsykeDady
# released under GPLv3. Read LICENSE file or footer of mowi.sh file

## PLACES
export dolphin_servicemenu_user_local_path="${XDG_DATA_HOME:-$HOME/.local/share}/kio/servicemenus"
export dolphin_servicemenu_user_legacy_path="${XDG_DATA_HOME:-$HOME/.local/share}/kservices5/ServiceMenus"
export dolphin_servicemenu_system_local_path="/usr/share/kio/servicemenus"
export dolphin_servicemenu_system_legacy_path="/usr/share/kservices5"
export dolphin_servicemenu_system_very_legacy_path="/usr/share/kservices"
export dolphin_servicemenu_filename="mowish.desktop"
export kservices_local_path="$dolphin_servicemenu_user_local_path"
export kservices_mowish_local_path="$kservices_local_path/$dolphin_servicemenu_filename"
export kservices_resource_path="resources/mowish_dolphine.desktop"
export nautilus_scripts_path="$HOME/.local/share/nautilus/scripts"
export nautilus_mowish_resource="resources/mowish_nautilus.sh"
export nemo_action_local_path="/usr/share/nemo/actions"
export nemo_action_mowish_local_path="$nemo_action_local_path/mowish.nemo_action"
export nemo_action_resource_path="resources/mowish_nemo.nemo_action"
export elementary_local_path="/usr/share/contractor"
export elementary_mowish_local_path="$elementary_local_path/mowish.contract"
export elementary_resource_path="resources/mowish_elementary.contract"
export thunar_local_path="$HOME/.config/Thunar"
export thunar_mowish_local_path="$thunar_local_path/uca.xml"
export thunar_resource_path="resources/mowish_thunar.action"

### TRANSLATIONS 
export TRANSLATION_DIR="translations"
export IT="it_IT.sh"
export EN="en_EN.sh"
