#!/bin/sh
export INCLUDE=$WATCOM/h
cd edrdos/ltools/unix
make
cd ../../
wmake -h clean all VERSION=$(date +%Y%m%d)
mkdir ../temp
cd ../temp
wget https://github.com/crazii/HX/releases/download/v0.1-beta4fix2/HDPMI32i.zip
unzip HDPMI32i.zip
wget https://github.com/Baron-von-Riedesel/Jemm/releases/download/v5.85/JemmB_v585.zip
unzip JemmB_v585.zip
wget https://github.com/crazii/SBEMU/releases/download/Release_1.0.0-beta.5/SBEMU.zip
unzip -j SBEMU.zip SBEMU/sbemu.exe
wget https://vgmpf.com/Wiki/images/8/84/AdLib_%28DOS%29.zip
unzip -j AdLib_(DOS).zip Originals/TEST.EXE
cd ../
mformat -i "hello.img" -B edrdos/image/bootfdos.144 -k -v "ZDRDOS" -f 1440 -N 0x306de779 -C
mcopy -i "hello.img" edrdos/bin/kernel.sys ::/kernel.sys
mcopy -i "hello.img" edrdos/bin/command.com ::/
mcopy -i "hello.img" temp/JEMMEX.EXE ::/
mcopy -i "hello.img" temp/HDPMI32i.EXE ::/
mcopy -i "hello.img" temp/QPIEMU.DLL ::/
mcopy -i "hello.img" temp/JLOAD.EXE ::/
mcopy -i "hello.img" temp/sbemu.exe ::/
mcopy -i "hello.img" dconfig.sys ::/
mcopy -i "hello.img" dauto.bat ::/
mcopy -i "hello.img" temp/TEXT.EXE ::/
