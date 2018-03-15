#!/bin/sh

# emacs-open-at-line.sh

# Usage (with Emacs in server mode):
#
# Make sure `(server-start)` is in your .emacs file.
# Rename to make it easier to use and move to bin folder. Make sure ~/bin is in PATH.  
# $ mv emacs-open-at-line.sh ~/bin/ema
#
# To open a file as normal  
# $ ema path/to/file.c
#
# To open a file at line 10  
# $ ema path/to/file.c:10
#
# To open a file at line 10 and column 5  
# $ ema path/to/file.c:10:5

FILE=`echo $1 | awk -F: '{print $1}'`
LINE=`echo $1 | awk -F: '{print $2}'`
COL=`echo $1 | awk -F: '{print $3}'`

if [ "${LINE}" == "" ]; then
    emacsclient -n -a emacs ${FILE}
else
    emacsclient -n -a emacs +${LINE}:${COL} ${FILE}
fi

