lecture 06
============
the hosts file at the top of the ansible work tree results in ansible
finding the hosts pertinent to this set of playbooks etc. without needing
to edit the /etc/ansible/ansible.cfg file.

lecture 12
=============
added valid_cache_time=86400 to speed things up (actually covered in lecture 42)

lecture 15
==========
use of 'wget -qO- http://lb01' as an equivalent to 'curl lib01'

lecture 27
==========
mkdir roles
ansible-galaxy init rolenamehere


lecture 31
==========
for vagrant, it's eth1 not eth0 to edit (make sure it matches addresses in /etc/hosts)
