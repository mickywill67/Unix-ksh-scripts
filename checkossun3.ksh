#!/bin/sh

HOST=`uname -n`
OS=`uname -s`
VER=`uname -r`

if [ "$OS" = "SunOS" ] ; then
   if [ $VER = "5.10" -o $VER = "5.11" ] ; then 
    echo "$HOST  $OS  $VER"  
   fi
fi
