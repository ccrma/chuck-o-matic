#!/bin/bash
#
# name: ck-distclean.sh
# desc: clean src distribution
#
# usage: from chuck-o-matic/ root
#      > sh ./scripts/ck-distclean.sh


# print
echo "changing directory: ../chuck/"
# go into chuck repo
pushd ../chuck/ > null
# print
echo "cleaning generated source distribution..."
# make the target
make --just-print -f src/makefile clean
# come back
popd > null
# print
echo "coming back to where we started..."
