#!/bin/sh

if [ "$(ls /etc/ssh 2>/dev/null | tr -s " " "\n" | wc -l)" = "0" ]; then
	cp -r /var/lib/sshSetup/* /etc/ssh/
	ssh-keygen -A >&2
fi

exit $?
