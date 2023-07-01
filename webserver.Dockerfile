FROM php:8.0-apache

# CONFIGURAMOS EL PHP.INI A UTILIZAR
RUN mv /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini 


# INSTALAMOS ALGUNAS DEPENDENCIAS
WORKDIR /tmp
COPY composer-setup.php /tmp/composer-setup.php
COPY phpunit-9.6.9.phar /tmp/phpunit.phar
RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    unzip \
    libcurl4-openssl-dev \
    pkg-config \
    libssl-dev


# INSTALAMOS COMPOSER 
RUN php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    && mv phpunit.phar /usr/local/bin/phpunit \
    && chmod +x /usr/local/bin/phpunit


# INSTALAMOS EXTENSIONES ADICIONALES DE PHP
WORKDIR /usr/local/bin
RUN docker-php-ext-install zip 
RUN pecl install mongodb \
    && echo "extension=mongodb.so" >> /usr/local/etc/php/php.ini


# INSTALAMOS EL DRIVER PHP PARA MONGODB
WORKDIR /var/www/html
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN composer require mongodb/mongodb --ignore-platform-reqs \
    && composer require guzzlehttp/guzzle:^7.0 --ignore-platform-reqs