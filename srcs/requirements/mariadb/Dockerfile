FROM debian:12

WORKDIR /mariadb

RUN apt update && apt install mariadb-server -y

COPY tools/setup_mariadb.sh .

RUN chmod +x ./setup_mariadb.sh

EXPOSE 3306

# ENTRYPOINT ["./setup_mariadb.sh"]

CMD ["./setup_mariadb.sh"]