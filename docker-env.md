### ENV

in dockerfile

ENV [key] [value]

EXPOSE $[key]

#### in dockerfile expose 8080

#### in server.js use process.env.PORT

docker run -d -p 3000:8080 --rm --name feedback -v feedback:/app/feedback -v
"$(pwd -W):/app" -v app/node_modules feedback-node:env

#### env in dockerfile is just default value

### set env in command

##### expose port 9000 and set env PORT=9000

docker run -d -p 3000:9000 --env PORT=9000 --rm --name feedback -v feedback:
/app/feedback -v "$(pwd -W):/app" -v app/node_modules feedback-node:env

##### this is the same

docker run -d -p 3000:9000 -е PORT=9000 --rm --name feedback -v feedback:
/app/feedback -v "$(pwd -W):/app" -v app/node_modules feedback-node:env

If there are multiple env just add more -e [key] [value]

### using .env file

docker run -d -p 3000:7000 --env-file ./.env --rm --name feedback -v feedbac
k:/app/feedback -v "$(pwd -W):/app" -v app/node_modules feedback-node:env

--env-file [path_to_file from current folder and name of the file]

Depending on which kind of data you're storing in your environment variables, you might not want to include the secure data directly in your Dockerfile.

Instead, go for a separate environment variables file which is then only used at runtime (i.e. when you run your container with docker run).

Otherwise, the values are "baked into the image" and everyone can read these values via:

docker history <image>.
