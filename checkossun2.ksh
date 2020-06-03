#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
VER=`uname -v`
let count=0

if [[ "$OS" = "SunOS" ]]; then
    print "$HOST  $OS  $VER"  
fi
