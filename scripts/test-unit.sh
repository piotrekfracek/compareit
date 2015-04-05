#!/bin/bash

export BUILD=true

if [ "$1" != "--no-build" ]; then
  bundle exec middleman build
fi

node_modules/karma/bin/karma start test/unit/karma.conf.coffee
