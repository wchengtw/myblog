#!/usr/bin/env bash
# Install dependencies and compile assets
bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
