#!/bin/sh

PATH="/root/go/bin:${PATH}"

# run linter
prototool lint --config-data "${cat /protos/prototool.json}" ./
