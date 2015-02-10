#!/bin/bash

if [ ! -f /var/www/index.php ]; then
  TMP_DIR=/tmp/drupal7
  WWW_DIR=/var/www
  mkdir -p ${TMP_DIR}
  drush dl --destination=${TMP_DIR} drupal-7
  mv ${TMP_DIR}/drupal*/sites/default/default.settings.php /tmp  # save for later use
  rm -rf ${TMP_DIR}/drupal*/sites
  mkdir -p ${WWW_DIR}
  mv ${TMP_DIR}/drupal*/* ${WWW_DIR}
  mv ${TMP_DIR}/drupal*/.gitignore ${WWW_DIR}
  mv ${TMP_DIR}/drupal*/.htaccess ${WWW_DIR}
  rmdir ${TMP_DIR}/*
  mkdir -p \
    ${WWW_DIR}/sites/default/files \
    ${WWW_DIR}/sites/all/modules/contrib \
    ${WWW_DIR}/sites/all/modules/custom \
    ${WWW_DIR}/sites/all/themes
  chmod 755 \
    ${WWW_DIR}/sites/all/modules/contrib \
    ${WWW_DIR}/sites/all/modules/custom \
    ${WWW_DIR}/sites/all/themes
  chmod 775 ${WWW_DIR}/sites/default/files
  if [ ! -f ${WWW_DIR}/sites/default/settings.php ]; then
    cp /tmp/default.settings.php ${WWW_DIR}/sites/default/settings.php
    chmod 0664 ${WWW_DIR}/sites/default/settings.php
    mv /tmp/default.settings.php ${WWW_DIR}/sites/default/ # put it back
  fi
  chown -R app:www-data ${WWW_DIR}
fi
