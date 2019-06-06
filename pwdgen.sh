#!/bin/bash

function check_curl () {
	if [[ -x /usr/bin/curl ]]
	then
		return 1
	else
		return 0
	fi
}

if [ -z $1 ] || [ -z $2 ]
then
	echo "invalid arg. Exiting..."
	exit 1
fi

check_curl
if [ $? -gt 0 ]
then
	num=$1
	length=$2
	url="https://www.random.org/strings/?num=$num&len=$length&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new"
	curl $url
else
	echo "curl not found. Exiting..."
	exit 1
fi