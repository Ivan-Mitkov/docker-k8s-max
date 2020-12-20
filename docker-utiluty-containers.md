### run container from official image to create working environment without installing node

docker run -it -d node

#### get the name of the container

### run commands while container is running

### create new project with package.json file in container

docker exec -it gifted_poincare npm init

### override the initial command [node] whith [npm init -y] the conrainer will stop after executing [npm init -y]

docker run -it node npm init -y

## Build a utility container

### need own image so we need Dockerfile

docker build -t [node-util] .

### cretae a project inside our host machine mirroring the container using bind mount

#### package.json appear in the host machine

docker run -it -v "$(pwd -W):/app" node-util npm init -y

## Docker compose

### run a single service

docker-compose run [service_name] [any_command_appended_to_ENTRYPOINT]

#### docker-compose run is not removing containers when stoped so --rm

docker-compose run --rm npm init
