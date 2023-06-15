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

# whether testing for actually modify
WRITE_MODE=

# backup file extension
BACKUP_EXT=.bak


# check if version number empty
while [ -z "${VERSION_NUMBER}" ]
do
    # prompt for version number
    read -p "version number: " VERSION_NUMBER
done

# get mode
read -p "modify files? [y/(n)]: " WRITE_MODE

# test which mode
if [[ ${WRITE_MODE:0:1} == "y" ]]
then
	echo "WRITING mode (files modified)..."
    # write to file
    SED_FLAGS="-i${BACKUP_EXT}"
    SED_POST=
else
    echo "TESTING mode (files not modified)..."
    # don't print lines by default
    SED_FLAGS=-n
    SED_POST=p
fi

# make sure the submodules are init and updated
echo "updating submodules..."
git submodule init
git submodule update --recursive

echo "updating version string in ./src/chuck/src/core/chuck.h..."
sed ${SED_FLAGS} "s/#define CHUCK_VERSION_STRING.*/#define CHUCK_VERSION_STRING                \"$VERSION_NUMBER ($VERSION_NAME)\"/g${SED_POST}" ./src/chuck/src/core/chuck.h

echo "updating version string in ./src/miniAudicle/src/verison.h..."
sed ${SED_FLAGS} "s/#define ENV_MA_VERSION.*/#define ENV_MA_VERSION \"${VERSION_NUMBER}\"/g${SED_POST}" ./src/miniAudicle/src/version.h

echo "updating version string in ./src/miniAudicle/src/verison.mk..."
sed ${SED_FLAGS} "s/VERSION.*/VERSION?=${VERSION_NUMBER}/g${SED_POST}" ./src/miniAudicle/src/version.mk

# test which mode
if [[ ${WRITE_MODE:0:1} == "y" ]]
then
	echo "removing backup files..."
	rm -f ./src/chuck/src/core/chuck.h${BACKUP_EXT}
	rm -f ./src/miniAudicle/src/version.h${BACKUP_EXT}
	rm -f ./src/miniAudicle/src/version.mk${BACKUP_EXT}
fi
