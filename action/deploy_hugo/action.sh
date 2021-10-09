#!/bin/sh

set -e


if [ -n "${GITHUB_TOKEN}" ]; then
    remote_repo="https://x-access-token:${GITHUB_TOKEN}@${GITHUB_DOMAIN:-"github.com"}/${GITHUB_REPOSITORY}.git"
elif [ -n "${PERSONAL_TOKEN}" ]; then
    remote_repo="https://x-access-token:${PERSONAL_TOKEN}@${GITHUB_DOMAIN:-"github.com"}/${GITHUB_REPOSITORY}.git"
fi

if ! git config --get user.name; then
    git config --global user.name "${GITHUB_ACTOR}"
fi

if ! git config --get user.email; then
    git config --global user.email "${GITHUB_ACTOR}@users.noreply.${GITHUB_DOMAIN:-"github.com"}"
fi


git checkout --orphan gh-pages

cd static_hugo_site
hugo --destination ../docs 
cd ..
git reset
git add docs/**

git remote add github "${remote_repo}"

git commit -m "publish site"
git push --force --set-upstream github gh-pages