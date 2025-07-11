#!/usr/bin/env bash

BASEDIR=$(dirname "$0")
cd $BASEDIR

docker compose run --rm ruby bundle exec ./build-html.sh &&
docker compose run --rm node ./build-css.sh &&
mkdir -p ../../tmp/public &&
cp dist/index.html ../../tmp/public/ &&
cp -r images ../../tmp/public/ ||
exit 1