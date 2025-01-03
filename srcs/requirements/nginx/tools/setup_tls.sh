#!/bin/bash

# Exit on any error
set -e

# Directories for SSL certificates
SSL_DIR=/etc/nginx/ssl

# Create the SSL directory if not exists
mkdir -p ${SSL_DIR}

# Generate a self-signed SSL certificate
openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout ${SSL_DIR}/server.key \
    -out ${SSL_DIR}/server.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=IT Department/CN=${DOMAIN_NAME}"

# Start NGINX in the foreground
nginx -g 'daemon off;'
