create-traefik-network:
	docker network create traefik-web
up:
	docker-compose up -d
down:
	docker-compose down