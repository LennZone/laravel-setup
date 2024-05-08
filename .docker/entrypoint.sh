#!/bin/bash

#PHP_UID_DEFAULT=$(id -u www-data)
PROJECT_DIR="/var/www/html"

if [ ! $(find "$PROJECT_DIR" -maxdepth 0 -printf "%U\n" 2>/dev/null | grep -q "^www-data$") ]; then

  : "${USER_ID:=$(id -u www-data)}"
  : "${GROUP_ID:=$(id -g www-data)}"

  export USER_ID
  export GROUP_ID

  if [ "$GROUP_ID" != "$(id -u www-data)" ]; then
    echo "Need to change UID and GID"
    usermod -u "$USER_ID" www-data
    groupmod -g "$GROUP_ID" www-data
    chown -R www-data:www-data "$PROJECT_DIR"
    echo "UID and GID changed to $USER_ID and $GROUP_ID"
  fi
else
  echo "UID and GID are OK !"
fi

exec "$@"