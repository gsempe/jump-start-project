#!/usr/bin/env bash
# Jump_start script helps to switch between projects faster
# https://github.com/gsempe/jump-start-project
#
# asdf.sh defines a function to install https://github.com/asdf-vm/asdf
# ASDF_DIR can be set to override the destination folder

ASDF_DIR=${ASDF_DIR:-${WDIR}/asdf}
ASDF_VERSION="v0.5.0"

if [ ! -d "${ASDF_DIR}" ]; then
        step "Installing ASDF into ${ASDF_DIR}..."
        git clone https://github.com/asdf-vm/asdf.git ${ASDF_DIR} --branch ${ASDF_VERSION}
        cd ${ASDF_DIR}
else
        step "Skipping asdf-vm/asdf clone, folder ${ASDF_DIR} exists..."
        cd ${ASDF_DIR}
fi
step "Configuring ASDF..."
source ${ASDF_DIR}/asdf.sh
source ${ASDF_DIR}/completions/asdf.bash
