$env = $1

/bin/sh -c "composer update && composer symfony:dump-env $1 && php-fpm"