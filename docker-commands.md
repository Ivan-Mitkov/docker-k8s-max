### show all containers

docker ps -a

### show all running containers

docker ps

## One liner to stop / remove all of Docker containers:

docker stop $(docker ps -a -q)

docker rm $(docker ps -a -q)

##### remove all not used images

docker image prune

##### remove tag images

docker image prune -a

### run on outside port 3000 using container port 80 [image_name] docker

EXPOSE 80 in the Dockerfile in the end is optional. It documents that a process in the container will expose this port. But you still need to then actually expose the port with -p when running docker run. So technically, -p is the only required part when it comes to listening on a port. Still, it is a best practice to also add EXPOSE in the Dockerfile to document this behavior.

##### atached mode

docker run -p 3000:80 3ceb8a349ede

show console log

#### attach again

docker attach f1c9277959729c3ffc29195aa957381f8ec9e142a6f802220ba8d5d10e251b8d

#### detached mode

docker start [name]

##### detached again with -d

docker run -p 4000:80 -d 2a8ea1e64332

don't show anything on the terminal

### Show logs

docker logs -f [name]

### using terminal

-i Keep STDIN open even if not attached

-t Allocate a pseudo-TTY

docker run -i -t

or combined

docker run -it

the same result

docker start -i

### show images

docker images

### automatically removing container when stop

docker run --rm [name]

### know more about an image

docker image inspect [name]
