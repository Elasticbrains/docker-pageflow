#!/bin/sh
echo "Docker CMD"


echo "Start Services"

echo "start mysql"
nohup mysqld &

echo "start redis"
nohup redis-server &

echo "Waiting 5s to give services time to be available"
sleep 5s

if [ ! -f install.mark ]; then
    echo "Execute first installation!"

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

    touch install.mark
else
    echo "Everything is already installed"
fi

bundle exec rails server -b 0.0.0.0
