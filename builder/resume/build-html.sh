#!/bin/sh

mkdir -p tmp

ruby generate.rb resume.md > tmp/resume.html || exit 1;