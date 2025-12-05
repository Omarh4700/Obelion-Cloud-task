#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive
sudo apt update
sudo apt install -y php8.3 php8.3-cli php8.3-fpm php8.3-mysql php8.3-xml php8.3-mbstring php8.3-curl php8.3-zip unzip apache2 libapache2-mod-php8.3

# Install Composer
cd /tmp
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"

# Configure Apache for Laravel
sudo a2enmod rewrite

# Create Apache virtual host configuration for Laravel
sudo bash -c 'cat > /etc/apache2/sites-available/000-default.conf << EOF
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /home/ubuntu/app/public

    <Directory /home/ubuntu/app/public>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF'

# Set proper permissions for /home/ubuntu
sudo chmod 755 /home/ubuntu

# Restart Apache to apply configuration
sudo systemctl restart apache2

echo "Backend server configuration completed successfully"