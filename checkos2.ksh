#!/bin/ksh

HOST=`uname -n`
OS=`uname -s`
VER=`uname -v`
let count=0


   if [[ "$OS" = "SunOS" ]]; then
      let count=count+1
      print "$HOST $OS"
   fi

   if [[ "$OS" = "Linux" ]]; then
      let count=count+1
      print "$HOST $OS"
   fi
