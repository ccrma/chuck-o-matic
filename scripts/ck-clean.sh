#!/bin/bash
#
# name: ck-clean.sh
# desc: make clean in chuck, including removing src distribution
#
# usage: from chuck-o-matic/ root
#      > sh ./scripts/ck-clean.sh

# base chuck directory
CHUCK_DIR=../chuck

# print
echo "changing directory: "${CHUCK_DIR}"/src"
# go into chuck repo
pushd ${CHUCK_DIR}/src/ > /dev/null
# print
echo "cleaning generated source distribution..."
# make the target
make clean
# come back
popd > /dev/null
# print
echo "coming back to where we started..."
