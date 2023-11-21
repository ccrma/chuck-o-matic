#!/bin/bash
#
# name: chugins-get-header.sh
# desc: generate a single chugin.h header & copy to chugins and chugl
#
# usage: from chuck-o-matic/ root
#      > sh ./scripts/chugins-gen-header.sh

# base chuck directory
CHUCK_DIR=../chuck/src/core
# name of generated header
CHUGIN_H=chugin.h

# base chugins directory
CHUGINS_DIR="../chugins"
# base chugl directory
CHUGL_DIR="../chugl"

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

# print
echo "copying '${CHUGIN_H}' to ${CHUGINS_DIR}/chuck/include..."
# copy
cp -fv ${CHUGIN_H} ${CHUGINS_DIR}/chuck/include/

# print
echo "copying '${CHUGIN_H}' to ${CHUGL_DIR}/src/chuck/include..."
# copy
cp -fv ${CHUGIN_H} ${CHUGL_DIR}/src/chuck/include/

# print
echo "removing '${CHUGIN_H}'..."
# remove
rm -f ${CHUGIN_H}
