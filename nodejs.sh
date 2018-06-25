#!/usr/bin/env bash
# Jump_start script helps to switch between projects faster
# https://github.com/gsempe/jump-start-project
#
# nodejs.sh defines a function to install nodejs in NVM env
# NVM_DIR can be set to override the destination folder

NVM_DIR=${NVM_DIR:-${WDIR}/nvm}
NVM_VERSION="v0.33.6"
NODE_VERSION="lts/*"

if [ ! -d "$NVM_DIR" ]; then
        # Following https://github.com/creationix/nvm#manual-install
        step "Installing NVM into ${NVM_DIR}..."
        git clone https://github.com/creationix/nvm.git "${NVM_DIR}"
        cd ${NVM_DIR}
        git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
else
        step "Skipping creationix/nvm clone, folder ${NVM_DIR} exists..."
        cd ${NVM_DIR}
fi
step "Configuring NVM..."
npm config delete prefix
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
step "Switching to node $NODE_VERSION..."
nvm install $NODE_VERSION
nvm use --delete-prefix $NODE_VERSION
step "Installing dependencies..."
#npm install
