#!/bin/bash

##
# Color  Variables
##
green='\e[32m'
blue='\e[34m'
clear='\e[0m'

##
# Color Functions
##

ColorGreen(){
	echo -ne $green$1$clear
}
ColorBlue(){
	echo -ne $blue$1$clear
}

function install_ansible() {
    echo ""
    echo -ne "$(ColorGreen 'Installing Ansible')"
    sudo apt update

    sudo apt install software-properties-common

    sudo apt-add-repository --yes --update ppa:ansible/ansible

    sudo apt install ansible -y

    echo ""
}

function run_playbook() {
    echo ""
    echo -ne "$(ColorGreen 'Running Ansible Playbook')"
    echo ""

    case $1 in 
        1) ansible-playbook setup_18.04.yml ;;
        2) ansible-playbook setup_20.04.yml ;;
    esac

    echo -ne "$(ColorBlue '------------------------------------------')"
    echo -ne "$(ColorBlue '  Please close and open terminal sesion')"
    echo -ne "$(ColorBlue '------------------------------------------')"
}

function menu() {
    echo -ne "
    Setting up CLI Tools

    $(ColorGreen '1)') Ubuntu 18.04
    $(ColorGreen '2)') Ubuntu 20.04
    $(ColorGreen '0)') Exit
    $(ColorBlue 'Choose an option:') "
    read a
    case $a in 
        1) install_ansible; run_playbook $a; menu ;;
        2) install_ansible; run_playbook $a; menu;;
        0) exit 0;;
        *) echo -ne $red"Wrong option.\n"$clear; exit 0 ;;
    esac
}

## Calling the menu
menu
