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

ARG TARGETARCH

COPY --chmod=755 scripts/Dockerfile-packages.sh /usr/local/bin/packages

RUN /usr/local/bin/packages

RUN mkdir /var/lib/sshSetup; \
	mv /etc/ssh/* /var/lib/sshSetup/

#RUN echo 'security_driver = "none"' >> /etc/libvirt/qemu.conf
RUN echo "remember_owner = 0" >> /etc/libvirt/qemu.conf
#RUN echo "dynamic_ownership = 0" >> /etc/libvirt/qemu.conf

COPY --from=builder /opt/supervisor /opt/supervisor
COPY --chmod=640 supervisord.conf /etc/supervisord.conf
COPY --chmod=755 scripts/socket.sh /usr/local/bin/check-socket
COPY --chmod=440 sshd.conf /var/lib/sshSetup/sshd_config.d/virtual.conf
COPY --chmod=755 scripts/dbusUp.sh /usr/local/bin/dbusUp
COPY --chmod=755 scripts/dbus-socket.sh /usr/local/bin/dbus-socket
COPY --chmod=755 scripts/vswitch-init.sh /usr/local/bin/vswitch-init
COPY --chmod=755 scripts/ssh-keystore.sh /usr/local/bin/ssh-keystore

RUN adduser -D -s /bin/bash virtual; \
	usermod -aG libvirt virtual; \
	echo "virtual:virtual" | chpasswd

VOLUME ["/etc/libvirt/storage", "/etc/libvirt/qemu", "/etc/libvirt/qemu/networks", "/var/lib/libvirt", "/etc/ssh"]

EXPOSE 22

ENTRYPOINT ["sh", "-c", ". /opt/supervisor/bin/activate; supervisord -c /etc/supervisord.conf"]
