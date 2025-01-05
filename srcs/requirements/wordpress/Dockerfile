FROM debian:12

# Install necessary packages for PHP
RUN apt-get update && apt-get -y install \
    wget \
    php \
    php-cgi \
    php-mysql \
    php-fpm \
    php-pdo \
    php-gd \
    php-cli \
    php-mbstring \
    && rm -rf /var/lib/apt/lists/*

# Create the folder to enable PHP start if it doesn't exist
RUN mkdir -p /run/php

# Copy the necessary tools to download WordPress
COPY ./tools/setup_wp.sh /usr/local/bin/
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/

# Set the working directory
WORKDIR /var/www/html/

# Expose port 9000
EXPOSE 9000

# Launch script
CMD ["setup_wp.sh"]