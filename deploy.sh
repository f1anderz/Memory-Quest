#!/usr/bin/env sh

set -e

npm run build

cd dist

git init
git add -A
git commit -m 'deploy v1.0'

git push -f git@github.com:f1anderz/Memory-Quest.git master:gh-pages

cd -