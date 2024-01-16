# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ddyankov <ddyankov@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/15 14:37:48 by ddyankov          #+#    #+#              #
#    Updated: 2024/01/16 14:52:24 by ddyankov         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RED = \033[1;31m
GREEN = \033[1;32m
BLUE = \033[1;36m   
END = \033[0m

all:
	@echo "██ ███    ██  ██████ ███████ ██████  ████████ ██  ██████  ███    ██"
	@echo "██ ████   ██ ██      ██      ██   ██    ██    ██ ██    ██ ████   ██"
	@echo "██ ██ ██  ██ ██      █████   ██████     ██    ██ ██    ██ ██ ██  ██"
	@echo "██ ██  ██ ██ ██      ██      ██         ██    ██ ██    ██ ██  ██ ██"
	@echo "██ ██   ████  ██████ ███████ ██         ██    ██  ██████  ██   ████"
	@echo "$(GREEN)Creating Maria_DB Volume$(END)"
	@mkdir -p /home/$(USER)/data/mdb_vol
	@echo "$(GREEN)Creating WP Volume$(END)"
	@mkdir -p /home/$(USER)/data/wp_vol
	@echo "$(GREEN)Building the containers$(END)"
	@docker-compose -f srcs/docker-compose.yml up --build -d
#build images before running containers in detach mode, run in background

show:
	@echo "$(BLUE)These are the containers$(END)"
	@docker-compose -f srcs/docker-compose.yml ps

start:
	@echo "$(BLUE)Starting the containers$(END)"
	@docker-compose -f srcs/docker-compose.yml start

stop:
	@echo "$(BLUE)Stopping the containers$(END)"
	@docker-compose -f srcs/docker-compose.yml stop

restart:
	@echo "$(GREEN)Restarting the containers$(END)"
	@docker-compose -f srcs/docker-compose.yml restart

go_wordpress:
	@echo "$(GREEN)Logging into the wordpress container$(END)"
	@docker exec -it wordpress bash

go_nginx:
	@echo "$(GREEN)Logging into the NGINX container$(END)"
	@docker exec -it nginx bash
	
go_mariadb:
	@echo "$(GREEN)Logging into the MariaDB container$(END)"
	@docker exec -it mariadb bash

fclean:
	@docker-compose -f srcs/docker-compose.yml down
	@echo "$(RED)"Destroying everything"$(END)"
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@echo "$(RED)Removing Maria_DB Volume$(END)"
	@echo "$(RED)Removing WP Volume$(END)"
	@sudo rm -rf /home/$(USER)/data

re:	fclean all
