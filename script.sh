wget -q -O- https://downloads.opennebula.org/repo/repo.key | sudo apt-key add -
echo "deb https://downloads.opennebula.org/repo/6.1/Ubuntu/20.04 stable opennebula" | sudo tee /etc/apt/sources.list.d/opennebula.list

sudo apt update
sudo apt -y install mariadb-server
sudo mysql_secure_installation

sudo mysql -u root -p
CREATE DATABASE opennebula;
GRANT ALL PRIVILEGES ON opennebula.* TO 'oneadmin' IDENTIFIED BY 'StrongPassword';
FLUSH PRIVILEGES;
EXIT;


sudo apt update
sudo apt install opennebula opennebula-sunstone opennebula-gate opennebula-flow

sudo /usr/share/one/install_gems

sudo vim /etc/one/oned.conf

sudo ufw allow proto tcp from any to any port 9869

sudo systemctl start opennebula opennebula-sunstone
sudo systemctl enable opennebula opennebula-sunstone

sudo su - oneadmin -c "oneuser show"   
