FROM ruby:2.3

ENV RAILS_VERSION 4.2.6

# see update.sh for why all "apt-get install"s have to stay as one long line
RUN apt-get update && apt-get install -y imagemagick &&  apt-get install -y nano && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*



RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server 

# && mysqld && mysqladmin -u root password root

# see http://guides.rubyonrails.org/command_line.html#rails-dbconsole
RUN apt-get update && apt-get install -y mysql-client --no-install-recommends && rm -rf /var/lib/apt/lists/* && gem install rails --version "$RAILS_VERSION"

WORKDIR /var/www

RUN rails new app --database=mysql

WORKDIR /var/www/app

COPY ./src/Gemfile /var/www/app
COPY ./src/database.yml /var/www/app/config
COPY ./installpageflow.sh /var/www/app/installpageflow.sh

RUN chmod +x /var/www/app/installpageflow.sh

EXPOSE 3000

#ENTRYPOINT ["/bin/sh", "/var/www/app/installpageflow.sh"]

CMD ["/var/www/app/installpageflow.sh"]





