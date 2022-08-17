.PHONY: install-dependencies
install-dependencies: ## Installs dependencies. You need to create a virtual environment first before running this.
	@\
	pip install --upgrade pip
	pip install -r requirements.txt

.PHONY: 
setup-metabase: setup-db ## Setups Metabase which depends on setting up the Postgres database
	docker-compose up -d metabase;

.PHONY: setup-db
setup-db: ## Sets up the Postgres database using docker compose and creates a database named metabase
	@\
	docker-compose up -d database; \
	DATABASE_CONTAINER_ID=$$(docker ps -a --filter "name=database"  --format "{{.ID}}"); \
	echo $$DATABASE_CONTAINER_ID; \
	sleep 10; \
	docker exec -it $$DATABASE_CONTAINER_ID psql -U root dbt --command "CREATE DATABASE metabase";

.PHONY: db-connect
db-connect: 
	DATABASE_CONTAINER_ID=$$(docker ps -a --filter "name=database"  --format "{{.ID}}"); \
	docker exec -it $$DATABASE_CONTAINER_ID psql -U root dbt



.PHONY: down
down: ## Brings down all the docker containers using docker-compose
	@\
	docker-compose down

