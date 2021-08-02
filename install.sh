#!/bin/bash

# This file is part of "MOWISH" by PsykeDady
# released under GPLv3. Read LICENSE file or footer of dlpt.sh file

inst_dir="$0"

if [[ ! "$inst_dir" =~ /.* ]];then 
    inst_dir="$PWD/$inst_dir"
fi

echo "inst_dir/install.sh=$inst_dir"

inst_dir=$(dirname "$inst_dir")

echo "inst_dir=$inst_dir"

echo "sudo cp -rf \"$inst_dir\" /usr/share/mowish"

sudo cp -rf "$inst_dir" /usr/share/mowish

echo "sudo ln -sf /usr/share/mowish/mowi.sh /usr/bin/mowish" 

sudo ln -sf /usr/share/mowish/mowi.sh /usr/bin/mowish

echo "you can start script with:"
echo "mowish -h"