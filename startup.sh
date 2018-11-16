#!/bin/bash

sed -i "s/#ZPUSH_HOST#/$ZPUSH_URL/" /var/www/html/config.php
sed -i "s/#ZIMBRA_HOST#/$ZIMBRA_HOST/" /var/www/html/config.php
sed -i "s/#ZIMBRA_SSL#/$ZIMBRA_SSL/" /var/www/html/config.php
apache2-foreground



# sed -i "s/https:\/\/192.168.210.225/http:\/\/192.168.210.225/" /var/www/html/config.php
# sed -i "s/https:\/\//http:\/\//" /var/www/html/autodiscover/autodiscover.php