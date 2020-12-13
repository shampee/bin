#!/bin/sh
gcc -c "$1" && ld "${1%.*}".o && ./a.out
