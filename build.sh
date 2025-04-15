#!/bin/sh
export INCLUDE=$WATCOM/h
cd edrdos/ltools/unix
make
cd ../../
wmake -h clean all VERSION=$(date +%Y%m%d)
