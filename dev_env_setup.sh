#!/bin/bash
sudo xbps-install -Su vagrant, ansible
#!/bin/bash
mkdir -p ~/ansible_dev/
mkdir -p ~/ansible_dev/roles
mkdir -p ~/ansible_dev/playbooks
mkdir -p ~/ansible_dev/host_vars
mkdir -p ~/ansible_dev/group_vars
cp Vagrantfile ~/ansible_dev/
cp ansible.cfg ~/ansible_dev/
vagrant plugin install vagrant-hostsupdater
cat >> ~/.ssh/config <<EOF
# For vagrant virtual machines
host 192.168.121.* *.ansible.dev
    StrictHostKeyChecking no
    UserKnownHostsFile=/dev/null
    User root
    LogLevel ERROR
EOF
cat > ~/ansible_dev/hosts <<EOF
[local]
localhost ansible_connection=local
EOF
