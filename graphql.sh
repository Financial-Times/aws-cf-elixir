#!/bin/bash
# A little shim to ensure environment variables are passed to the nodetool.
#

SAVE=$(set +o) && set -o allexport && . ~/.env; eval "$SAVE"

export VERBOSE=true


export LANG=en_GB.UTF-8

~/deployments/graphql/bin/graphql $*
