BOX_IMAGE = "generic/ubuntu1604"
BOX_VERSION = "1.4.1"

HOSTS = {
   "jobup1" => "192.168.121.10",
   "jobup2" => "192.168.121.11",
   "jobup3" => "192.168.121.12",
}
Vagrant.configure(2) do |config|
  HOSTS.each do | (name, cfg) |
    ipaddr = cfg
    config.vm.define name do |machine|
      machine.vm.box = BOX_IMAGE
      machine.vm.box_version = BOX_VERSION
      machine.vm.network 'private_network', ip: ipaddr, netmask: "255.255.255.0"
      machine.vm.provision "file", source: "~/.ssh/id_ed25519.pub", destination: "~/.ssh/authorized_keys"
      machine.vm.hostname = name + ".ansible.dev"
      machine.vm.provision 'shell',
        privileged: true,
        run: 'once',
        inline:
          'mkdir -p /root/.ssh && ' +
          'cp /home/vagrant/.ssh/authorized_keys /root/.ssh/ && ' +
          'chown root:root /root/.ssh/authorized_keys && ' +
          'chmod 600 /root/.ssh/authorized_keys && ' +
          'echo "Done!"'
    end
  end
end
