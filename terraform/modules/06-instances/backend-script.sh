#!/bin/bash

# Install PHP and Composer and docker
sudo apt update && sudo apt install -y php php-cli php-mbstring php-xml php-bcmath php-mysql php-curl php-zip unzip docker.io docker-compose

# Install Composer
cd /tmp
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer