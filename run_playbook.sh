#!/bin/bash

set -o errexit  # Exit on any command failing 
set -o pipefail # Return non-zero status if any part of a pipeline fails


## Downloading needed files for the ansible playbook
echo "[+] Downloading Images and Binary for the playbook"

sudo curl -s -L -o roles/k3s_install/files/k3s https://github.com/k3s-io/k3s/releases/download/v1.30.5-rc1%2Bk3s1/k3s
sudo curl -s -L -o roles/k3s_install/files/k3s-airgap-images-amd64.tar.zst https://github.com/k3s-io/k3s/releases/download/v1.31.1%2Bk3s1/k3s-airgap-images-amd64.tar.zst

## Checking if Ansible is installed, and installing it in case it doesn't
ansible-playbook --version 2> /dev/null
a=$(echo $?)
if [[ a == "0" ]]; then
    echo "[+] Ansible is installed, skipping Ansible installation"
else
    echo "[-] Ansible is not installed, running Ansible installation"
    sudo apt update
    sudo apt install software-properties-common -y
    sudo apt install 
    sudo apt install ansible -y
fi
ansible-playbook main_playbook.yaml