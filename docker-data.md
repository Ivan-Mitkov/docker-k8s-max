# Create named volume which is not destroyed when container is removed

docker run -d -p 3000:80 --rm --name feedbackapp -v feedback:/app/feedback feedback

docker run [detached] [map port 3000 to 80] [remove when stoped] [container with name feedbackapp] [create volume named feedback in our app map it with app/feedback in docker] [image name]
