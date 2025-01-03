# Use Debian 12.8 as the base image
FROM debian:12.8

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install MariaDB server and client
RUN apt update && apt install -y mariadb-server mariadb-client && apt clean

# Copy the configuration script into the container
COPY tools/setup_mariadb.sh /usr/local/bin/setup_mariadb.sh

# Make the script executable
RUN chmod +x /usr/local/bin/setup_mariadb.sh

# Expose MariaDB default port
EXPOSE 3306

# Run the setup script and start MariaDB
CMD ["/usr/local/bin/setup_mariadb.sh"]
