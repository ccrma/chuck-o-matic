#!/bin/bash
#
# name: subs-push
# desc: [use with care] for each submodule, commit and push all changes
#
# usage: from chuck-o-matic/ root
#      > sh ./scripts/subs-push.sh

echo "****************"
echo "USE WITH CARE!!!"
echo "****************"

# get confirmation
read -p "are you sure you want to push all submodules? [y/(n)]: " CONFIRM

# test which mode
if [[ ${CONFIRM:0:1} != "y" ]]
then
    echo "cancelling..."
    exit
fi

echo "proceeding..."
echo "git commit -am 'chuck-o-matic commit' && git push"
git submodule foreach "git commit -am 'chuck-o-matic commit' && git push"
