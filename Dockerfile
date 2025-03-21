FROM php:8.4-fpm

ARG user
ARG uid

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libssl-dev \
    pkg-config \
    libcurl4-openssl-dev \
    libpcre3-dev \
    libbrotli-dev \
    nodejs \
    npm \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Install Swoole extension via PECL
RUN pecl install swoole && docker-php-ext-enable swoole

# Install Composer globally
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create a non-root user
RUN useradd -u $uid -ms /bin/bash -g www-data $user

WORKDIR /var/www

# Copy project files
COPY . /var/www

# Set correct permissions
COPY --chown=$user:www-data . /var/www

# Switch to non-root user
USER $user

# Install PHP & JS dependencies, then build assets
RUN composer install --no-dev --optimize-autoloader \
    && npm install \
    && npm run build

EXPOSE 9000

# Run Laravel Octane server with Swoole
CMD ["php", "artisan", "octane:start", "--server=swoole", "--host=0.0.0.0", "--port=9000"]
