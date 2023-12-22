# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ddyankov <ddyankov@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/15 14:37:48 by ddyankov          #+#    #+#              #
#    Updated: 2023/12/22 12:30:49 by ddyankov         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RED = \033[0;31m
GREEN = \033[0;32m
BLUE = \033[1;34m   
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
	@docker-compose -f srcs/docker-compose.yaml up --build -d

fclean:
	@docker-compose -f srcs/docker-compose.yaml down
	@echo "$(RED)"Destroying everything"$(END)"
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@echo "$(RED)Removing Maria_DB Volume$(END)"
	@echo "$(RED)Removing WP Volume$(END)"
	@sudo rm -rf /home/$(USER)/data

re:	fclean all
