#!/usr/bin/env bash

test_failed_lines=$(./run-tests.sh | grep -c "** TEST FAILED **")
if (( $test_failed_lines > 0 )); then
  echo ERROR: Aborting version update
  exit 1
else
  git tag $1
  echo "Set version $1"
fi
