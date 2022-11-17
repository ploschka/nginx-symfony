#!/bin/bash

composer update && composer symfony:dump-env $1 && php-fpm