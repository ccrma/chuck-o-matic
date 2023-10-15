#!/bin/bash
#
# name: chugl-update-ckdoc.sh
# desc: generate ckdoc for ChuGL
#
# usage: from chuck-o-matic/ root
#      > sh ./scripts/chugl-update-ckdoc.sh

# base chuck-website directory
CHUCK_WEBDIR=../chuck-website
# base chugl directory (relative to api dir)
CHUGL_DIR="../../../chugl"
# chuck executable to use for generating the cdoc (relative to api dir)
CHUCK_EXE="../../../chuck/src/chuck"

# print
echo "chdir to ${CHUCK_WEBDIR}/chugl/api..."
cd ${CHUCK_WEBDIR}/chugl/api/
# generate ckdoc
echo "generating ckdoc using ${CHUCK_EXE}"
${CHUCK_EXE} ${CHUGL_DIR}/src/scripts/ckdoc/gen-chugl.ck
