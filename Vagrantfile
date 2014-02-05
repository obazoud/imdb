# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian-wheezy-amd64"

  config.vm.box_url = "http://commondatastorage.googleapis.com/kyridev-box%2Fdebian-7.3.0.box"

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--cpus", 4]
    v.customize ["modifyvm", :id, "--memory", 4096]
  end
  
  config.vm.provision :shell do |shell|
    shell.path = "bootstrap.sh"
  end

end
