#!/bin/bash
IFS=$'\n\t'
sudo apt-get -qq update && sudo apt-get -qq install jq -y
jq --version
echo ""
config=($(jq -r '.Project.provision|.[]' /vagrant/Vagrant.json))
printf "%s\n" ${config[@]}
