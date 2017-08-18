#!/bin/bash

dir=$1
cmd=$2

app_1=$3
app_2=$4

gnome-terminal \
    --tab \
        --title "$3" \
        --working-directory "$dir/$3/trunk" \
        --command "${SHELL} -c '$cmd'" \
    --tab \
        --title "$4" \
        --working-directory "$dir/$4/trunk" \
        --command "${SHELL} -c '$cmd'" \
    &
