
docker-machine create dev
eval "$(docker-machine env dev):
docker-compose build && docker-compose up

'''
  # in another window, run 'docker-machine ip'
  # to get the ip address, edit into the ssh_host_config here
  # then append it to your ~/.ssh/config file
  # (being sure to not duplicate previous entries)
  # and then you should be able to 'ssh control'
  # and do the course there
  #

  # note: if you use docker, replace any references 
  #       to 'eth1' (for vagrant) with 'eth0'
'''
