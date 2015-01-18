#!/bin/bash

build_file="build.json"
packer-io validate ${box_file}

for box in $(find . -type f -name "*.json" | grep -v ${build_file} | cut -d'-' -f2 | cut -d'.' -f1); do
	echo -e "Building box: ${box}\n"
	box_file="variable-${box}.json"
	packer-io build -var-file ${box_file} ${build_file}
done
