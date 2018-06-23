#!/usr/bin/env bash

source ../color.sh

IFS=$'\n'
for fields in ${colors[@]}
do
	IFS=$'|' read -r name code human_name <<< "$fields"
	echo -e "${human_name} (${name}) = ${code}Yeah!${NC}"
done
unset IFS



