.PHONY: all build up down clean fclean re

all: build up

build:
	docker-compose -f srcs/docker-compose.yml build

up:
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

clean: down
	docker-compose -f srcs/docker-compose.yml rm -f

fclean: clean
	docker system prune -af
	docker volume prune -f

re: fclean all