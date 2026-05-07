#!/bin/bash
set -e

ruby -v
bundler -v

echo "Running bundle install..."
bundle install

echo "Running db:prepare..."
bin/rails db:prepare

echo "Remove a potentially pre-existing server.pid..."
rm -f tmp/pids/server.pid

echo "App container is ready!!"
touch /tmp/app_ready

exec "$@"
