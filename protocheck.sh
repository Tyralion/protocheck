#!/bin/sh
if [[ -z $1 ]]; then
  ln -s /github/workspace/* /protos/protos
fi

for i in `ls -1 /protos/*.sh`; do
  echo "=> execute check: `basename $i .sh | cut -c 3-` ..."
  if ! $i ; then
    exit 1
  fi
done

echo "All clear :)"
