#!/bin/sh

git pull
git status
bundle exec jekyll serve


git status

echo "#############"
echo "## If you see any red or green above, do this:"
echo '## ./commit "<few words describing what you did>"'
echo "#############"
