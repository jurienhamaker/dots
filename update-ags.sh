#!/usr/bin/env bash
cd "$(dirname "$0")"
export base="$(pwd)"

source ./scriptdata/environment-variables
source ./scriptdata/functions
source ./scriptdata/installers
source ./scriptdata/options

v install-ags
