#!/bin/bash

test "$TRAVIS" = "y" || (
  echo "This script should only run on travis"
  exit 0
)

test -f mozilla-central/mach || (
  echo "Cloning mozilla-central..."
  test -d mozilla-central && rm -rf mozilla-central
  hg clone https://hg.mozilla.org/mozilla-central mozilla-central || (
    echo "ERROR: unable to complete mozilla-central cloning"
    exit 1
  )
)

pushd mozilla-central

## create a bookmark
hg bookmark mozilla-central/`date +%Y%m%d`

popd
