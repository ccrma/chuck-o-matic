#!/bin/bash

ReleaseName="chai"

# make sure the submodules are init and updated
git submodule init
git submodule update --recursive


# sh ./scripts/autoversion.sh <new-version-string>

echo "updating version string in ./src/chuck/src/core/chuck.h"

sed "s/#define CHUCK_VERSION_STRING.*/#define CHUCK_VERSION_STRING                \"${1} ($ReleaseName)\"/g" ./src/chuck/src/core/chuck.h

echo "updating version string in ./src/miniAudicle/src/verison.h"

sed "s/#define ENV_MA_VERSION.*/#define ENV_MA_VERSION \"${1}\"/g" ./src/miniAudicle/src/version.h

echo "updating version string in ./src/miniAudicle/src/verison.mk"
sed "s/VERSION.*/VERSION?=${1}/g" ./src/miniAudicle/src/version.mk



