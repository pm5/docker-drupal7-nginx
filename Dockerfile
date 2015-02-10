FROM pomin5/php5-nginx:latest
MAINTAINER Pomin Wu <pomin5@gmail.com>
ENV REFRESHED_AT 2015-02-10

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -yq drush && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ADD etc/nginx/sites-enabled /etc/nginx/sites-enabled/

ADD service/drupal7.sh /etc/service/drupal7/run
RUN chmod 755 /etc/service/drupal7/run

WORKDIR /var/www
