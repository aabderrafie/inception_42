# Use Debian 12.8 as the base image
FROM debian:12

RUN apt update && apt install -y nginx openssl && apt clean

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/setup_nginix.sh /usr/local/bin/setup_nginix.sh


RUN chmod +x /usr/local/bin/setup_nginix.sh && mkdir -p /var/www/html/wordpress
EXPOSE 443

CMD ["/usr/local/bin/setup_nginix.sh"]
