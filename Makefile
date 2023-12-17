# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ddyankov <ddyankov@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/15 14:37:48 by ddyankov          #+#    #+#              #
#    Updated: 2023/12/17 14:41:23 by ddyankov         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RED = \033[0;31m
GREEN = \033[0;32m
BLUE = \033[1;34m   
END = \033[0m

all:
	@echo "$(BLUE)██ ███    ██  ██████ ███████ ██████  ████████ ██  ██████  ███    ██$(END)"
	@echo "$(BLUE)██ ████   ██ ██      ██      ██   ██    ██    ██ ██    ██ ████   ██$(END)"
	@echo "$(BLUE)██ ██ ██  ██ ██      █████   ██████     ██    ██ ██    ██ ██ ██  ██$(END)"
	@echo "$(BLUE)██ ██  ██ ██ ██      ██      ██         ██    ██ ██    ██ ██  ██ ██$(END)"
	@echo "$(BLUE)██ ██   ████  ██████ ███████ ██         ██    ██  ██████  ██   ████$(END)"
	@echo "$(GREEN)Creating Maria_DB Volume$(END)"
	@mkdir -p /home/$(USER)/data/mdb_vol
	@echo "$(GREEN)Creating WP Volume$(END)"
	@mkdir -p /home/$(USER)/data/wp_vol
#	docker-compose up -d

fclean:
	@echo "$(RED)Removing Maria_DB Volume$(END)"
	@rmdir /home/$(USER)/data/mdb_vol
	@echo "$(RED)Removing WP Volume$(END)"
	@rmdir /home/$(USER)/data/wp_vol

re:	fclean all