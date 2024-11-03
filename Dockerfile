# Use PHP 8.1 as the base image
FROM php:8.1-apache

# Install necessary PHP extensions, including intl
RUN apt-get update && \
    apt-get install -y libicu-dev && \
    docker-php-ext-install intl pdo pdo_mysql

# Enable Apache mod_rewrite for CodeIgniter
RUN a2enmod rewrite

# Copy the app files to the working directory
COPY . /var/www/html

# Set the working directory
WORKDIR /var/www/html

# Set the necessary permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose the necessary port
EXPOSE 80
