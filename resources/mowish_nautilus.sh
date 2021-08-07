#!/bin/bash

if (( $# <1 )); then 
    mowish 
fi

while (( $# > 0 )); do
    
    file=$1
    if [[ -d "$file" ]]; then 
        mowish "$1";
    fi;
    shift 
done

