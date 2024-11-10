FROM php:8.3.11-fpm-alpine

# Add the PHP extension installer
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# Install PHP extensions
RUN install-php-extensions \
    opcache \
    pdo_mysql

# Installer git, unzip, zip via apk
# Pour simplifier, si tu as un projet basique qui utilise uniquement des paquets standards via Composer (sans archives compressées ni dépôts Git), tu peux te passer de ces outils.
# RUN apk add --no-cache git unzip zip

# Set up Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

ENV COMPOSER_HOME="/tmp/composer"
ENV COMPOSER_ALLOW_SUPERUSER=1

WORKDIR /app

# Copy application files
COPY index.php /app/index.php
COPY . /app
