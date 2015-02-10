#!/bin/bash

if [ ! -f /var/www/index.php ]; then
  TMP_DIR=/tmp/drupal7
  WWW_DIR=/var/www
  mkdir -p ${TMP_DIR}
  drush dl --destination=${TMP_DIR} drupal-7
  rm -rf ${TMP_DIR}/drupal*/sites
  mkdir -p ${WWW_DIR}
  mv ${TMP_DIR}/drupal*/* ${WWW_DIR}
  mv ${TMP_DIR}/drupal*/.gitignore ${WWW_DIR}
  mv ${TMP_DIR}/drupal*/.htaccess ${WWW_DIR}
  rmdir ${TMP_DIR}/*
  mkdir -p \
    ${WWW_DIR}/sites/default \
    ${WWW_DIR}/sites/all/modules/contrib \
    ${WWW_DIR}/sites/all/modules/custom \
    ${WWW_DIR}/sites/all/themes
fi
