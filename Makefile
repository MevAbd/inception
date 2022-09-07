NAME		=	inception

all		: 	$(NAME)

$(NAME)		:
				sudo docker-compose -f srcs/docker-compose.yml up

install		:
				sudo docker-compose -f srcs/docker-compose.yml up --force-recreate --build

clean		:	
				sudo docker-compose -f srcs/docker-compose.yml down
re		:	fclean
				sudo docker rm -f $(docker ps -aq);sudo docker rmi -f $(docker images -q);sudo docker builder prune;sudo docker-compose -f srcs/docker-compose.yml up --force-recreate --build

fclean		:	clean
				sudo rm -rf /home/malbrand/data/pages/* /home/malbrand/data/db/* /home/malbrand/data/socket/*

.PHONY		:	all clean_host clean fclean
