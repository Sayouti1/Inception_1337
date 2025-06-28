all: start

start:
	docker compose -f ./srcs/docker-compose.yml up -d --build --remove-orphans
	docker ps

stop:
	docker compose -f ./srcs/docker-compose.yml down -v

re: stop start
