#!/bin/bash

PTH="/home/ikac/shared/projects/riscvOS/"
PTHTEST="${PTH}test/"
allFiles="$(ls -1 ${PTH}test/)"


while read p; do
    if [ "${p: -1}" != "t" ] 
    then
        mv "$PTHTEST$p" "$PTHTEST${p}t"
    fi
done <<< "$allFiles"

FILE="${PTH}testingNow.txt"
args=""

while read p; do
    if [ "${p:0:1}" != "#" ] 
    then
        t="$(ls -1 $PTHTEST${p}.*)"
        while read z; do
            mv "$z" "${z:0:-1}"
        done <<< "$t"
    fi
done < "$FILE"

