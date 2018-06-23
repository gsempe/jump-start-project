#!/usr/bin/env bash
# Jump_start script helps to switch between projects faster
# jump_start.sh is the top level script file in which are injected other
# components.
# JUMP_START_DIR can be set to override the default root directory
# PROJECT_NAME is expected to be set to the name of the project

# https://www.ynonperek.com/2017/09/04/bash-cheat-sheet/
set -e
set -o noclobber

JUMP_START_DIR="${JUMP_START_DIR:-"~/projects"}"
WDIR=${JUMP_START_DIR}/${PROJECT_NAME}

# Copy needed components here

set +e
set +o noclobber

