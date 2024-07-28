#!/bin/bash

php bin/console doctrine:migrations:migrate --no-interation --allow-no-migration --all-or-nothing && php-fpm

