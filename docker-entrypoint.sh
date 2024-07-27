#!/bin/bash

composer install && composer symfony:dump-env $1 && php-fpm

