#!/bin/sh
if [ -d "/github/workspace" ]
then
  echo "link dir /github/workspace/"
  ln -s /github/workspace/* /protos/protos
fi

for i in `ls -1 /protos/*.sh`; do
  echo "=> execute check: `basename $i .sh | cut -c 3-` ..."
  if ! $i ; then
    exit 1
  fi
done

echo "All clear :)"
