#!/bin/bash
#
# name: ck-src-dist.sh
# desc: create chuck-x.x.x.x src distribution from repo HEAD
#
# usage: from chuck-o-matic/ root
#      > sh ./scripts/ck-src-dist.sh

# base chuck directory
CHUCK_DIR=../chuck

# print
echo "changing directory: "${CHUCK_DIR}
# go into chuck repo
cd ${CHUCK_DIR}
# make the target
make -f src/makefile src-dist
# print
echo "done! I hope."
