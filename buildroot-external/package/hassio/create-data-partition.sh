#!/usr/bin/env bash
set -e

build_dir=$1
dst_dir=$2

data_img="${dst_dir}/data.ext4"

# Make image
rm -f "${data_img}"
truncate --size="1280M" "${data_img}"
mkfs.ext4 -L "hassos-data" -E lazy_itable_init=0,lazy_journal_init=0 "${data_img}"

# Mount / init file structs
mkdir -p "${build_dir}/data/"
sudo mount -o loop,discard "${data_img}" "${build_dir}/data/"

sleep 10
sudo sync
sleep 10

# Unmount data image
sudo umount "${build_dir}/data/"

sudo sync

e2fsck -f -p "${data_img}"
resize2fs "${data_img}"


