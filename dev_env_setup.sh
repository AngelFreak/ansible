#!/bin/bash
sudo xbps-install -Su vagrant
mkdir -p ~/ansible_dev/
mkdir -p ~/ansible_dev/roles
mkdir -p ~/ansible_dev/playbooks
cp Vagrantfile ~/ansible_dev/
cp ansible.cfg ~/ansible_dev/
vagrant plugin install vagrant-hostsupdater
cat >> ~/.ssh/config <<EOF
# For vagrant virtual machines
host 192.168.33.* *.ansible.dev
StrictHostKeyChecking no
UserKnownHostsFile=/dev/null
User root
LogLevel ERROR
EOF
