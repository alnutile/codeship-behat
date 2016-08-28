#!/bin/sh

###
# This is thanks to CodeShip Docs
# But I wanted a newer version of Selenium
###

SELENIUM_VERSION=${SELENIUM_VERSION:="2.53.1"}
SELENIUM_PORT=${SELENIUM_PORT:="4444"}
SELENIUM_OPTIONS=${SELENIUM_OPTIONS:=""}
SELENIUM_WAIT_TIME=${SELENIUM_WAIT_TIME:="10"}

set -e

MINOR_VERSION=${SELENIUM_VERSION%.*}
CACHED_DOWNLOAD="${HOME}/cache/selenium-server-standalone-${SELENIUM_VERSION}.jar"

wget --continue --output-document "${CACHED_DOWNLOAD}" "http://selenium-release.storage.googleapis.com/${MINOR_VERSION}/selenium-server-standalone-${SELENIUM_VERSION}.jar"
java -jar "${CACHED_DOWNLOAD}" -port "${SELENIUM_PORT}" ${SELENIUM_OPTIONS} -log /tmp/sel.log 2>&1 &
sleep "${SELENIUM_WAIT_TIME}"
echo "Selenium ${SELENIUM_VERSION} is now ready to connect on port ${SELENIUM_PORT}..."


## Now we are ready to talk to Selenium let's start the Application server
echo "Starting Laravel App"
cp .env.codeship .env
php artisan serve --port=8080 -n -q 2>/dev/null &
sleep 3