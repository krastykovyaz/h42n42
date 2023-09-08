#!/usr/bin/env zsh

for file in *.eliom; do
    echo "\033[32m$file\033[0m"
    FORMATED=$(ocamlformat $file)
    
    if [ $? -eq 0 ] ; then
        echo $FORMATED > $file
    else
        exit $?
    fi
done
