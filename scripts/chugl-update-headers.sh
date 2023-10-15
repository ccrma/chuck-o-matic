#!/bin/bash
#
# name: chugl-update-headers.sh
# desc: copy chuck headers to chugl
#
# usage: from chuck-o-matic/ root
#      > sh ./scripts/chugl-update-headers.sh

# base chuck directory
CHUCK_DIR=../chuck
# base chugl directory
CHUGL_DIR="../chugl"

# print
echo "copying headers to chugl/src/chuck/include"
# copy
cp -fv ${CHUCK_DIR}/src/core/*.h ${CHUGL_DIR}/src/chuck/include/
