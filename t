#!/bin/sh
if [ $# -eq 0 ]; then
    # shellcheck disable=SC2094
    tail -n < "$0" "$(echo "$(wc -l "$0" | cut -d' ' -f1)" - 7 | bc)" | glow -s dark -
else
    [ "$1" = "edit" ] || [ "$1" = "e" ] && nvim "$0"
fi
# Life
## promenera!
## var ute! träffa folk!

# DEV
## skriv todo med haskell/nim/zig QML? taskbar icon. kanske som en service
## skriv translate i Nim om det är möjligt
## skriv python-twitter-tools i Nim/Zig/Rust
## roll20 discord bot?
# RANDOM
## använd hotspot (och hottie för Nim)
# RICE
## kitty lf conf? (timg/other)
# GAMES
## industria
# VÅRD
## fas 1: ny på mottagningen
## fas 2: missbrukar fortfarande men kommer på tiderna
## fas 3: kommit på tider och har varit nykter en kortare period
## fas 4: remission. nykter och drogfri en längre period
