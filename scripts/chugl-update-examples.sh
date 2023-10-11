#!/bin/bash
#
# name: chugl-update-headers.sh
# desc: copy chuck headers to chugins
#
# usage: from chuck-o-matic/ root
#      > sh ./scripts/chug-update-headers.sh

# base chugl directory
CHUGL_DIR="../chugl"
# base chuck-website directory
CHUCK_WEBDIR=../chuck-website

# print
echo "copying file to chuck-website/chugl/examples"
# copy to chugins/chuck/include
cp -rfv ${CHUGL_DIR}/examples/* ${CHUCK_WEBDIR}/chugl/examples/
