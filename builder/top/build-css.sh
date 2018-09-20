#!/bin/sh

export PATH=./node_modules/.bin/:$PATH

mkdir -p tmp/styles dist

sass styles/index.scss tmp/styles/index.css -I node_modules &&
uncss tmp/index.html > tmp/index.min.css &&
cp tmp/index.min.css tmp/index.css &&
inliner --noimages tmp/index.html > dist/index.html || exit 1;
