### Connect to api - works with docker without setup

### Connect to DB on host machine

"mongodb://host.docker.internal:27017/swfavorites"

### Connect from container to DB on container

#### get mongo from docker hub https://hub.docker.com/_/mongo

docker run -d --name mongodb mongo

docker container inspect mongodb

##### get "NetworkSettings":{"IPAddress": [172.17.0.3]} this ip address of our container

change connection address to:

mongoose.connect(
"mongodb://172.17.0.3:27017/swfavorites" ....

##### build new image and run the container it should connect to mongo container

### Docker networks

#### create a network

docker network create favotites-net

#### connect mongo container to network

docker run -d --name mongodb --network favotites-net mongo

#### put mongo db container in node app connection

mongoose.connect(
"mongodb://[name_of_mongo_container]:27017/swfavorites",

#### rebuild image

docker build -t favorites-img .

#### connect server container to network

docker run --name favorites-con -d --network favotites-net --rm -p 3000:3000 favorites-img

### Docker Network Drivers

Docker Networks actually support different kinds of "Drivers" which influence the behavior of the Network.

The default driver is the "bridge" driver - it provides the behavior shown in this module (i.e. Containers can find each other by name if they are in the same Network).

The driver can be set when a Network is created, simply by adding the --driver option.

docker network create --driver bridge my-net
Of course, if you want to use the "bridge" driver, you can simply omit the entire option since "bridge" is the default anyways.

Docker also supports these alternative drivers - though you will use the "bridge" driver in most cases:

host: For standalone containers, isolation between container and host system is removed (i.e. they share localhost as a network)

overlay: Multiple Docker daemons (i.e. Docker running on different machines) are able to connect with each other. Only works in "Swarm" mode which is a dated / almost deprecated way of connecting multiple containers

macvlan: You can set a custom MAC address to a container - this address can then be used for communication with that container

none: All networking is disabled.

Third-party plugins: You can install third-party plugins which then may add all kinds of behaviors and functionalities

As mentioned, the "bridge" driver makes most sense in the vast majority of scenarios.
