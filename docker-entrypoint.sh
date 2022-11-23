#!/bin/bash

composer install && composer symfony:dump-env $1 && yarn install && yarn build && php-fpm