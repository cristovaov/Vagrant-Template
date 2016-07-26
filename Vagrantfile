# -*- mode: ruby -*-
# # vi: set ft=ruby :
dir = File.dirname(File.expand_path(__FILE__))

require 'json'
json = File.read("#{dir}/Vagrant.json")
set = JSON.parse(json)

Vagrant.configure(2) do |config|
  config.ssh.forward_agent = true
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.define set['Project']['name'] do |project|
    project.vm.box = set['Project']['vagrant_box'] 
    if !set['Project']['box_hostname'].empty?
      project.vm.hostname = set['Project']['box_hostname']
    end
    project.vm.provider "virtualbox" do |vb|
      vb.name = set['Project']['name']
    end
    project.vm.network "private_network", ip: set['Project']['box_ip']    
    project.vm.provision "shell", path: "provision.sh", privileged: false    
    if set['Project'].has_key?("synced_folder")
      project.vm.synced_folder set['Project']['synced_folder']['host_path'], set['Project']['synced_folder']['guest_path'],
        create: true
    end 
  end
end
