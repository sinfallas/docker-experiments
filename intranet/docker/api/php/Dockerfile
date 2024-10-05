FROM php:7.0-fpm
ARG UID=1000
ARG GID=1000
RUN adduser -u $UID --disabled-password --gecos "" appuser
RUN mkdir /home/appuser/.ssh
RUN chown -R appuser:appuser /home/appuser/
RUN echo "StrictHostKeyChecking no" >> /home/appuser/.ssh/config
RUN echo "export COLUMNS=300" >> /home/appuser/.bashrc
RUN echo "alias sf=/appdata/wwwroot/bin/console" >> /home/appuser/.bashrc
COPY ./php.ini /usr/local/etc/php/php.ini
RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends git acl openssl openssh-client wget zip vim librabbitmq-dev libssh-dev libpq-dev libpng-dev zlib1g-dev libzip-dev libxml2-dev libicu-dev libmagickwand-dev
RUN docker-php-ext-install intl pdo pdo_mysql zip gd soap bcmath sockets xml
#RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql
RUN pecl install xdebug amqp imagick
RUN docker-php-ext-enable --ini-name 05-opcache.ini opcache amqp xdebug imagick
RUN curl --insecure https://getcomposer.org/composer.phar -o /usr/bin/composer && chmod +x /usr/bin/composer
RUN composer self-update
RUN wget https://cs.symfony.com/download/php-cs-fixer-v2.phar -O php-cs-fixer
RUN chmod a+x php-cs-fixer
RUN mv php-cs-fixer /usr/local/bin/php-cs-fixer
RUN mkdir -p /appdata/wwwroot
WORKDIR /appdata/wwwroot
