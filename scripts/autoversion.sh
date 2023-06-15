#!/bin/bash
#
# name: autoversion.sh
# desc: update version number in chuck, miniAudicle, chugins
#
# usage: from chuck-o-matic/ root
#      > sh ./scripts/autoversion.sh
#      > sh ./scripts/autoversion.sh <new-version-string>

# version number
VERSION_NUMBER=${1}

# version name
VERSION_NAME="chai"

# check if version number empty
while [ -z "${VERSION_NUMBER}" ]
do
    # prompt for version number
    read -p "version number: " VERSION_NUMBER
done

# make sure the submodules are init and updated
echo "updating submodules..."
git submodule init
git submodule update --recursive

echo "updating version string in ./src/chuck/src/core/chuck.h..."
sed -n "s/#define CHUCK_VERSION_STRING.*/#define CHUCK_VERSION_STRING                \"$VERSION_NUMBER ($VERSION_NAME)\"/gp" ./src/chuck/src/core/chuck.h

echo "updating version string in ./src/miniAudicle/src/verison.h..."
sed -n "s/#define ENV_MA_VERSION.*/#define ENV_MA_VERSION \"${VERSION_NUMBER}\"/gp" ./src/miniAudicle/src/version.h

echo "updating version string in ./src/miniAudicle/src/verison.mk..."
sed -n "s/VERSION.*/VERSION?=${VERSION_NUMBER}/gp" ./src/miniAudicle/src/version.mk
