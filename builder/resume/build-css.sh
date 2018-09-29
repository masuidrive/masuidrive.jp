#!/bin/sh

export PATH=/usr/src/app/node_modules/.bin/:$PATH

mkdir -p tmp dist

sass styles/index.scss tmp/resume.css -I node_modules &&
uncss tmp/resume.html > tmp/resume.min.css &&
cp tmp/resume.min.css tmp/resume.css &&
(cd tmp && inline-css -i resume.html -o resume.min.html) &&
htmlminify tmp/resume.min.html -o dist/resume.html || exit 1;
