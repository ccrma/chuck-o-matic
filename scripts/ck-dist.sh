#!/bin/bash
#
# name: ck-dist.sh
# desc: create chuck-x.x.x.x src distribution from repo HEAD
#
# usage: from chuck-o-matic/ root
#      > sh ./scripts/ck-dist.sh


# echo
echo "ready to create chuck source distribution?"
# get mode
read -p "modify files? [y/(n)]: " WRITE_MODE

# test which mode
if [[ ${WRITE_MODE:0:1} == "y" ]]
then
	echo "alright, let's go"
else
    echo "probably a good idea; could always use more testing..."
    exit 1
fi

# print
echo "changing directory: ../chuck/"
# go into chuck repo
cd ../chuck/
# make the target
make -f src/makefile src-dist
# print
echo "done! I hope."
