#!/usr/bin/env bash
# Jump_start script helps to switch between projects faster
# https://github.com/gsempe/jump-start-project
#
# github.sh defines a function to clone a github repository.
# GITHUB_DIR can be set to override the destination folder
# REPOSITORY has to be set. For instance companname/reponame

GITHUB_DIR="${GITHUB_DIR:-"${WDIR}/src"}"
SHOULD_SSH_CLONE=true

if [ ! -d "$GITHUB_DIR" ]; then
        step "Downloading repository $REPOSITORY..."
        if [ "$SHOULD_SSH_CLONE" = true ] ; then
                git clone git@github.com:$REPOSITORY $GITHUB_DIR
        else
                git clone https://github.com/$REPOSITORY $GITHUB_DIR
        fi
else
        step "Skipping $REPOSITORY clone, folder $GITHUB_DIR exists..."
fi

cd $GITHUB_DIR
step "Downloading repository $REPOSITORY updates..."
git fetch --all
