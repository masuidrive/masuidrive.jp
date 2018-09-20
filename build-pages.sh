#!/usr/bin/env bash

./builder/top/build.sh &&
./builder/resume/build.sh &&
mkdir -p tmp/public &&
cp -r public/* tmp/public ||
exit 1
