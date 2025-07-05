#!/bin/sh

shutdown() {
	echo "[$(date)]: Killing daemon with signal $1!" >&2
	kill -$1 $supervisord_pid
}

if [ "$(ls /etc/ssh 2>/dev/null | tr -s ' ' '\n' | wc -l)" = "0" ]; then
	cp -r /var/lib/sshSetup/* /etc/ssh/
	ssh-keygen -A
fi

. /opt/supervisor/bin/activate
supervisord -c /etc/supervisord.conf &
export supervisord_pid=$!

trap 'shutdown SIGTERM' SIGTERM
trap 'shutdown SIGINT' SIGINT

wait $supervisord_pid
