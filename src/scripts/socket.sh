#!/bin/sh

args="$*"
args="$(echo "$args" | tr ' ' ',')"

SOCKETS="${SOCKETS:-$args}"

for SOCKET in $(echo "$SOCKETS" | tr -s ',' '\n'); do
	until [ -e "$SOCKET" ]; do true; done
done
