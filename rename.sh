#!/bin/sh
if [ $# -lt 2 ]
then echo "argument error"
     exit
else 
    if [ -f $1 -a ! -f $2 ]
    then mv -i $1 $2
    else echo "failed: $1 not exist or $2 exists"
    fi
fi    
