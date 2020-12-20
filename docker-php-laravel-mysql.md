### laravel

https://laravel.com/docs/8.x/installation

composer create-project laravel/laravel

### docker-composer run only composer to install laravel

docker-compose run --rm composer create-project laravel/laravel .

### run laravel app with three services

docker-compose up -d server php mysql

### run laravel app only with server if add depends_on

docker-compose up -d server

### run laravel app and look if something is changes and there is need to rebuild

docker-compose up -d --build server

#### run artisan container

docker-compose run --rm artisan migrate
