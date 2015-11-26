# -*- mode: ruby -*-
# vi: set ft=ruby :

# README
#
# Getting Started:
# 1. vagrant plugin install vagrant-hostmanager
# 2. vagrant up
# 3. vagrant ssh
#
# This should put you at the control host
#  with access, by name, to other vms
Vagrant.configure(2) do |config|
  config.hostmanager.enabled = true

  config.vm.box = "ubuntu/trusty64"

  config.vm.define "control", primary: true do |h|
    h.vm.network "private_network", ip: "192.168.135.10"
    h.vm.hostname = "control"
    config.vm.synced_folder ".", "/vagrant"

    #-------------------------------------------------------------------------------------
    #
    # this workaround is needed if you symlink to the host os to keep your files under git
    # (fixed in upcoming ansible2 - see https://github.com/ansible/ansible/issues/10068)
    #
    # note: references to /vagrant below are "/vagrant-nox" in other VMs
    #
    config.vm.synced_folder ".", "/vagrant-nox", :mount_options => ["fmode=666"]
    #
    #-------------------------------------------------------------------------------------

    h.vm.provision :shell, :inline => <<'EOF'
if [ ! -f "/home/vagrant/.ssh/id_rsa" ]; then
  ssh-keygen -t rsa -N "" -f /home/vagrant/.ssh/id_rsa
fi

# this reference to /vagrant-nox is also due to the vagrant bug
cp /home/vagrant/.ssh/id_rsa.pub /vagrant-nox/control.pub

cat << 'SSHEOF' > /home/vagrant/.ssh/config
Host *
  StrictHostKeyChecking no
  UserKnownHostsFile=/dev/null
SSHEOF

chown -R vagrant:vagrant /home/vagrant/.ssh/
EOF
    # this reference to /vagrant-nox is also due to the vagrant bug
    h.vm.provision :shell, inline: 'sh /vagrant-nox/provision-control.sh'
  end

  config.vm.define "lb01" do |h|
    h.vm.network "private_network", ip: "192.168.135.101"
    h.vm.hostname = 'lb01'
    h.vm.provision :shell, inline: 'cat /vagrant/control.pub >> /home/vagrant/.ssh/authorized_keys'
  end

  config.vm.define "app01" do |h|
    h.vm.network "private_network", ip: "192.168.135.111"
    h.vm.hostname = 'app01'
    h.vm.provision :shell, inline: 'cat /vagrant/control.pub >> /home/vagrant/.ssh/authorized_keys'
  end

  config.vm.define "app02" do |h|
    h.vm.network "private_network", ip: "192.168.135.112"
    h.vm.hostname = 'app02'
    h.vm.provision :shell, inline: 'cat /vagrant/control.pub >> /home/vagrant/.ssh/authorized_keys'
  end

  config.vm.define "db01" do |h|
    h.vm.network "private_network", ip: "192.168.135.121"
    h.vm.hostname = 'db01'
    h.vm.provision :shell, inline: 'cat /vagrant/control.pub >> /home/vagrant/.ssh/authorized_keys'
  end
end


