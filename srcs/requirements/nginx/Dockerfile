# Use Debian 12.8 as the base image
FROM debian:12.8

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install NGINX and OpenSSL
RUN apt update && apt install -y nginx openssl && apt clean

# Copy the configuration files into the container
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/setup_tls.sh /usr/local/bin/setup_tls.sh

# Make the TLS setup script executable
RUN chmod +x /usr/local/bin/setup_tls.sh

# Expose port 443 for HTTPS
EXPOSE 443

# Run the TLS setup script and start NGINX
CMD ["/usr/local/bin/setup_tls.sh"]
