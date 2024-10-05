FROM php:8.3.4RC1-fpm-bookworm
LABEL maintainer="Sinfallas"
ARG UID=1000
ARG GID=1000
RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data
WORKDIR /appdata/wwwroot
ENV DEBIAN_FRONTEND noninteractive
RUN mkdir -p /var/lib/php/soap_cache
RUN mkdir -p /var/lib/php/tmp_upload
COPY ./docker/php/php-fpm-healthcheck /usr/bin/php-fpm-healthcheck
RUN chmod 777 /usr/bin/php-fpm-healthcheck
RUN apt-get update && apt-get install -y -qq --no-install-recommends --no-install-suggests git acl openssl openssh-client wget unzip zip vim libssh-dev libpq-dev libpng-dev zlib1g-dev libzip-dev libxml2-dev libicu-dev libmagickwand-dev wget nano less cron htop procps cpulimit librabbitmq-dev supervisor
RUN docker-php-ext-install intl pdo pdo_mysql zip gd soap bcmath sockets xml
RUN pecl install amqp
RUN docker-php-ext-enable --ini-name 05-opcache.ini opcache amqp
RUN curl --insecure https://getcomposer.org/composer.phar -o /usr/bin/composer
RUN chmod +x /usr/bin/composer
RUN composer self-update
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
