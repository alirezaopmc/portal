container=$(docker ps --format "{{.Names}}" | grep minecraft)

up:
	@docker compose up -d

down:
	@docker compose down

setup:
	@/bin/bash setup.sh

rcon:
	@docker exec $container rcon-cli $#