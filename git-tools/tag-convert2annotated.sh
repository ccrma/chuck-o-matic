#!/bin/sh
#------------------------------------------------------------------------------
# name: tag-convert2annotated.sh
# desc: convert a lightweight git tag to an annotated one --
#       with prompt for pushing to remote
#
# usage: do this from inside a local repo clone
#        sh tag-convert2annonated.sh [TAG NAME]
#
# from other existing local clones of the affected repo:
#        git fetch --tags --force
# the `--force` flag is needed, otherwise will produce error message:
#        [rejected] (would clobber existing tag)
#
# related threads:
# https://stackoverflow.com/questions/5002555/can-a-lightweight-tag-be-converted-to-an-annotated-tag
# https://stackoverflow.com/questions/58031165/how-to-get-rid-of-would-clobber-existing-tag
#
# author: Ge Wang, who cobbled this together from twenty internet searches
#   date: Summer 2023
#------------------------------------------------------------------------------

# the tag name
tag=$1
# get info
echo "retrieving info for tag '"$tag"'"
# get date
date="$(git show $tag --format=%cD -s 2> /dev/null)"
# get name
name="$(git show $tag --format=%cn -s)"

# test exit code
if [ $? -ne 0 ]; then
    echo "error: cannot retrieve tag info; bailing out"
    exit 1;
fi

# print
echo "  date:" $date
echo "  committer:" $name
# replace tag
GIT_COMMITTER_DATE="$date" GIT_COMMITTER_NAME="$name" git tag -a -f $tag $tag^0

# get mode
read -p "push to remote? [y/(n)]: " PUSH_MODE

# test which mode
if [[ ${PUSH_MODE:0:1} == "y" ]]
then
    echo "pushing to remote..."
    # this will delete and replace on remote
    git push origin :refs/tags/$tag
    git push origin --tags
else
    echo "nothing pushed"
fi
