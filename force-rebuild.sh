#!/bin/sh

git stash
git commit --allow-empty -m "forced rebuild"
git push
git stash apply

echo "#############"
echo "## Done. You can check on the status of this rebuild at:"
echo "https://gitlab.com/ilebedev/juliannma.com/pipelines"
echo "#############"
