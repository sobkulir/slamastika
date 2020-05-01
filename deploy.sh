#!/bin/bash

git checkout --quiet master
something_changed=$(git diff-index --exit-code --ignore-submodules HEAD)
if [ -n "$something_changed" ]
then
    echo >&2 "Master has some changes, this state-of-the-art script thus cannot deploy."
    exit 1
fi

git checkout -B gh-pages
mkdir .dist
mv src/* .dist
rm -rf *
mv .dist/* .
rm -rf .dist

git add -A .
git commit -m "deploy"
git push -f origin gh-pages

git checkout master
git clean -df