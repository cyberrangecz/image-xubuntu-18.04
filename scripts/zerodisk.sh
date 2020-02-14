#!/bin/sh -x

# OpenStack supports only import of RAW images, i. e. compression is not used as in QCOW2 format and zeroing out doesn't make sense in this case
# this script might be removed from packer template in the future

# Zero out the rest of the free space using dd, then delete the written file.
#dd if=/dev/zero of=/EMPTY bs=1M
#rm -f /EMPTY

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
#sync
