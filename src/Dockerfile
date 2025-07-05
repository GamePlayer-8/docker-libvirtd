FROM alpine:3.22 AS builder

RUN apk add --no-cache \
	py3-pip \
	py3-virtualenv \
	alpine-sdk \
	git git-lfs

WORKDIR /opt
RUN python3 -m venv supervisor
WORKDIR /root
RUN git clone --depth 1 https://github.com/Supervisor/supervisor
WORKDIR /root/supervisor
RUN . /opt/supervisor/bin/activate; \
	pip install --upgrade pip setuptools wheel; \
	pip install .

FROM alpine:3.22 AS runtime

RUN apk add --no-cache \
	py3-pip \
	py3-virtualenv \
	ovmf \
	edk2 \
	seabios \
	libvirt-client \
	libvirt-daemon \
	libvirt-common-drivers \
	libvirt-qemu \
	qemu-system-x86_64 \
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

RUN mkdir /var/lib/sshSetup; \
	mv /etc/ssh/* /var/lib/sshSetup/

#RUN echo 'security_driver = "none"' >> /etc/libvirt/qemu.conf
RUN echo "remember_owner = 0" >> /etc/libvirt/qemu.conf
#RUN echo "dynamic_ownership = 0" >> /etc/libvirt/qemu.conf

COPY --from=builder /opt/supervisor /opt/supervisor
COPY scripts/socket.sh /usr/local/bin/check-socket
COPY config/sshd.conf /var/lib/sshSetup/sshd_config.d/virtual.conf
COPY scripts/dbusUp.sh /usr/local/bin/dbusUp
COPY scripts/dbus-socket.sh /usr/local/bin/dbus-socket
COPY scripts/vswitch-init.sh /usr/local/bin/vswitch-init
COPY scripts/ssh-keystore.sh /usr/local/bin/ssh-keystore
COPY config/supervisord.conf /etc/supervisord.conf

RUN chmod +x /usr/local/bin/check-socket; \
	chmod +x /usr/local/bin/dbusUp; \
	chmod +x /usr/local/bin/dbus-socket; \
	chmod +x /usr/local/bin/vswitch-init; \
	chmod +x /usr/local/bin/ssh-keystore

RUN adduser -D -s /bin/bash virtual; \
	usermod -aG libvirt virtual; \
	echo "virtual:virtual" | chpasswd

VOLUME ["/etc/libvirt/storage", "/etc/libvirt/qemu", "/etc/libvirt/qemu/networks", "/var/lib/libvirt", "/etc/ssh"]

EXPOSE 22

ENTRYPOINT ["sh", "-c", ". /opt/supervisor/bin/activate; supervisord -c /etc/supervisord.conf"]
