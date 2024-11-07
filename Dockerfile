# define server
FROM php:8.2-apache

# run update and upgrade linux vm container
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y libicu-dev libpng-dev libzip-dev
RUN docker-php-ext-install intl zip gd

# enable php mod_rewrite
RUN a2enmod rewrite

# modify php.ini
RUN echo "upload_max_filesize = 100M" > /usr/local/etc/php/conf.d/uploads.ini
RUN echo "post_max_size = 100M" >> /usr/local/etc/php/conf.d/uploads.ini

# install git
RUN apt-get install git -y

# copy config file to container
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# restart apache
RUN service apache2 restart
