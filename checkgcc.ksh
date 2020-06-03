#!/bin/ksh

> /tmp/checkmessage.out

HOST=`uname -n`
OS=`uname -s`

if [[ $OS = "SunOS" ]]; then
    if [[ -s /usr/bin/gcc ]]; then
       print "$HOST has gcc installed"
    fi
    if [[ -s /usr/bin/gcc44 && ! -h /usr/bin/gcc ]]; then
       print "$HOST gcc is not a link"
##       cp -p /usr/bin/gcc /usr/bin/gcc.orig
##       rm -f /usr/bin/gcc
##       ln -s -f /usr/bin/gcc44 /usr/bin/gcc
    fi 
elif [[ $OS = "Linux" ]]; then
    if [[ -s /usr/bin/gcc ]]; then
       print "$HOST has gcc installed"
    fi
    if [[ -s /usr/bin/gcc44 && ! -h /usr/bin/gcc ]]; then
       print "$HOST gcc is not a link"
##       cp -p /usr/bin/gcc /usr/bin/gcc.orig
##       rm -f /usr/bin/gcc
##       ln -s -f /usr/bin/gcc44 /usr/bin/gcc
    fi 
fi

