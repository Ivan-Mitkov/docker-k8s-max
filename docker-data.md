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

docker run [detached] [map port 3000 to 80] [remove when stoped] [container with name feedback] [create volume named feedback in our app map it with app/feedback in docker] [create second volume as bind mount [get absolute path]:[map it with folder in docker container] ] [image name]

-v [name of the volume]:[map with container]

-v [map with container] anonymous volume
anonymous volume are mapped with some folder in local machine but we don't have access to it

##### if there is clashes between volumes the longer path, the more specific map in container override the less specific

we can create extra volume anonymous volume if there is clash
