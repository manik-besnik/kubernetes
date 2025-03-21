# Use official PHP image with FPM
FROM php:8.4-fpm

# Install necessary PHP extensions and dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    git \
    curl \
    libssl-dev \
    && docker-php-ext-configure zip \
    && docker-php-ext-install gd zip

# Set the working directory inside the container
WORKDIR /var/www

# Copy the project files into the container, including composer.json
COPY . .

# Install Composer globally
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Run Composer install to install PHP dependencies
RUN composer install --no-scripts --no-autoloader

# Expose port 9000 for the PHP-FPM server
EXPOSE 9000

# Start PHP-FPM server
CMD ["php-fpm"]
