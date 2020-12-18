#### dockerize mongo expose default port

##### we can connect from backend if expose port

docker run --name mongodb --rm -d -p 27017:27107 mongo

#### dockerize backend

add dockerfile

#### change host to connect to mongodb to host.docker.internal

#### create image

docker build -t backend-img .

#### run container

docker run --name backend-con --rm -d -p 80:80 backend-img

### React to container

add dockerfile

#### create image

docker build -t frontend-img .

#### run container

##### need to be run in interactive mode -it

docker run --name frontend-con --rm -d -p 3000:3000 -it frontend-img
