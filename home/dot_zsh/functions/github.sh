#!/bin/bash
github-cd() {
	local dir="${HOME}/src/github.com/$1"
	cd "${dir}"
}

github-clone-cd() {
	local prefix=https://github.com/
	if [ "$1" = "--ssh" ]; then
		prefix=git@github.com:
		shift
	fi
	local dir="${HOME}/src/github.com/$1"
	if [ ! -d "${dir}" ]; then
		git clone "${prefix}$1.git" "${dir}"
	fi
	cd "${dir}"
}

github-clone-code() {
	local prefix=https://github.com/
	if [ "$1" = "--ssh" ]; then
		prefix=git@github.com:
		shift
	fi
	local dir="${HOME}/src/github.com/$1"
	if [ ! -d "${dir}" ]; then
		git clone "${prefix}$1.git" "${dir}"
	fi
	code "${dir}"
}