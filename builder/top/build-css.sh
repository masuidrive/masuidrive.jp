#!/bin/sh

export PATH=/usr/src/app/node_modules/.bin/:$PATH

mkdir -p tmp/styles dist

sass styles/index.scss tmp/styles/index.css -I node_modules &&
uncss tmp/index.html > tmp/index.min.css &&
cp tmp/index.min.css tmp/styles/index.css &&
(cd tmp && inline-css -i index.html -o index.min.html) &&
htmlminify tmp/index.min.html -o dist/index.html || exit 1;
