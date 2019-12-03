#! /bin/bash
######### Variables #########
declare -a services
services=(cron ssh ntp samba apache2 ufw)

######## Function(s) ########
function pause() {
  read -n 1 -r -s
}

function show_changes() {
  for s in ${services[@]}; do
    sudo service $s status
    echo ''
  done
  pause

  echo -e "Date Script\n"
  sudo cat /var/test/date.txt
  echo ''
  pause

  # show disk mount status
  sudo fdisk -l
  echo ''
  pause

  # show user present and home directory
  id guest
  ls /home
  pause

  # show minecraft status
  sudo service minecraft status
  echo ''
  pause
}

#############################
########### START ###########

# apply initial configuration
sudo puppet apply /opt/puppetlabs/puppet/modules/fredonia_linux/init.pp
echo ''

# show status
show_changes
clear

#-------- muck things up ---------#
# remove date file
sudo rm /var/test/date.txt
ls /var/test
pause
echo ''

# unmount disk
#sudo unmount /dev/sdb1
#pause
#echo ''

# change user
sudo deluser
sudo rm -R /home/guest
# show user no longer present
# show user home directory deleted
id guest
ls /home
echo ''

# stop/start services
for s in ${services[@]}; do
  if [ $s = 'iptables' ]; then
    sudo service $s start
    sudo service $s status
  else
    sudo service $s stop
    sudo service $s status
  fi
  echo ''
done
pause

# stop/uninstall minecraft
sudo service minecraft stop

# uninstall minecraft

pause

clear

echo 'Waiting for puppet to update ...'

# wait for cronjob then,
show_changes

######### END ##########
########################
