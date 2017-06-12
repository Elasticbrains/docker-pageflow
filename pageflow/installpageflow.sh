#!/bin/bash

echo "install Pageflow"

cd /var/www/app

bundle update

bundle install

rake db:create

bundle install 

rails generate pageflow:install -f

rake db:migrate

rake db:seed

bundle exec rails server -b 0.0.0.0

