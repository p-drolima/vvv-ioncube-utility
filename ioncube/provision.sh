#!/usr/bin/env bash

echo "Setting up Ioncube"

# Download Ioncube
wget http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz &> /dev/null
tar xvfz ioncube_loaders_lin_x86-64.tar.gz
sudo cp ioncube/ioncube_loader_lin_7.2.so /usr/lib/php/20170718/

# Create the PHP config file
cat > /etc/php/7.2/fpm/conf.d/00-ioncube.ini << EOF1
zend_extension = "/usr/lib/php/20170718/ioncube_loader_lin_7.2.so"
EOF1

# Restart 
sudo service nginx restart
sudo service php7.2-fpm restart

# Clean up
sudo rm ioncube_loaders_lin_x86-64.tar.gz
sudo rm -rf ioncube_loaders_lin_x86-64

echo "Ioncube setup complete!"
