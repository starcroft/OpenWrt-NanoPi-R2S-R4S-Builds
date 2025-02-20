# OpenWrt Builds for NanoPi R4S
Automated builds of OpenWrt for FriendlyARM NanoPi R4S boards
 
⚠️ Since OpenWrt 23.05, those devices are supported by vanilla OpenWrt. You might want to use regular builds instead of this one, especially if you plan to add extra kernel modules for usb wifi support.

[![NanoPi Build](https://github.com/stargazindreamr/OpenWrt-NanoPi-R2S-R4S-Builds/actions/workflows/NanoPi-Build.yml/badge.svg)](https://github.com/stargazindreamr/OpenWrt-NanoPi-R2S-R4S-Builds/actions/workflows/NanoPi-Build.yml)

## OpenWrt 24.10.0 
The latest build of each 24.10 flavor has PHY PCIe init bug patches and an overclock of 2GHz on the a72 cores and 1.6GHz on the a53 cores.

Supported Models : R4S (4Gb)

⚠ Warning: No support / Use at your own risk  ⚠ 

### vanilla with 100MB rootfs
This is the same package set and rootfs size as an official Openwrt build.

[Download Vanilla 24.10 100MB rootfs Releases](https://github.com/stargazindreamr/OpenWrt-NanoPi-R2S-R4S-Builds/releases?q=Vanilla-OpenWrtNK-100MB-24.10&expanded=true) [Changelog](https://github.com/stargazindreamr/OpenWrt-NanoPi-R2S-R4S-Builds/blob/main/openwrt-24.10/release-info.md)

### vanilla with 1024MB rootfs
This is the same package set as an official Openwrt build. The rootfs is set to 1024MB, giving plenty of room for additional packages.

[Download Vanilla 24.10 1024MB rootfs Releases](https://github.com/stargazindreamr/OpenWrt-NanoPi-R2S-R4S-Builds/releases?q=Vanilla-OpenWrtNK-1024MB-24.10&expanded=true) [Changelog](https://github.com/stargazindreamr/OpenWrt-NanoPi-R2S-R4S-Builds/blob/main/openwrt-24.10/release-info.md)

### many apps with 1024MB rootfs
This has a rather full (some might say bloated) package set.

[Download 24.10 Releases](https://github.com/stargazindreamr/OpenWrt-NanoPi-R2S-R4S-Builds/releases?q=OpenWrtNK-24.10&expanded=true) [Changelog](https://github.com/stargazindreamr/OpenWrt-NanoPi-R2S-R4S-Builds/blob/main/openwrt-24.10/release-info.md)


## OpenWrt 23.05.5 (stable)

[Download 23.05 Releases](https://github.com/stargazindreamr/OpenWrt-NanoPi-R2S-R4S-Builds/releases?q=OpenWrtNK-23.05&expanded=true) [Changelog](https://github.com/stargazindreamr/OpenWrt-NanoPi-R2S-R4S-Builds/blob/main/openwrt-23.05/release-info.md)
Supported Models : R4S (4Gb)

⚠ Warning: No support / Use at your own risk  ⚠ 

## OpenWrt 22.03.5 (old)

[Download 22.03 Releases](https://github.com/stargazindreamr/OpenWrt-NanoPi-R2S-R4S-Builds/releases?q=OpenWrtNK-22.03&expanded=true) [Changelog](https://github.com/stargazindreamr/OpenWrt-NanoPi-R2S-R4S-Builds/blob/main/openwrt-22.03/release-info.md)
Supported Models : R4S (4Gb)

⚠ Warning: No support / Use at your own risk  ⚠ 

## License
[MIT](https://github.com/stargazindreamr/OpenWRT-Rockchip/blob/master/LICENSE)
