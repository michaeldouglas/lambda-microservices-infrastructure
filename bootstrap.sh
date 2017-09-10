# Install packages
sudo su
apt-get update && apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
software-properties-common \
awscli \
linux-image-extra-$(uname -r) \
linux-image-extra-virtual \
build-essential

# Instalarion of Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=armhf] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce

# Instalation of Docker Compose
curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Instalation of Docker Machine
curl -L https://github.com/docker/machine/releases/download/v0.5.3/docker-machine_linux-amd64 > docker-machine
sudo mv docker-machine /usr/local/bin/docker-machine
sudo chmod +x /usr/local/bin/docker-machine

# Node JS
#curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
#sudo apt-get install -y nodejs
#
#if [ ! -f /usr/bin/node ]; then
#	ln -s /usr/bin/nodejs /usr/bin/node
#fi

# Set timezone
echo "GMT" | tee /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

# Apache changes
sudo apt-get install -y apache2

echo "ServerName localhost" >> /etc/apache2/apache2.conf
a2enmod headers
a2enmod rewrite
a2enmod ssl
a2enmod proxy
a2enmod proxy_balancer
a2enmod proxy_http
a2enmod expires
a2enmod env
a2enmod deflate

cat /var/custom_config_files/apache2/default | tee /etc/apache2/sites-available/000-default.conf

cat /var/custom_config_files/apache2/ports | tee /etc/apache2/ports.conf

service apache2 restart