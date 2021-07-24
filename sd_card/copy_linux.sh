rm -rf rootfs/*
cp ../software/buildroot/buildroot/output/images/zImage sdfs/zImage
cd rootfs
tar xf ../../software/buildroot/buildroot/output/images/rootfs.tar
cd ..
cp ../software/deviceTree/sopc2dts/soc_system.dtb sdfs/.
sudo python3 ./make_sdimage_p3.py -f \
-P u-boot-with-spl.sfp,num=3,format=raw,size=10M,type=A2  \
-P sdfs/*,num=1,format=fat32,size=100M \
-P rootfs/*,num=2,format=ext3,size=300M \
-s 512M \
-n sdcard_cv.img

