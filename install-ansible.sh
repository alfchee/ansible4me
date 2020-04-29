#!/bin/bash

sudo apt update

sudo apt install software-properties-common

sudo apt-add-repository --yes --update ppa:ansible/ansible

sudo apt install ansible -y

ansible-playbook setup.yml

echo '------------------------------------------'
echo '  Please close and open terminal sesion'
echo '------------------------------------------'
