FROM php:7-apache
LABEL Andrei Dragulescu <andreidragulescu@gmail.com>

RUN apt-get update && apt-get install -y wget

ENV TERM xterm

ENV ZPUSH_URL zpush_default
ENV ZIMBRA_HOST localhost
ENV ZIMBRA_SSL true

ADD z-push-2.3.7.tar.gz /tmp
RUN cp -r /tmp/z-push-2.3.7/* /var/www/html/ && \
	rm -rf /tmp/z-push-2.3.7

ADD z-push-backend.tar.gz /tmp
RUN mkdir -p /var/www/html/backend/zimbra && \
	cp -r /tmp/zimbra66/* /var/www/html/backend/zimbra && \
	rm -rf /tmp/zimbra66

RUN mkdir /var/log/z-push/ && mkdir /var/lib/z-push
RUN chmod -R 777 /var/log/z-push && chmod -R 777 /var/lib/z-push

RUN sed -i "s/#ZPUSH_HOST#/$ZPUSH_URL/" /var/www/html/config.php
RUN sed -i "s/#ZIMBRA_HOST#/$ZIMBRA_HOST/" /var/www/html/config.php

COPY zimbra/autodiscover.php /var/www/html/autodiscover/
COPY zimbra/config.php /var/www/html/config.php
COPY zimbra/backend-config.php /var/www/html/backend/zimbra/config.php
COPY apache/default.vhost /etc/apache2/sites-enabled/000-default.conf
COPY apache/default-ssl.vhost /etc/apache2/sites-enabled/default-ssl.conf
COPY apache/z-push.conf /etc/apache2/conf-enabled/z-push.conf
COPY certs/ssl-cert-snakeoil.key /etc/ssl/private/ssl-cert-snakeoil.key
COPY certs/ssl-cert-snakeoil.pem /etc/ssl/certs/ssl-cert-snakeoil.pem

RUN a2enmod alias rewrite ssl

COPY ./startup.sh /root/startup.sh
CMD ["/bin/bash", "/root/startup.sh"]