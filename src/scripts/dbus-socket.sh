#!/bin/sh

DBUS_PATH="$(echo "$DBUS_SESSION_BUS_ADDRESS" | tr -s ',' '\n' | grep 'path=' | tr '=' '\n' | tail -n1)"

until [ -e "$DBUS_PATH" ]; do true; done
