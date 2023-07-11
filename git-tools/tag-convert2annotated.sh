#!/bin/sh
#
# name: tag-convert2annotated.sh
# desc: convert a lightweight git tag to an annotated one
#
# usage: do this from inside a local repo
#        sh tag-convert2annonated.sh [TAG NAME]
#
# from other local copies of the affect repo:
#        git fetch --tags --force
# the `--force` flag is needed, otherwise will produce error message:
#        [rejected] (would clobber existing tag)
# for more info on fetching replaced tag:
#        https://stackoverflow.com/questions/58031165/how-to-get-rid-of-would-clobber-existing-tag


# the tag name
tag=$1
# get date
date="$(git show $tag --format=%cD -s)"
# get name
name="$(git show $tag --format=%cn -s)"
# replace tag
GIT_COMMITTER_DATE="$date" GIT_COMMITTER_NAME="$name" git tag -a -f $tag $tag^0

# get mode
read -p "push to remote? [y/(n)]: " PUSH_MODE

# test which mode
if [[ ${PUSH_MODE:0:1} == "y" ]]
then
    echo "pushing to remote..."
    # if the lightweight tag already exists on remotes, will delete and replace
    echo git push origin :refs/tags/$tag
    git push origin :refs/tags/$tag
    echo git push origin --tags
    git push origin --tags
else
    echo "nothing pushed"
fi

