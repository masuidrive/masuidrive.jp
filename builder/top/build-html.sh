#!/bin/sh

mkdir -p tmp

ruby generate.rb index.erb > tmp/index.html || exit 1;