#!/bin/sh

# Install the default config file if it does not exist
if [ ! -f /privatebin/cfg/conf.php ]; then
  mv /privatebin/conf.php /privatebin/cfg/conf.php
else
  rm -f /privatebin/conf.php
fi

# Prevent a PHP warning when privatebin try to create the .htaccess file under cfg directory
# This file is useless with for this nginx setup
touch /privatebin/cfg/.htaccess

# Fix permissions
chown -R $UID:$GID /privatebin /services /var/log /var/lib/nginx

# Permit nginx to log error to container stdout
chmod o+w /dev/stdout

# https://github.com/PrivateBin/PrivateBin/wiki/FAQ#what-are-the-recommended-file-and-folder-permissions-for-privatebin
find /privatebin -type f -exec chmod 0640 {} \;
find /privatebin -type d -exec chmod 0550 {} \;
find /privatebin/data -type f -exec chmod 0640 {} \;
find /privatebin/data -type d -exec chmod 0750 {} \;

# RUN !
exec su-exec $UID:$GID /bin/s6-svscan /services
