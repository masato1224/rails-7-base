#!/bin/sh

set -ex

rm -f tmp/pids/server.pid

bundle config set --local path 'vendor/bundle'
bundle install -j4

bundle exec rails db:create
bundle exec rails db:migrate

bundle exec rails s -p 3000 -b '0.0.0.0'