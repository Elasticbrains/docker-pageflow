FROM ruby:2.3

ENV RAILS_VERSION 4.2.2

# see update.sh for why all "apt-get install"s have to stay as one long line
RUN apt-get update &&  apt-get install -y imagemagick && apt-get install -y nano && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

# see http://guides.rubyonrails.org/command_line.html#rails-dbconsole
RUN apt-get update && apt-get install -y mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/* && gem install rails --version "$RAILS_VERSION"

WORKDIR /var/www

RUN rails new app --database=mysql

WORKDIR /var/www/app

COPY ./src/Gemfile /var/www/app
COPY ./src/database.yml /var/www/app/config
COPY ./installpageflow.sh /var/www/app/installpageflow.sh

RUN chmod +x installpageflow.sh

EXPOSE 3000

ENTRYPOINT ["/bin/bash", "/var/www/app/installpageflow.sh"]

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

