#!/usr/bin/env bash
# Made by Sinfallas <sinfallas@yahoo.com>
# Licence: GPL-2
clear
git pull
docker network create network-pro
cp -f .env.example .env
docker compose --env-file .env -f docker-compose.yml build
if [[ $? = 0 ]]; then
	docker compose --env-file .env -f docker-compose.yml down
	docker compose --env-file .env -f docker-compose.yml up -d
	docker exec -it php-pro composer update --no-scripts
	docker exec -it php-pro composer install --optimize-autoloader --no-interaction --no-plugins --no-scripts --no-dev
	docker exec -it php-pro chown -R www-data:www-data /appdata/wwwroot/vendor
	docker exec -it php-pro chmod -R 777 /appdata/wwwroot/vendor
	docker exec -it php-pro chmod -R 777 /appdata/wwwroot/storage
	docker exec -it php-pro chmod -R 777 /appdata/wwwroot/bootstrap/cache
	docker exec -it php-pro php artisan key:generate
	docker exec -it php-pro php artisan migrate --force
	docker exec -it php-pro php artisan optimize:clear
	docker exec -it php-pro composer dumpautoload -o
	docker exec -it php-pro php artisan up
	docker exec -it php-pro php artisan cache:clear
else
	echo "El sistema ha detectado un error al construir el contenedor."
	exit 1
fi
echo "Finalizado."
exit 0
