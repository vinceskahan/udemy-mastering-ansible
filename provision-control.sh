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
sudo ln -s /vagrant-nox/work             /vagrant/work

             	

