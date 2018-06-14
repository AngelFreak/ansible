Heartbeat
=========

Role that does heatbeat setup on Ubuntu based systems.
The role assumes that you have a primary, and a backup server.
The role is made for haproxy, but can be used for other usecases.

Requirements
------------

This role requires Ansible 2.2 or higher, and platform requirements are listed in the metadata file.

Role Variables
--------------
The variables that can be passed to this role and a brief description about them are as follows:

  The following veriables should be defined in the playbook:
  primary: proxyatest                   # The uname -n of the primary haproxy server
  primary_ip: 192.168.121.10            # The ip of the primary haproxy server
  backup: proxybtest                    # The uname -n of the backup haproxy server
  backup_ip: 192.168.121.11             # The ip of the backup haproxy server

  The following veriables should be defined in the defaults/main.yml
  heartbeat_password "1234"             # A password for the heartbeat auth
  interface: "enp0s8"                   # The network interface where heartbeat will be running on
  heartbeat_sharedip: "192.168.121.9"   # The shared ip for the heartbeat

Example Playbook
----------------

Installs, and configures heartbeat.

    - hosts: proxy
      roles:
        - { role: jix.heartbeat, primary: proxyatest, primary_ip: 192.168.121.10, backup: proxybtest, backup_ip: 192.168.121.11 }

Dependencies
------------

None.

License
-------

Unlicens

Author Information
------------------
AngelFreak
https://github.com/AngelFreak
