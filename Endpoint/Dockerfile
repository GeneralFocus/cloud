FROM php:8.2-apache

WORKDIR /var/www/html

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo_mysql \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
    && rm -rf /var/lib/apt/lists/*

COPY . /var/www/html

RUN composer install --no-dev --optimize-autoloader

RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

COPY ./docker/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN echo 'ServerName localhost' > /etc/apache2/conf-available/servername.conf && \
    a2enconf servername && \
    a2enmod rewrite

EXPOSE 80

CMD ["apache2-foreground"]
