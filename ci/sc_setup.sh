#!/bin/sh

cd clone
export SAUCELABS_NAME=YOUR_NAME_FOR_SAUCELABS
export SAUCELABS_KEY=YOUR_KEY_FOR_SAUCELABS
phpenv local 5.6
composer install
cp .env.codeship .env
php artisan serve --port=8080 -n -q &
sleep 3