#!/bin/bash

IFS=$(echo -en "\n\b")
mychmod(){
    if [ -d $1 ];then
        chmod 755 $1
    else
        echo -e "\033[31mThis not directory!!!\033[0m"
        exit 1
    fi
    for file in `ls -a $1|grep -v "^\.$"|grep -v "^\..$"`
    do
        if [ -d $1"/"$file ];then
            chmod 755 $1"/"$file
            mychmod $1"/"$file
        else
            chmod 644 $1"/"$file
        fi
    done
}
mychmod $1
