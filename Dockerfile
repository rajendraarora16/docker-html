FROM php:7.0-apache

RUN docker-php-ext-install mysqli

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

RUN apt-get install wget && wget http://pear.php.net/go-pear.phar && php go-pear.phar

RUN pear install HTTP_Request2

COPY src/ /var/www/html
EXPOSE 80
