#!/bin/sh

FILE=`echo $1 | awk -F: '{print $1}'`
LINE=`echo $1 | awk -F: '{print $2}'`
COL=`echo $1 | awk -F: '{print $3}'`

if [ "${LINE}" == "" ]; then
    emacsclient -n -a emacs ${FILE}
else
    emacsclient -n -a emacs +${LINE}:${COL} ${FILE}
fi

