# Use Debian 12.8 as the base image
FROM debian:12.8

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install PHP, PHP-FPM, and necessary extensions
RUN apt update && \
    apt install -y php-fpm php-mysql php-cli php-json php-common php-xml php-mbstring php-curl php-zip unzip wget && \
    apt clean

# Install WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    mkdir -p /var/www/html && \
    mv wordpress /var/www/html/ && \
    chown -R www-data:www-data /var/www/html/wordpress

# Copy the configuration script into the container
COPY tools/setup_php.sh /usr/local/bin/setup_php.sh

# Make the script executable
RUN chmod +x /usr/local/bin/setup_php.sh

# Expose PHP-FPM port
EXPOSE 9000

# Run the PHP-FPM service and setup script
CMD ["/usr/local/bin/setup_php.sh"]
