#!/bin/sh

# Shutdown DBus on signal
shutdown() {
	kill -s $1 $dbus_pid

	wait $dbus_pid

	exit $?
}

# Workaround for DBus to have unique machine ID
generateMachineID() {
	# If machine-id is already predefined - pass
	if [ -s /etc/machine-id ] ; then
		return 0
	fi

	dd if=/dev/random status=none bs=16 count=1 \
		| md5sum | cut -d' ' -f1 > /etc/machine-id
	return $?
}

# DBus runtime
startDBUS() {
	generateMachineID
	install -m755 -o root -g messagebus -d /run/dbus || return 1

	/usr/bin/dbus-uuidgen --ensure="${machine_id:-/etc/machine-id}"

	/usr/bin/dbus-daemon --system --nofork --nopidfile --nosyslog &
	export dbus_pid=$!

	trap 'shutdown TERM' TERM INT

	wait $dbus_pid

	return $?
}

startDBUS
exit $?
