#!/bin/sh

case "$TARGETARCH" in
	amd64)
		export packages="ovmf edk2 seabios qemu-system-x86_64"
		;;
	arm64)
		export packages="edk2 qemu-system-x86_64"
		;;
	arm)
		export packages=""
		;;
	riscv64)
		export packages="qemu-system-x86_64"
		;;
	*)
		export packages=""
		;;
esac

apk add --no-cache \
	$packages \
	py3-pip \
	py3-virtualenv \
	libvirt-client \
	libvirt-daemon \
	libvirt-common-drivers \
	libvirt-qemu \
	qemu-system-i386 \
	qemu-audio-alsa \
	qemu-audio-oss \
	qemu-audio-pa \
	qemu-audio-sdl \
	qemu-audio-spice \
	qemu-block-curl \
	qemu-block-dmg-bz2 \
	qemu-block-nfs \
	qemu-block-ssh \
	qemu-chardev-spice \
	qemu-hw-display-qxl \
	qemu-hw-display-virtio-gpu \
	qemu-hw-display-virtio-gpu-pci \
	qemu-hw-display-virtio-vga \
	qemu-hw-usb-redirect \
	qemu-img \
	dbus \
	polkit \
	iproute2 \
	eudev \
	openssh-server \
	openssh-sftp-server \
	openssh-server-pam \
	rsync \
	shadow \
	bash \
	openvswitch
