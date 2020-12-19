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

## Connecting with network

#### create network called goals

docker network create goals

##### run mongo container without port exposing

docker run --name mongodb --rm -d --network goals mongo

##### change address connected to mongo in backend

mongodb://mongodb:27017/course-goals

##### react is in the browser so connection is to localhost not backend-con and is not connected to the network

add proxy in package.json

"proxy": "http://localhost:3000"

change backend routes to /goals

##### run frontend and backend containers

###### -p 80:80 is for onnection with react

docker run --name backend-con -d --rm --network goals -p 80:80 backend

docker run --name frontend-con --rm -p 3000:3000 -it frontend

## Add data persistence

https://hub.docker.com/_/mongo

#### add named volume

docker run --name mongodb -d --rm -v data:/data/db --network goals mongo

#### add env for user and password

docker run --name mongodb -d --rm -v data:/data/db -e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGO_INITDB_ROOT_PASSWORD=secret --network goals mongo

#### change connection string in backend to add user and password

https://docs.mongodb.com/manual/reference/connection-string/
mongodb://mongoadmin:secret@mongodb:27017/course-goals?authSource=admin

#### if there are volumes which are created before auth must be removed or auth error occures

docker volume prune

### build backend image and run the container

docker build -t backend .

docker run --name backend-con -d --rm --network goals -p 80:80 backend


