#!/bin/bash

git checkout -B gh-pages
mkdir .dist
mv src/* .dist
rm -rf *
mv .dist/* .
rm -rf .dist

git add *
git commit -m "deploy"
git push -f origin gh-pages
