#!/bin/bash
sudo xbps-install -Su vagrant
mkdir -p ~/ansible_dev/
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
