#!/bin/bash

PTH="/home/ikac/mnt/Fax/DrugaGodina/os1/projekat/zadatak/project/src/asm/"
FILE="asmcode.asm"

rm $(find $PTH*.S)

while read p; do
    firstChar=${p:0:1}
    if [ "$firstChar" == "#" ] 
    then
        newFIle="${p%%-*}"
    else
        echo "$p" >> "$PTH${newFIle:1:50}"
    fi 
    
done < "$PTH$FILE"