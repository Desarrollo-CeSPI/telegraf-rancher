#!/bin/sh
set -e

export INFLUX_TELEGRAF_HOST=$(curl -s "http://rancher-metadata/2015-07-25/self/host/hostname")
export RANCHER_ENVIRONMENT=$(curl -s "http://rancher-metadata/2015-07-25/self/stack/environment_name" | tr 'A-Z' 'a-z' | tr ' ' '_')
export HOST_SYS=/hostfs/sys
export HOST_PROC=/hostfs/proc
export HOST_ETC=/hostfs/etc
export HOST_MOUNT_PREFIX=/hostfs

if [ "${1:0:1}" = '-' ]; then
  set -- telegraf "$@"
fi

exec "$@"

