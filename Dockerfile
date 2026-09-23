FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y apache2 php libapache2-mod-php php-mysql mysql-server && \
    sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf && \
    sed -i 's/:80>/:8080>/' /etc/apache2/sites-available/000-default.conf && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY index.php /var/www/html/index.php

EXPOSE 8080

CMD service mysql start && apachectl -D FOREGROUND
