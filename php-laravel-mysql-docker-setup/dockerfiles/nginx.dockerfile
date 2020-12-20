# for not relying only to bind mounts, when deployed we will have snapshot 
FROM nginx:alpine

WORKDIR /etc/nginx/conf.d

COPY nginx/nginx.conf .

#rename nginx.conf to default.conf we are in /etc/nginx/conf.d
RUN mv nginx.conf default.conf

# switch working dir

WORKDIR /var/www/html

COPY src .