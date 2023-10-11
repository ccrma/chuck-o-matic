#!/bin/bash
#
# name: chugl-update-headers.sh
# desc: copy chugl examples headers to website (and other places)
#
# usage: from chuck-o-matic/ root
#      > sh ./scripts/chugl-update-examples.sh

# base chugl directory
CHUGL_DIR="../chugl"
# base chuck-website directory
CHUCK_WEBDIR=../chuck-website

# print
echo "copying file to chuck-website/chugl/examples"
# copy to chugins/chuck/include
cp -rfv ${CHUGL_DIR}/examples/* ${CHUCK_WEBDIR}/chugl/examples/
