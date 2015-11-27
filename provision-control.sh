#
# control system provisioning script
#

sudo echo "######################################"
sudo echo "####  install ansible on control  ####"
sudo echo "######################################"
sudo apt-get install -y python-pip
sudo pip install ansible

sudo echo "######################################"
sudo echo "####  verify  ansible on control  ####"
sudo echo "######################################"
sudo ansible --version
sudo ansible-playbook --version
sudo ansible-galaxy --help

# set up ansible to reference files on the host os
#  - note: this assumes a /vagrant-nox synched folder 
#           mounted with no-execute set, due to a vagrant 1.9.x bug
#           (see the Vagrantfile for details)

sudo echo "######################################"
sudo echo "####  misc setup done to control  ####"
sudo echo "######################################"
sudo mkdir -p /etc/ansible
sudo ln -s /vagrant-nox/work/ansible.cfg /etc/ansible/ansible.cfg  
sudo ln -s /vagrant-nox/work/vimrc       /home/vagrant/.vimrc      
sudo ln -s /vagrant-nox/work/vimrc       /root/.vimrc
sudo ln -s /vagrant-nox/work             /home/vagrant/work


# force identity file we'll use
# this should be unneeded but seems to be needed as of lecture31
sudo echo "  identityfile ~/.ssh/id_rsa" >> ~/.ssh/config
sudo echo "  identityfile ~/.ssh/id_rsa" >> /home/vagrant/.ssh/config

# symlink out the vault password (lesson 38) to the mounted volume
# - this is of course ridiculous for a real system, but it lets
#   use automate this course to not have anything manual to do
sudo ln -s /vagrant-nox/control-vault-pass /home/vagrant/.vault_pass.txt

