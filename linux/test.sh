#!/bin/bash

usage(){
	echo "Toggles commented hostname(s) in the hosts file"
	echo ""
	echo "Usage: $0 <hostname> [<hostname> ...]"
	echo "   ex: $0 "
	exit 1
}

if [ $# -eq 0 ]; then
	usage
fi

