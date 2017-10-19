#!/bin/sh

git stash
git pull
git stash apply
git add .
git commit -m "$1"
git push

git status

echo "#############"
echo "## You should see: \""
echo "On branch master"
echo "Your branch is up-to-date with \'origin/master\'."
echo "nothing to commit, working tree clean \""
echo "#############"
