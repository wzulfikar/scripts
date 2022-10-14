#!/usr/bin/env sh

# usage:
# 1. adjust file permission (if you have not): `chmod +x eq`
# 2. copy or link to your path, ie. `ln -s eq /usr/local/bin`
# 3. run `eq helloworld helloworld`

if [ -z "$1" ]; then
    echo "eq –– check if both string are equal"
    echo "usage: eq <string1> <string2>"
    echo "example: eq 'Hi there!' 'Hi there'"
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
