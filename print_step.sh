#!/usr/bin/env bash
# Jump_start script helps to switch between projects faster
# https://github.com/gsempe/jump-start-project
#
# print_step.sh defines a function to print steps.
# STEP_STAR_COLOR can be set to change the star color (cf color.sh)
# step prints its first argument after a colored star. The default color is
# green.

function step
{
        NC='\033[0m' # No Color
	STAR_COLOR="${STEP_STAR_COLOR:-'\033[0;32m'}"

        echo -e "${STAR_COLOR}*${NC} $1"
}
