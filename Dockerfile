FROM pomin5/php5-nginx:0.1.3
MAINTAINER Pomin Wu <pomin5@gmail.com>
ENV REFRESHED_AT 2015-02-10

ADD etc/nginx/sites-enabled /etc/nginx/sites-enabled/
