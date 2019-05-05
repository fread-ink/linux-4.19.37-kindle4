#!/bin/sh

set -e

#make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- kindle4_defconfig

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- dtbs

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- zImage

make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- LOADADDR=0x70800000 uImage

#make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- targz-pkg

#depmod -ae -F System.map -b tar-install -r 2.6.31-rt11-lab126 -n > modules.dep

#sed -i 's/^kernel\//\/lib\/modules\/2.6.31-rt11-lab126\/kernel\//g' modules.dep

mkdir -p OUTPUT

cp arch/arm/boot/zImage OUTPUT/
cp arch/arm/boot/uImage OUTPUT/
cp arch/arm/boot/dts/imx50-tequila.dtb OUTPUT/

cd OUTPUT/
cat zImage imx50-tequila.dtb > zImage_with_dtb
cat uImage imx50-tequila.dtb > uImage_with_dtb
#mkimage -a 0x70800000 -d uImage uImage_with_dtb

#cp linux-2.6.31-rt11-lab126.tar.gz OUTPUT/
#cp modules.dep OUTPUT/

echo " "
echo "Build complete. Find the results in the OUTPUT/ dir."
