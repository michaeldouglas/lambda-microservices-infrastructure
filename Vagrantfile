# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
      config.vm.box_url = "https://vagrantcloud.com/ubuntu/trusty64"
      config.vm.network :private_network, ip: "192.168.56.102"

      config.vm.provider :virtualbox do |v|
          v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
          v.customize ["modifyvm", :id, "--memory", 4000]
          v.customize ["modifyvm", :id, "--cpus", 2]
          v.customize ["modifyvm", :id, "--name", "containers"]
      end

      config.vm.synced_folder "/development/projects/developers/containers/developers-microservices", "/home/developers-microservices", create: true, owner: "vagrant", group: "www-data", mount_options: ["dmode=775,fmode=664"]

      config.vm.synced_folder "./ssl", "/var/ssl", create: true
      config.vm.synced_folder "./custom_config_files", "/var/custom_config_files", create: true

      config.vm.provision :shell, :path => "bootstrap.sh"
      config.vm.provision :shell, run: "always", :path => "call_containers/jenkins.sh"
      config.vm.provision :shell, run: "always", :path => "call_containers/containers.sh"
end
