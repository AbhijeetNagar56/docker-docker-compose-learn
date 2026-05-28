# postgresql Container
docker run -d \
  --name my_postgres_alt \
  -e POSTGRES_USER=appuser \
  -e POSTGRES_PASSWORD=secret123 \
  -e POSTGRES_DB=myappdb \
  -p 5433:5432 \
  -v pgdata_alt:/var/lib/postgresql/data \
  postgres:16

# Run query
docker exec -it my_postgres_alt psql -U appuser -d myappdb
# DB_URL=postgresql://appuser:secret123@localhost:5433/myappdb

# MySql Container
docker run -d \
  --name my_mysql_alt \
  -e MYSQL_ROOT_PASSWORD=rootpass \
  -e MYSQL_DATABASE=myappdb \
  -e MYSQL_USER=appuser \
  -e MYSQL_PASSWORD=secret123 \ 
  # important to set the password for the user
  -p 3307:3306 \
  -v mysqldata_alt:/var/lib/mysql \
  mysql:8
# Run query
docker exec -it my_mysql_alt mysql -u appuser -p
# DB_URL=mysql://username:password@localhost:3306/dbname