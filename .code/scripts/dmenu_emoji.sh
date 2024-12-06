#!/bin/sh

grep -v "#" ~/.scripts/unicode.txt | dmenu -i -l 20 | awk '{print $1}' | tr -d '\n' | xclip -selection clipboard
