# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :private_network, ip: "192.168.10.2"    # for NFS
  config.vm.synced_folder ".", "/vagrant", :nfs => true
  config.vm.provision :docker do |d|
    d.pull_images "pomin5/drupal7-nginx"
    d.run "drupal7_app",
      image: "pomin5/drupal7-nginx",
      args: "-p 80:80 -p 8022:22 -p 8020:20 -p 8021:21 \\
        -e ENABLE_FTP=1 \\
        -e ENABLE_MY_KEY=1 \\
        -v /vagrant/sites:/var/www/sites \\
        -v /vagrant/.run/log:/var/log"
  end
end
