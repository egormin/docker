# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "/home/student/zabbix/mntlab-zabbix/sbeliakou-centos-7.3-x86_64-minimal.box"
  config.vm.network "private_network", ip:"192.168.50.199"
  config.vm.provision "shell", inline: <<-SHELL
    echo "***MAGIC***"
    rpm --import "https://sks-keyservers.net/pks/lookup?op=get&search=0xee6d536cf7dc86e2d7d56f59a178ac6c6238f52e" 
    yum update -y 
    yum install -y yum-utils 
    yum-config-manager --add-repo https://packages.docker.com/1.11/yum/repo/main/centos/7
    yum install -y docker-engine 
    usermod -a -G docker vagrant 
    wget https://bootstrap.pypa.io/get-pip.py
    python get-pip.py
    pip install docker-compose
    systemctl enable docker.service
    systemctl start docker.service
    cd /vagrant
    service network restart
    bash /vagrant/script
  SHELL
end