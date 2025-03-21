# Use PHP 8.4 FPM image
FROM php:8.4-fpm

# Install necessary extensions and tools
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    git \
    curl \
    libssl-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql zip \
    && apt-get clean

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Copy the Laravel application
COPY . .

# Install Laravel dependencies
RUN composer install --no-scripts --no-autoloader
RUN composer dump-autoload

# Expose port for PHP-FPM server
EXPOSE 9000

CMD ["php-fpm"]
