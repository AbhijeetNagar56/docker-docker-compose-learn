docker run -d \
  --name my_postgres_alt \
  -e POSTGRES_USER=appuser \
  -e POSTGRES_PASSWORD=secret123 \
  -e POSTGRES_DB=myappdb \
  -p 5433:5432 \
  -v pgdata_alt:/var/lib/postgresql/data \
  postgres:16

docker exec -it my_postgres_alt psql -U appuser -d myappdb

# postgresql://appuser:secret123@localhost:5433/myappdb
