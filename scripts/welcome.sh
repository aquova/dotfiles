#!/bin/bash

# ANSI colors
FG_BLCK='\e[0;30m'
FG_DARK='\e[0;34m'
FG_LITE='\e[0;36m'

BG_BLCK='\e[40m'
BG_DARK='\e[44m'
BG_LITE='\e[46m'

CLEAR='\e[0m'

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
