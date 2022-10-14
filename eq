#!/bin/sh

if [ -z "$1" ]; then
    echo "$(basename $0) – check if both string are equal"
    echo "Usage: eq <string1> <string2>"
    echo "Example: eq 'Hi there!' 'Hi there'"
    exit
fi

NC='\033[0m' # no color
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'

if [ "$1" = "$2" ]; then
    echo "${GREEN}✔ Matches!${NC}"
else
    echo "${RED}✘ Not equals${NC}"
fi
