#!/usr/bin/env bash

./run-tests.sh > output.txt
passing_test_suites=$(grep -c "\*\* TEST SUCCEEDED \*\*" output.txt)
rm output.txt
if (($passing_test_suites==2)); then
  git tag $1
  echo "Set version $1"
else
  echo ERROR: Not all tests passed, aborting version update
  exit 1
fi
