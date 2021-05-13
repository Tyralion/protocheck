#!/bin/sh

PATH="/root/go/bin:${PATH}"

# run linter
prototool lint ./
