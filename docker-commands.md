### show all containers

docker ps -a

### show all running containers

docker ps

## One liner to stop / remove all of Docker containers:

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

### run on outside port 3000 using container port 80 [image_name] docker

EXPOSE 80 in the Dockerfile in the end is optional. It documents that a process in the container will expose this port. But you still need to then actually expose the port with -p when running docker run. So technically, -p is the only required part when it comes to listening on a port. Still, it is a best practice to also add EXPOSE in the Dockerfile to document this behavior.

docker run -p 3000:80 3ceb8a349ede


