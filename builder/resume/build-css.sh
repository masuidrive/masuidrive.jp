#!/bin/sh

export PATH=./node_modules/.bin/:$PATH

mkdir -p tmp dist

sass styles/index.scss tmp/resume.css -I node_modules &&
uncss tmp/resume.html > tmp/resume.min.css &&
cp tmp/resume.min.css tmp/resume.css &&
inliner --noimages tmp/resume.html > dist/resume.html ||
exit 1;
