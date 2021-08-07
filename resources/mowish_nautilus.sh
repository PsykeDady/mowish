#!/bin/bash

noaction=1;

while (( $# > 0 )); do
    
    file=$1
    if [[ -d "$file" ]]; then 
        mowish "$1";
        noaction=0
    fi;
    shift 
done

if (( noaction==1 )); then 
    mowish
fi

