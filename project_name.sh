#!/usr/bin/env bash
# Jump_start script helps to switch between projects faster
# https://github.com/gsempe/jump-start-project
#
# project_name.sh defines a function to set the project name.
# PROJECT_NAME can be set to force the project name.
# If the script file name is follows the pattern "jump_start_<project_name>.sh"
# and the PROJECT_NAME env variable is not set the project name is
# <project_name>.

function project_name_from_script_name
{
	SCRIPT_NAME=$BASH_SOURCE # for instance source jump_start_test.sh
	NAKED_SCRIPT_NAME=`basename ${SCRIPT_NAME} ".sh"` # for instance jump_start_test
	PREFIX="jump_start_"
	[[ ${NAKED_SCRIPT_NAME} =~ ^${PREFIX} ]] || { echo ""; return 1;}
	echo "${NAKED_SCRIPT_NAME##$PREFIX}"
	return 0
}

PROJECT_NAME="${PROJECT_NAME:-`project_name_from_script_name`}"

echo "project name is ${PROJECT_NAME}"
