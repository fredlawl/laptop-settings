# Udev

First, figure out what devices you want to add wakeup rules for.

## Table of Contents
1. [USB](#usb)
2. [Laptop keyboard](#laptop-keyboard)
3. [Install rules](#install-rules)

## USB

```
$ lsusb
Bus 004 Device 003: ID 0bda:0411 Realtek Semiconductor Corp. Hub
Bus 004 Device 002: ID 05e3:0626 Genesys Logic, Inc. USB3.1 Hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 002: ID 0bda:0328 Realtek Semiconductor Corp. USB3.0-CRW
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 003: ID 06cb:009a Synaptics, Inc. Metallica MIS Touch Fingerprint Reader
Bus 001 Device 002: ID 5986:2115 Acer, Inc Integrated Camera
Bus 001 Device 007: ID 25a4:9311 USB C   USB C Video Adaptor      
Bus 001 Device 011: ID 046d:c332 Logitech, Inc. G502 Proteus Spectrum Optical Mouse
Bus 001 Device 010: ID 0c45:6536 Microdia USB  Live camera
Bus 001 Device 009: ID 05ac:024f Apple, Inc. Aluminium Keyboard (ANSI)
Bus 001 Device 008: ID 0d8c:0008 C-Media Electronics, Inc. C-Media USB Audio Device   
Bus 001 Device 006: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
Bus 001 Device 005: ID 05e3:0610 Genesys Logic, Inc. Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

Make note of the Bus & Device, as we use that to determine the device path:

```
$ ls /dev/bus/usb/001/009
/dev/bus/usb/001/009
```

In our case, we want to wake up on key pressed from USB keyboard.

```
$ udevadm info -a -n /dev/bus/usb/001/009
...
  looking at device '/devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4.3/1-4.3.2':
    KERNEL=="1-4.3.2"
    SUBSYSTEM=="usb"
    DRIVER=="usb"
    ATTR{authorized}=="1"
    ATTR{avoid_reset_quirk}=="0"
    ATTR{bConfigurationValue}=="1"
    ATTR{bDeviceClass}=="00"
    ATTR{bDeviceProtocol}=="00"
    ATTR{bDeviceSubClass}=="00"
    ATTR{bMaxPacketSize0}=="64"
    ATTR{bMaxPower}=="100mA"
    ATTR{bNumConfigurations}=="1"
    ATTR{bNumInterfaces}==" 2"
    ATTR{bcdDevice}=="0107"
    ATTR{bmAttributes}=="a0"
    ATTR{busnum}=="1"
    ATTR{configuration}==""
    ATTR{devnum}=="9"
    ATTR{devpath}=="4.3.2"
    ATTR{idProduct}=="024f"
    ATTR{idVendor}=="05ac"
    ATTR{ltm_capable}=="no"
    ATTR{manufacturer}=="Keychron K8"
    ATTR{maxchild}=="0"
    ATTR{power/active_duration}=="6509168"
    ATTR{power/async}=="enabled"
    ATTR{power/autosuspend}=="2"
    ATTR{power/autosuspend_delay_ms}=="2000"
    ATTR{power/connected_duration}=="6513004"
    ATTR{power/control}=="on"
    ATTR{power/level}=="on"
    ATTR{power/persist}=="1"
    ATTR{power/runtime_active_kids}=="0"
    ATTR{power/runtime_active_time}=="6511087"
    ATTR{power/runtime_enabled}=="forbidden"
    ATTR{power/runtime_status}=="active"
    ATTR{power/runtime_suspended_time}=="0"
    ATTR{power/runtime_usage}=="1"
    ATTR{power/wakeup}=="enabled"
    ATTR{power/wakeup_abort_count}=="0"
    ATTR{power/wakeup_active}=="0"
    ATTR{power/wakeup_active_count}=="1"
    ATTR{power/wakeup_count}=="0"
    ATTR{power/wakeup_expire_count}=="0"
    ATTR{power/wakeup_last_time_ms}=="5736824"
    ATTR{power/wakeup_max_time_ms}=="0"
    ATTR{power/wakeup_total_time_ms}=="0"
    ATTR{product}=="Keychron K8"
    ATTR{quirks}=="0x0"
    ATTR{removable}=="unknown"
    ATTR{rx_lanes}=="1"
    ATTR{speed}=="12"
    ATTR{tx_lanes}=="1"
    ATTR{urbnum}=="7727"
    ATTR{version}==" 2.00"
...
```

idVendor, and idProduct match the device we're looking for from lsusb:

```
...
Bus 001 Device 009: ID 05ac:024f Apple, Inc. Aluminium Keyboard (ANSI)
...
```

Add this rule based on the udev output to _rootfs/etc/udev/rules.d/10-wakeup.rules_,
and see `man 7 udev` for extra details on how to write rules.

> INFO: It's best to match devices on their idProduct and idVendor than
  bus/device numbers since those can change depending enumeration.

## Laptop keyboard

This is a bit more difficult to determine, and we need to look for a kbd device.

```
$ ls /dev/input/by-path
...
platform-i8042-serio-0-event-kbd
...
$ readlink -f /dev/input/by-path/platform-i8042-serio-0-event-kbd
/dev/input/event0
$ udevadm info -a -n /dev/input/event0
...
  looking at parent device '/devices/platform/i8042/serio0':
    KERNELS=="serio0"
    SUBSYSTEMS=="serio"
    DRIVERS=="atkbd"
    ATTRS{bind_mode}=="auto"
    ATTRS{description}=="i8042 KBD port"
    ATTRS{err_count}=="0"
    ATTRS{extra}=="0"
    ATTRS{firmware_id}=="PNP: LEN0071 PNP0303"
    ATTRS{force_release}=="369-370"
    ATTRS{id/extra}=="00"
    ATTRS{id/id}=="00"
    ATTRS{id/proto}=="00"
    ATTRS{id/type}=="06"
    ATTRS{power/async}=="disabled"
    ATTRS{power/control}=="auto"
    ATTRS{power/runtime_active_kids}=="0"
    ATTRS{power/runtime_active_time}=="0"
    ATTRS{power/runtime_enabled}=="disabled"
    ATTRS{power/runtime_status}=="unsupported"
    ATTRS{power/runtime_suspended_time}=="0"
    ATTRS{power/runtime_usage}=="0"
    ATTRS{power/wakeup}=="enabled"
    ATTRS{power/wakeup_abort_count}=="0"
    ATTRS{power/wakeup_active}=="0"
    ATTRS{power/wakeup_active_count}=="1492"
    ATTRS{power/wakeup_count}=="0"
    ATTRS{power/wakeup_expire_count}=="0"
    ATTRS{power/wakeup_last_time_ms}=="4295261"
    ATTRS{power/wakeup_max_time_ms}=="0"
    ATTRS{power/wakeup_total_time_ms}=="0"
    ATTRS{scroll}=="0"
    ATTRS{set}=="2"
    ATTRS{softraw}=="1"
    ATTRS{softrepeat}=="0"
...
```

We know we found what we're looking for in the output because we match
the _/dev/input/by-path/platform-i8042-serio-0-event-kbd_ to similarly found
parent device path, and we're looking specifically for _power/wakeup_ options.

## Install rules
```
$ sudo vim /etc/udev/rules.d/10-wakeup.rules
```

And copy/paste the rules over.

> TODO: Create install script