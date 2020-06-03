#!/bin/ksh

if [[ ! -h /usr/bin/gcc ]]; then
   echo "gcc is not a link"
else
   echo "gcc is a link"
fi
