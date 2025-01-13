.PHONY: all build up down clean fclean re status

all: build up

build:
	@echo "\033[1;34mBuilding Docker images...\033[0m"
	@docker-compose -f srcs/docker-compose.yml build > /dev/null
	@sudo mkdir -p /home/abderrafie/data/wordpress > /dev/null
	@sudo mkdir -p /home/abderrafie/data/mariadb > /dev/null
	@sudo mkdir -p /home/abderrafie/data/redis > /dev/null
	@echo "\033[1;34mBuild complete.\033[0m"

up:
	@echo "\033[1;32mSetting up directories and starting containers...\033[0m"
	@docker-compose -f srcs/docker-compose.yml up -d > /dev/null
	@echo "\033[1;32mContainers are up and running.\033[0m"

down:
	@echo "\033[1;33mStopping and removing containers...\033[0m"
	@docker-compose -f srcs/docker-compose.yml down > /dev/null
	@echo "\033[1;33mContainers stopped and removed.\033[0m"

clean: down
	@echo "\033[1;31mCleaning up...\033[0m"
	@docker volume prune -f > /dev/null
	@echo "\033[1;31mClean complete.\033[0m"

fclean: clean
	@echo "\033[1;31mPerforming a full clean...\033[0m"
	@docker system prune -af > /dev/null
	@if [ -n "$$(docker volume ls -q)" ]; then docker volume rm $$(docker volume ls -q) > /dev/null; fi
	@sudo rm -rf /home/abderrafie/data/* > /dev/null
	@echo "\033[1;31mFull clean complete.\033[0m"

re: fclean all
	@echo "\033[1;35mRebuilding everything...\033[0m"

status:
	@echo "\033[1;36mChecking Docker container status...\033[0m"
	@docker-compose -f srcs/docker-compose.yml ps
	@echo "\033[1;36mStatus check complete.\033[0m"