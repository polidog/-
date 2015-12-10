# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'
config_yaml = YAML.load_file('vagrant_config.yml')

Vagrant.configure(2) do |config|
  config.vm.box = config_yaml['box']
  config.vm.network "private_network", ip: config_yaml['ip']

  config_yaml['synced_folders'].each do |syncde_folder|
    config.vm.synced_folder syncde_folder['host'], syncde_folder['guest'], type: syncde_folder['type']
  end


  config.vm.provider "virtualbox" do |vb|
    vb.memory = config_yaml['memory']
  end

  config.vm.provision :shell, :path => "./provision.sh", :privileged   => true
end
