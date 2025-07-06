<div align="center">
<a href="https://codeberg.org/GamePlayer-8/docker-libvirtd"><img src=".github/logo.png" title="Logo" style="max-width:100%;" width="256" /></a>
</div>
<div align="center">

[![XaviaMa]][xaviama_url]
[![Codeberg]][codeberg_url]
[![Build]][build_url]
[![TransRights]][transrights_url]
[![Enbyware]][enbyware_url]
[![License]][license_url]
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

[xaviama_url]: https://ci.chimmie.k.vu/repos/20
[codeberg_url]: https://ci.codeberg.org/repos/14900
[build_url]: https://github.com/GamePlayer-8/docker-libvirtd/
[transrights_url]: https://en.wikipedia.org/wiki/Transgender_rights_movement
[enbyware_url]: https://en.wikipedia.org/wiki/Non-binary
[license_url]: LICENSE.md
[hub_url]: https://hub.docker.com/r/gameplayer8/docker-libvirtd
[tag_url]: https://hub.docker.com/r/gameplayer8/docker-libvirtd/tags

[XaviaMa]: https://ci.chimmie.k.vu/api/badges/20/status.svg
[Codeberg]: https://ci.codeberg.org/api/badges/14900/status.svg
[Build]: https://github.com/GamePlayer-8/docker-libvirtd/actions/workflows/build.yml/badge.svg
[TransRights]: https://pride-badges.pony.workers.dev/static/v1?label=trans%20rights&stripeWidth=6&stripeColors=5BCEFA,F5A9B8,FFFFFF,F5A9B8,5BCEFA
[Enbyware]: https://pride-badges.pony.workers.dev/static/v1?label=enbyware&labelColor=%23555&stripeWidth=8&stripeColors=FCF434%2CFFFFFF%2C9C59D1%2C2C2C2C
[License]: https://img.shields.io/github/license/GamePlayer-8/docker-libvirtd
[Size]: https://img.shields.io/docker/image-size/gameplayer8/docker-libvirtd/latest?color=066da5&label=size
[Pulls]: https://img.shields.io/docker/pulls/gameplayer8/docker-libvirtd.svg?style=flat&label=pulls&logo=docker
[Version]: https://img.shields.io/docker/v/gameplayer8/docker-libvirtd/latest?arch=amd64&sort=semver&color=066da5
