# Create named volume which is not destroyed when container is removed

docker run -d -p 3000:80 --rm --name feedbackapp -v feedback:/app/feedback feedback

docker run [detached] [map port 3000 to 80] [remove when stoped] [container with name feedbackapp] [create volume named feedback in our app map it with app/feedback in docker] [image name]

if then the container is stopped and the start different container with the same

-v feedback:/app/feedback

the data is here

### show volumes

docker volume ls

### remove volumes

docker volume rm VOL_NAME

docker volume prune

## BIND MOUNDS changes are reflected in containers

affects the container not the image
create second volume with absolute path ro the folder which we want docker to use as bind volume. Connect a local path to some path in the container

in docker settings parent folder must be included in shared folders
in Windows it's included by default

##### this code is working

docker run -d -p 3000:80 --rm --name feedback -v feedback:/app/feedback -v "$(pwd -W):/app" -v app/node_modules feedback-node:volumes

##### this code is not working pwd wrong path

docker run -d -p 3000:80 --rm --name feedback -v feedback:/app/feedback -v "$(pwd):/app" -v app/node_modules feedback-node:volumes

##### this code is working

docker run -d -p 3000:80 --rm --name feedback -v feedback:/app/feedback -v "C:/Users/Ivan/Documents/docker_k8s_max/data-volumes-01-starting-setup/:/app" -v app/node_modules feedback-node:volumes

docker run [detached] [map port 3000 to 80] [remove when stoped] [container with name feedback] [create volume named feedback in our app map it with app/feedback in docker] [create second volume as bind mount [get absolute path]:[map it with folder in docker container] ] [create annonymous volume to app/node_modules - to use node_modules from image] [image name]

-v [name of the volume]:[map with container]

-v [map with container] anonymous volume
anonymous volume are mapped with some folder in local machine but we don't have access to it

##### if there is clashes between volumes the longer path, the more specific map in container override the less specific

we can create extra volume anonymous volume if there is clash

-v /app/node_modules tell docker to get node modules from image and not from bind mount, /app/node_modules is more specific than /app

#### using nodemon

for windows
add nodemon as dependancy

add "start": "nodemon -L server.js" in package.json

rebuild the image
run container

for logs use
docker logs [name of the container]

docker run -v /app/[name_of_the_folder] - create anonymous volume

docker run -v data:/app/[name_of_the_folder] - create named volume

docker run -v [/absolute_path/to/code/host_machine]:app/[name_of_the_folder] - create bind mount

anonymous volume - created specifically for a container- when container is removed the volume is removed too. Survives only container shutdown and restart. Can be used to prioritize container specific paths higher than external path

named volume - not tied to specific container, can be shared across containers, can be reused across restarts

bind mounts - location on host file system, not tied to specific container, can be reused across restarts

#### read only volumes

docker run -d -p 3000:80 --rm --name feedback -v feedback:/app/feedback -v "$(pwd -W):/app:ro" -v app/temp -v app/node_modules feedback-node:volumes

docker run [detached] [map port 3000 to 80] [remove when stoped] [container with name feedback] [create volume named feedback in our app map it with app/feedback in docker] [create second volume as bind mount [get absolute path]:[map it with folder in docker container] :[read_only]] [create annonymous volume to app/temp - NOT READ ONLY] [create annonymous volume to app/node_modules - to use node_modules from image] [image name]

### Managing volumes

docker volume ls

Not showing bind mounts

docker volume inspect [feedback]

Mountpoint is in the virtual machine path is not on our machine

#### COPY vs Bind Mount

Bind mount is used during development, in production we use snapshot so need COPY . .
