#!/usr/bin/env -S bash
lookup_dir=/tmp/run/user/$(id -u)/wd
dir=$(cat $lookup_dir)
default="/home/$(id -un)"
working_dir=${dir:-"$default"}
exec alacritty --working-directory "$working_dir"
