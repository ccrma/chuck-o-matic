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

# print
echo "copying headers to chugins/chuck/include"
# copy to chugins/chuck/include
cp -fv ${CHUCK_DIR}/src/core/*.h ${CHUGINS_DIR}/chuck/include/
