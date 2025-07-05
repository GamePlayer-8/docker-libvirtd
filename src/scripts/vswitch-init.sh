#!/bin/sh

mkdir -p /etc/openvswitch || true
mkdir -p /var/run/openvswitch || true

if [ ! -f /etc/openvswitch/conf.db ]; then
	ovsdb-tool create /etc/openvswitch/conf.db /usr/share/openvswitch/vswitch.ovsschema
fi

exit $?
