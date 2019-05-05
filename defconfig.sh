#!/bin/sh

set -e

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- kindle4_defconfig
