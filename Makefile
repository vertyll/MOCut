# Variable definitions
DOCKER_COMPOSE = docker-compose
COMPOSE_FILE = docker-compose.yml

# Default targets
.PHONY: all build up down start stop restart logs ps exec-backend exec-frontend exec-postgres

# Default target
all: build up

# Build containers
build:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) build

# Start containers in detached mode
up:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up -d

# Stop and remove all running containers
down:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down

# Start containers (if stopped)
start:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) start

# Stop all running containers
stop:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) stop

# Restart containers
restart: down up

# Show logs
logs:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) logs -f

# Show container status
ps:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) ps

# Access the running backend container
exec-backend:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) exec ${APP_NAME}-backend /bin/bash

# Access the running frontend container
exec-frontend:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) exec ${APP_NAME}-frontend /bin/bash

# Access the running postgres container
exec-postgres:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) exec ${APP_NAME}-postgres /bin/bash
