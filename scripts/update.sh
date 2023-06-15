#!/bin/bash
#
# name: update.sh
# desc: update everything
#
# usage: from chuck-o-matic/ root
#      > sh ./scripts/update.sh

# make sure the submodules are init and updated
echo "updating submodules..."
git submodule init
git submodule update --recursive
