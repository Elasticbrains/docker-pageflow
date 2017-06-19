#!/bin/sh
echo "Docker CMD"


echo "Start Services"

echo "start mysql"
nohup mysqld &

echo "start redis"
nohup redis-server &

echo "Waiting 5s to give services time to be available"
sleep 5s

cd /var/www/app

if [ ! -f install.mark ]; then
    echo "Execute first installation!"

    mysqladmin -u root password root

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

    #Create File to remember next time if we already installed everything
    touch install.mark
else
    echo "Everything is already installed"
fi

echo "Starting redis workers"
BACKGROUND=yes QUEUE=* rake resque:work RAILS_ENV=development >>  worker1.log &
BACKGROUND=yes QUEUE=* rake resque:scheduler RAILS_ENV=development >>  worker2.log &

bundle exec rails server -b 0.0.0.0
