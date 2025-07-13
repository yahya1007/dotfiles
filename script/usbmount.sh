#!/bin/bash

set -o pipefail
shopt -s extglob globasciiranges nullglob

disk_info() {
  udisksctl info -b "$1" | awk '
  {
    if ($1 == "IdUsage:" && $2 != "filesystem")
      exit 1
    if ($1 == "HintSystem:" && $2 == "true")
      printf("s")
    else if ($1 == "MountPoints:" && NF > 1)
      printf("m")
  }
  '
}

cmd=$1
shift || { printf 'error: no command given\n' >&2; exit 1; }
(( $# )) || set -- /dev/sd[a-z]+([0-9])
case $cmd in
  m*)
    for disk in "$@"; do
      if ! info=$(disk_info "$disk"); then
        printf 'warning: not a filesystem: %s\n' "$disk"
        continue
      fi
      if [[ $info != *[sm]* ]]; then
        udisksctl mount -b "$disk"
      fi
    done
    ;;
  u*)
    for disk in "$@"; do
      if ! info=$(disk_info "$disk"); then
        printf 'warning: not a filesystem: %s\n' "$disk"
        continue
      fi
      if [[ $info != *s* && $info == *m* ]]; then
        udisksctl unmount -b "$disk"
      fi
    done
    ;;
esac

