#!/bin/bash
#
# name: chugins-gen-header.sh
# desc: generate a single chugin.h header & copy to various repos
#
# usage: from chuck-o-matic/ root
#      > sh ./scripts/chugins-gen-header.sh

# base chuck directory
CHUCK_DIR=../chuck/src/core
# name of generated header
CHUGIN_H=chugin.h

# base chugins directory
CHUGINS_DIR="../chugins/chuck/include/"
# chuck headers repo
CHEADERS_DIR="../cheaders/include/"
# base chugl directory
CHUGL_DIR="../chugl/src/vendor/chuck/"

# print what we are doing
echo "generating a single header: '${CHUGIN_H}'"

# generate from four minimal chuck headers; omit #include for chuck headers
awk '!/#include "chuck_/ {print}' \
    src/chugin-preamble.h \
    ${CHUCK_DIR}/chuck_def.h \
    ${CHUCK_DIR}/chuck_symbol.h \
    ${CHUCK_DIR}/chuck_absyn.h \
    ${CHUCK_DIR}/chuck_dl.h \
    > ${CHUGIN_H}

# print and copy
echo "copying '${CHUGIN_H}' to ${CHUGINS_DIR}..."
cp -fv ${CHUGIN_H} ${CHUGINS_DIR}

# print and copy
echo "copying '${CHUGIN_H}' to ${CHUGL_DIR}..."
cp -fv ${CHUGIN_H} ${CHUGL_DIR}

# print and copy
echo "copying '${CHUGIN_H}' to ${CHEADERS_DIR}..."
cp -fv ${CHUGIN_H} ${CHEADERS_DIR}

# print and copy
echo "removing '${CHUGIN_H}'..."
# remove
rm -f ${CHUGIN_H}
