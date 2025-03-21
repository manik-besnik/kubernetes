# Use the same Ubuntu image as the base
FROM ubuntu:20.04

# Install dependencies for Laravel and PHP
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
    nodejs \
    npm \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN apt-get update && apt-get install -y php php-fpm php-pdo php-mbstring php-xml php-bcmath

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory to the Laravel project
WORKDIR /var/www

# Copy Laravel project files into the container
COPY . /var/www

# Install PHP & JS dependencies, then build assets
RUN composer install --no-dev --optimize-autoloader && \
    npm install && npm run prod

# Expose port 9000 for the Swoole server
EXPOSE 9000

# Run Laravel Octane with Swoole
CMD ["php", "artisan", "octane:start", "--server=swoole", "--host=0.0.0.0", "--port=9000"]
