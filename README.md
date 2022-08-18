
**Note:** Currently only setup for use with Postgres


`dbt-metabase` is a dbt package that models the Metabase application database which contains detailed information about users, usage, questions and dashboards.

Inspired by this thread [Metabase Metadata SQL](https://discourse.metabase.com/t/metabase-metadata-sql/3688)

## Development

### Setup a virtual environment

We strongly recommend using virtual environments when developing code in `dbt-metabase`. We recommend creating this virtualenv
in the root of the `dbt-metabase` repository. 

To create a new virtualenv, run:
```sh
python3 -m venv env
source env/bin/activate
```

This will create and activate a new Python virtual environment.

### Installing Dependencies


#### Using the terminal

After you have activated your virtual environment

```sh
pip install -r requirements.txt
```

#### Using the Makefile

```sh
make install-dependencies
```

### Setup Environment

#### Using the Makefile (Recommended)

This option sets up Metabase, the Postgres DB and creates the schemas required using `docker exec`. You can do this yourself by looking at the code in the Makefile if you find it easier and/or don't have Make installed.

```sh
make setup-metabase
```

#### Using docker compose

```sh
docker-compose up -d database

docker ps -a --filter "name=database" --format "{{.ID}}"

# DATABASE_CONTAINER_ID is the output of the above docker ps command
docker exec -it <DATABASE_CONTAINER_ID> psql -U root dbt --command "CREATE DATABASE metabase";

docker-compose up -d metabase

```

### Bringing down the Environment

#### Using the Makefile 

```sh
make down
```

#### Using docker compose

```sh
docker-compose down
```
