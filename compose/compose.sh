# compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application's services. Then, with a single command, you create and start all the services from your configuration.
# automatically create a network and run all container in it.
docker -compose -f compose.yaml up -d
docker -compose -f compose.yaml down