#!/usr/bin/env bash

./run-tests.sh
git tag $1
echo "Set version $1"
