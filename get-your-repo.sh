#!/bin/bash

## Created the 22/06/2015
## Get the user current list of repository, depending of the token

if [ $# != 1 ]; then
    echo "Usage : sh $0 TOKEN" 1>&2
    echo "Example : sh $0 a2664ab3366b2cea5adac4bc178e07" 1>&2
    exit
fi

json=$(curl -s https://api.github.com/user/repos?access_token=$1)
raw=$(echo $json | grep -o '"name": "\([^"]*\)",')
beautiful_raw=$(echo $raw | sed 's/"name": "/-> /g')
beautiful_raw=$(echo $beautiful_raw | sed 's/", /\\n/g')
beautiful_raw=$(echo $beautiful_raw | sed 's/",//g') # for the last name

echo "Here is a list of your repo:"
echo -e $beautiful_raw
