#!/bin/sh
echo "Docker CMD"

echo "install Pageflow"

echo "start mysqld"
#Starting MySQl
nohup mysqld &

echo "Waiting 5s that hopefully mysqld has startet"
sleep 5s

mysqladmin -u root password root

cd /var/www/app

bundle update

bundle install

rake db:create

bundle install 


echo "" >> Gemfile
echo "gem 'pageflow'" >> Gemfile
echo "gem 'state_machine', git: 'https://github.com/codevise/state_machine.git'" >> Gemfile

bundle update

bundle install

rails generate pageflow:install -f

rake db:migrate

rake db:seed

bundle exec rails server -b 0.0.0.0

#nohup bundle exec rails server -b 0.0.0.0 &