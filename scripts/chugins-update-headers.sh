#!/bin/bash
#
# name: chugins-update-headers.sh
# desc: copy chuck headers to chugins
#
# usage: from chuck-o-matic/ root
#      > sh ./scripts/chugins-update-headers.sh

# base chuck directory
CHUCK_DIR=../chuck
# base chugins directory
CHUGINS_DIR="../chugins"
# chuck headers repo
CHEADERS_DIR="../cheaders"
# base chugl directory
CHUGL_DIR="../chugl"

# print
echo "copying headers to chugins/chuck/include"
# copy
cp -fv ${CHUCK_DIR}/src/core/*.h ${CHUGINS_DIR}/chuck/include/

# print
echo "copying headers to cheaders/include/"
# copy
cp -fv ${CHUCK_DIR}/src/core/*.h ${CHEADERS_DIR}/include/

# print
echo "copying headers to chugl/src/chuck/include"
# copy
cp -fv ${CHUCK_DIR}/src/core/*.h ${CHUGL_DIR}/src/chuck/include/
