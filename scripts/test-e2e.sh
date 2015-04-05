#!/bin/bash

conf_url="test/e2e/protractor.conf.coffee"

browser=''

if [ $1 ]; then
  echo "Browser: $1"
  browser="--browser $1";
else
  echo "Browser: default"
fi

node_modules/.bin/protractor $conf_url $browser
