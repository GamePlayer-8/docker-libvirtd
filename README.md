<div align="center">
<a href="https://codeberg.org/GamePlayer-8/docker-libvirtd"><img src=".github/logo.png" title="Logo" style="max-width:100%;" width="256" /></a>
</div>
<div align="center">

[![Build]][build_url]
[![Version]][tag_url]
[![Size]][tag_url]
[![Pulls]][hub_url]

</div></h1>

[Alpine Linux](https://alpinelinux.org/) [libvirt](https://libvirt.org/) ([qemu](https://www.qemu.org/)+kvm) docker image with [openvSwitch](https://www.openvswitch.org/), [DBus](https://dbus.freedesktop.org/), [Polkit](https://github.com/polkit-org/polkit) and [OpenSSH](https://www.openssh.com/) auth.

GitHub Actions and Woodpecker servers are updating the image reguarly.

### What does it do?

This repository is a source code of solution to run the libvirt daemon, commonly used with QEMU to manage multiple virtual machines.

## Setup

1. Create file `authorized_keys` with your SSH pubkey, for authentication.
2. Run `docker compose pull` and `docker compose up -d` to boot up runtime.
3. In `./iso` you can put your ISO files / images (path is read-only).
4. To enable full capability, flip the `privileged:` option to `true` in `docker-compose.yml`. (I'm working on workaround).

# License

Under [MIT License](./LICENSE.md) unless stated otherwise.
Libvirt logo is under [CC-by-SA 4.0 License](https://commons.wikimedia.org/w/index.php?curid=11468023).

## Stars 🌟
[![Stars](https://starchart.cc/GamePlayer-8/docker-libvirtd.svg?variant=adaptive)](https://starchart.cc/GamePlayer-8/docker-libvirtd)

[build_url]: https://github.com/GamePlayer-8/docker-libvirtd/
[hub_url]: https://hub.docker.com/r/gameplayer8/docker-libvirtd
[tag_url]: https://hub.docker.com/r/gameplayer8/docker-libvirtd/tags

[Build]: https://github.com/GamePlayer-8/docker-libvirtd/actions/workflows/build.yml/badge.svg
[Size]: https://img.shields.io/docker/image-size/gameplayer8/docker-libvirtd/latest?color=066da5&label=size
[Pulls]: https://img.shields.io/docker/pulls/gameplayer8/docker-libvirtd.svg?style=flat&label=pulls&logo=docker
[Version]: https://img.shields.io/docker/v/gameplayer8/docker-libvirtd/latest?arch=amd64&sort=semver&color=066da5
