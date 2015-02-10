
A Docker image packing PHP5 + nginx for Drupal 7.x web sites.

Usages
------

Test D7 modules (not for production, see below):

        # in your module's parent directory
        $ docker run -dt \
          -p 8080:80 -p 2222:22 -p 2020:20 -p 2121:21 \
          -v $(PWD):/var/www/sites/all/modules/custom \
          -v $(PWD)/.run/log:/var/log \
          --name my_awesome_module_testbox \
          pomin5/drupal7-nginx:latest
        # Go to <http://localhost:8080/> and finish D7 installer

Test a D7 site (not for production, see below):

        # in your site directory
        $ docker run -dt \
          -p 8080:80 -p 2222:22 -p 2020:20 -p 2121:21 \
          -v $(PWD):/var/www \
          -v $(PWD)/.run/log:/var/log \
          --name my_awesome_site_testbox \
          pomin5/drupal7-nginx:latest
        # Go to <http://localhost:8080/>.  You may need to edit `settings.php`

Or just run the container, and `drush` will download the latest D7 source code for you.

### SSH access

This image follows the practice of [Phusion baseimage](https://github.com/phusion/baseimage-docker#login_ssh) in regard of SSH access.  It contains a SSH publick key of my own.  So if you are using it for your production site, *build from this image and replace the public key with your own*.
