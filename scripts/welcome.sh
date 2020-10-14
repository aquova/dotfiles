#!/bin/bash

# ANSI colors
FG_BLCK='\033[0;30m'
FG_DARK='\033[0;34m'
FG_LITE='\033[0;36m'

BG_BLCK='\033[40m'
BG_DARK='\033[44m'
BG_LITE='\033[46m'

CLEAR='\033[0m'

DATE=$(date +"%A, %b %d, %Y")
TIME=$(date +"%H:%M:%S")

# Whitespace is critical here
echo -e "
${FG_BLCK}▄▄${BG_DARK}▀${BG_LITE}▀▀▀${BG_DARK}▀${CLEAR}${FG_BLCK}▄▄
${FG_BLCK}▄${BG_DARK}▀${FG_LITE}${BG_DARK}▄███████▄${FG_BLCK}█
${FG_BLCK}▄${BG_LITE}▀${FG_LITE}${BG_BLCK}██████▀█▀█${FG_DARK}█${FG_BLCK}█
${FG_BLCK}█${FG_LITE}${BG_DARK}▄███████${FG_BLCK}█${FG_LITE}█${FG_BLCK}█${FG_LITE}███${FG_BLCK}█
${FG_BLCK}█${FG_LITE}${BG_DARK}▀██▀█▄▄████▄ █${FG_BLCK}█
${FG_BLCK}▀${BG_DARK}▄${BG_LITE}▄${BG_DARK}▀${FG_LITE}█████${BG_BLCK}▄█${BG_DARK}▀${FG_BLCK}${BG_DARK}█▄${CLEAR}${FG_BLCK}▀
${FG_BLCK}▄${BG_DARK}▀▀▄▄${BG_LITE}▄▄▄▄${BG_DARK}▄▀▀${CLEAR}${FG_BLCK}▄
${FG_BLCK}▀${BG_DARK}▄▄▄▄▄${CLEAR}${FG_BLCK}▀▀▀█${BG_DARK}▄▄▄▄${CLEAR}${FG_BLCK}▀
${CLEAR}

Welcome $USER
It is currently ${TIME} on ${DATE}
"
