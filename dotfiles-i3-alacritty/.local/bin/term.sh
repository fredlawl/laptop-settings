#!/usr/bin/env -S bash
exec alacritty --working-directory $(cat /tmp/run/user/`id -u`/wd)

