#!/bin/sh

# Check proper directory structure in project
if [ ! -d /protos/protos/rpc/tt ]; then
  echo "***"
  echo "*** Where is your RPC directory ?"
  echo "*** At least you must have '/rpc/tt' in the root"
  echo "*** https://burning-heart.atlassian.net/wiki/spaces/TT/pages/804814890/RPC+API+Guideline"
  echo "***"
  exit 1
fi
