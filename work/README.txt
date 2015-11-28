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

lecture 33
===========
he puts vars in three places:
  - in defaults in the role for pure defaults
  - on the role inclusions passing in variables
  - via a separate file via a group_vars/all file

lecture 43
==========
limit execution to a host via "--limit hostname" 

lecture 44
==========
add "--list-tags" to report which tags are where
add "--tags 'something'" to run just that
add "--skip-tags 'something'" to skip just that

lecture 45
==========
add "changed_when: false" to suppress showing changed and forcing just ok/failed result
see more complicated changed_when example in nginx/tasks/main.yml

lecture 46
==========
added commented out ansible.cfg stanza re: enabling pipelining for performance

lecture 48
==========
--step option
--list-tasks option
--start-at-task option

lecture 49
==========
--limit @/home/user/something.retry option to rerun just the last failed hosts based on retry files
